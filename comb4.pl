#!/usr/bin/perl 

# Modules used 
use strict; 
use warnings; 

# comb4.pl, a perl program to discover and record all four-digit non repeating combinations possible from a 3x3 grid.
# The combinations are further restricted by the boggle rule, meaning each selection must be adjacent to the previous
# selection vertically, horizontally, or diagonally.
# by Cy Kurtz(cykurtz@gmail.com)

# 1 2 3
# 4 5 6
# 7 8 9 

my @a = ("245","13456","256","12578","12346789","23589","458","45679","568");
my $op1;
my $op2;
my $op3;
my $op4;
my $num1;
my $num2;
my $num3;
my $num4;
my $path;
my $file=("./flwords.txt");
my $file2=("./comb4.txt");
open (DUMP,'>',$file2) or die("Could not open file2.");

my $w;
my $x;
my $y;
my $z;

#
#choosing the first number
#
for($w=1;$w<10;$w++){#begin w 
$num1=$w;
$path=$num1;
#establish options for the next number
$op1=$a[$num1-1];
print("\n1st sel $num1 options $op1");

#
#choosing the second number
#
for($x=1;$x<length($op1)+1;$x++){#begin x 
	$num2=substr $op1,$x-1,1;
	$op2=$a[$num2-1];
	$path=$num1.$num2;
	print("\n\t2nd sel $num2 options $op2, path $path");

#choosing the third number
#
for($y=1;$y<length($op2)+1;$y++){#begin y 
	$num3=substr $op2,$y-1,1;
	$op3=$a[$num3-1];
	$path=$num1.$num2.$num3;
	print("\n\t\t3rd sel $num3 options $op3 path $path");

#choosing the fourth number

for($z=1;$z<length($op3)+1;$z++){#begin z 
	$num4=substr $op3,$z-1,1;
	$op4=$a[$num4-1];
	$path=$num1.$num2.$num3.$num4;
	print("\n\t\t\t4th sel $num4 path $path");
	#This big if does a lot of heavy lifting, filtering out hundreds of dupes
	if($num4 != $num3 and $num4 != $num2 and $num4 != $num1 and $num3 != $num2 and $num3 != $num1 and $num2 != $num1){print DUMP ($path,"\t");}
				}#end z
			}# end y
		}#end x
		
	}#end w
close DUMP;
print("\n\n");
exit 0;

