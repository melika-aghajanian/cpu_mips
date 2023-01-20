#include <QFile>
#include <QTextStream>
#include <QString>
#include <QDebug>
void ManageFile (QString Path);
void Decode (QString ins, QString * mchincode);
int * asmbly2int (QString ins , int * ans);
QString int2bin (int num , int size);
QString int2hex (int num);
int main (void)
{
    QString tmp = __FILE__ ;
    int ps = tmp.size() ;
    QString Path ;
    for (int i = 0 ; i<ps-8 ; i++ )
        Path += tmp[i] ;
    ManageFile(Path);
    return 0;
}
void ManageFile (QString Path)
{
    QFile insfile ( Path + "in.txt") ;
    QFile mchincd ( Path + "BIN-out.txt") ;
    QFile hexmchin ( Path + "HEX-out.txt") ;
    if (!insfile.open(QIODevice::ReadOnly)&& insfile.exists())
    {
        qInfo() << insfile.errorString() << __LINE__ << "\n"  ;
        return;
    }
    if (!mchincd.open(QIODevice::WriteOnly)&& mchincd.exists())
    {
        qInfo() << mchincd.errorString() << __LINE__ << "\n"  ;
        return;
    }
    if (!hexmchin.open(QIODevice::WriteOnly)&& hexmchin.exists())
    {
        qInfo() << hexmchin.errorString() << __LINE__ << "\n"  ;
        return;
    }
    QTextStream instxts (&insfile) ;
    instxts.seek(0);
    QTextStream mchtxts (&mchincd) ;
    mchtxts.seek(0);
    QTextStream hextxts (&hexmchin) ;
    hexmchin.seek(0);
    QString * mchincode = new QString [2] ;
    while (!instxts.atEnd())
    {
        Decode(instxts.readLine(),mchincode) ;
        mchtxts << mchincode[0] << "\n";
        hextxts << mchincode[1] << "\n" ;
    }
    delete [] mchincode ;
    insfile.close() ;
    mchincd.close() ;
}
void Decode (QString ins , QString * mchincode)
{
    int * arr = new int [5] ;
    int * part = asmbly2int(ins , arr) ;
    int opcode ;
    opcode = part[0] ;
    mchincode[0] = int2bin(opcode,4) ;//opc
    mchincode[1] = "0x" + int2hex(opcode) ;//opc
    if (opcode >= 0 and opcode <=5)
    {
        mchincode[0] += int2bin(part[2],4) ;//rs
        mchincode[0] += int2bin(part[3],4) ;//rt
        mchincode[0] += int2bin(part[1],4) ;//rd
        mchincode[1] += int2hex(part[2]) ;//rs
        mchincode[1] += int2hex(part[3]) ;//rt
        mchincode[1] += int2hex(part[1]) ;//rd
    }
    else if (opcode>=6 and opcode<=9)
    {
        if (opcode == 8)// sti (store immadiate) imm == 8 bit
        {
            mchincode[0] += int2bin(part[1],4) ;//rt
            mchincode[0] += int2bin(part[2],8) ;//imm
            mchincode[1] += int2hex(part[1]) ;//rt
            mchincode[1] += int2hex(part[2]) ;//imm
        }
        else
        {
            mchincode[0] += int2bin(part[1],4) ;//rs
            mchincode[0] += int2bin(part[2],4) ;//rt
            mchincode[0] += int2bin(part[3],4) ;//imm
            mchincode[1] += int2hex(part[1]) ;//rs
            mchincode[1] += int2hex(part[2]) ;//rt
            mchincode[1] += int2hex(part[3]) ;//imm
        }

    }
    else if (opcode == 10 )//jump => imm == 12 bit
    {
        mchincode[0] += int2bin(part[1],12) ;//imm
        mchincode[1] += int2hex(part[1]) ;//imm
    }
    delete [] arr ;
    // return mchincode;
}
int * asmbly2int (QString ins , int * ans)
{
    QStringList part = ins.split(' ') ;
    if (part[0] == "add")
    {
        ans[0] = 0 ;
        ans[1] = part[1].toInt();
        ans[2] = part[2].toInt();
        ans[3] = part[3].toInt();
    }
    else if (part[0] == "sub")
    {
        ans[0] = 1 ;
        ans[1] = part[1].toInt();
        ans[2] = part[2].toInt();
        ans[3] = part[3].toInt();
    }
    else if (part[0] == "lt")
    {
        ans[0] = 2 ;
        ans[1] = part[1].toInt();
        ans[2] = part[2].toInt();
        ans[3] = part[3].toInt();
    }
    else if (part[0] == "or")
    {
        ans[0] = 3 ;
        ans[1] = part[1].toInt();
        ans[2] = part[2].toInt();
        ans[3] = part[3].toInt();
    }
    else if (part[0] == "and")
    {
        ans[0] = 4 ;
        ans[1] = part[1].toInt();
        ans[2] = part[2].toInt();
        ans[3] = part[3].toInt();
    }
    else if (part[0] == "shl")
    {
        ans[0] = 5 ;
        ans[1] = part[1].toInt();
        ans[2] = part[2].toInt();
        ans[3] = part[3].toInt();
    }
    else if (part[0] == "ld")
    {
        ans[0] = 7 ;
        ans[1] = part[1].toInt();
        ans[2] = part[2].toInt();
        ans[3] = part[3].toInt();
    }
    else if (part[0] == "st")
    {
        ans[0] = 6 ;
        ans[1] = part[1].toInt();
        ans[2] = part[2].toInt();
        ans[3] = part[3].toInt();
    }
    else if (part[0] == "sti")
    {
        ans[0] = 8 ;
        ans[1] = part[1].toInt();
        ans[2] = part[2].toInt();
    }
    else if (part[0] == "br")
    {
        ans[0] = 9 ;
        ans[1] = part[1].toInt();
        ans[2] = part[2].toInt();
        ans[3] = part[3].toInt();
    }
    else if (part[0] == "jmp")
    {
        ans[0] = 10 ;
        ans[1] = part[1].toInt();
    }
    return ans;
}
QString int2bin (int num , int size)
{
    QString bin ;
    for (int i = 1 << (size-1); i>0 ; i/= 2)
    {
        if((num & i) != 0)
            bin += "1" ;
        else
            bin += "0" ;
    }
    return bin;
}
QString int2hex (int num)
{
    QString hex ;
    int temp = num;
    int r ;
    if (temp==0)
        return hex="0";
    while (temp != 0)
    {
        r = temp % 16;
        if (r < 10)
            hex += (QChar)(r + 48);
        else
            hex += (QChar)(r + 55);
        temp /= 16;
    }
    return hex ;
}
