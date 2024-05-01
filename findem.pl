#!/usr/bin/perl 

# Modules used 
use strict; 
use warnings; 

# Print function 
#print("Hello World\n"); 

my $i;
my $alphabet=("abcdefghiklmnoprstuvwy");
my $let;
my $sel;
my $grid="";
my $vow=0;
my $comb;
my $word;
my $check;
my $list="";
my $count=0;
$alphabet=uc($alphabet);
#print("\n$alphabet\n\n");
while($count<4 or $count>16){
open(COMB,"./comb4r.txt") or die("Couldn't open COMB");
$vow=0;
$list="";
$count=0;
$grid="";
while($vow < 3 or $vow > 5){
	print("\n");
	$grid="";
	$vow=0;
	$word="";
for($i =1;$i<10;$i++){
		$sel=int(1.5+rand(21));
		$let=substr $alphabet,$sel-1,1;
		if($let eq "A"){$vow=$vow+1;}
		if($let eq "E"){$vow=$vow+1;}
		if($let eq "I"){$vow=$vow+1;}
		if($let eq "O"){$vow=$vow+1;}
		if($let eq "U"){$vow=$vow+1;}
		print("$let\t");
		if (int($i/3)==$i/3){print("\n");}
		$grid=$grid.$let;
			}#end $i
		print("\n$vow vowels\n\n");
		}#end while vowels


# grid established .. starting to check combs, words, and checks

	foreach $comb(<COMB>){
			open(CHECK,"./flwords.txt") or die("Couldn't open CHECK");
		chomp $comb;
		#print $comb;
		$word="";
		for($i=1;$i<5;$i++){
			$sel=substr $comb,$i-1,1;
			$let=substr $grid,$sel-1,1;
			$word=$word.$let;
			}#end $i
			chomp $word;
			foreach $check(<CHECK>){
				$check=uc($check);
				chomp $check;
				#print("$comb/$word/$check\t");
				if($check eq $word){#print("$word - $comb - is a word!\n");
					if(index($list,$word)==-1){
						$list=$list."/".$word;
						$count=$count+1;
						}#end if index
					}#end if eq
				}#end CHECK
				close (CHECK);
				}#end COMB
			close (COMB);
close (CHECK);
if(length($list)>0){$list=substr $list,1;}
print("$count words -- $list\n\n");
	}#end while count
#print("$count words -- $list\n\n");
open(OUT,"> ./fourdle.txt") or die("Couldn't open OUT");
print OUT "$grid\n";
print OUT "$list\n";
print OUT "$count\n";
close (OUT);



