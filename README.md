# cpu_mips

R type
add:		Add:					0000:	$Rd,$Rs,$Rt:	$Rd = $Rs + $Rt
sub:		Sub						0001:	$Rd,$Rs,$Rt:	$Rd = $Rs - $Rt
lt:			less than			0010:	$Rd,$Rs,$Rt:	if $Rs < $Rd then $Rd = 1 else 0
or:			Or						0011:	$Rd,$Rs,$Rt:	$Rd = $Rs or $Rt
and:		And						0100:	$Rd,$Rs,$Rt:	$Rd = $Rs and $Rt
shl:		shift left		0101: $Rd,$Rs,$Rt:	$Rd = $Rs << $Rt

I type
ld:			Load					0110:	$Rs,$Rt,imm:	$Rt = MEM[$Rs + (ZeroExtend)imm]
st:			Store					0111:	$Rs,$Rt,imm:	MEM[$Rs + (ZeroExtend)imm] = $Rt

sti:		Store imm			1000:	$Rt,imm    :	$Rt = (ZeroExtend)imm
br:			Branch				1001:	$Rs,$Rt,tar:	if $Rs = $Rt jump to tar

J type
jmp:		jump					1010:	j tar	  :		jump anyway
