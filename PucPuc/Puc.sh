#!/bin/bash
declare -A matrix
num_rows=49 #49
num_columns=20 #20
dolzina=9
znak1=${1:-"a"}
znak2=${2:-"b"}
ende=0
A1=0
A2=0
A3=0
B1=0
B2=0
B3=0

function defA {
	if [ $tA -eq 4 ]; then 
		i2A=$cA
		stevec3A=0
		((tA--))
	elif [ $tA -eq 3 ]; then
		iA=$cA
		stevec2A=0
		((tA--))
	elif [ $tA -eq 2 ]; then
		ii=$cA
		stevec1A=0
		((tA--))
	fi
	
	((stevec1A+3==num_columns)) && ((A1==0)) && ((tA=$tA+1)) && ((ii>=zB)) && ((ii<=kB))  && ((ziB--))
	((stevec1B-3==0)) && ((B1==0)) && ((tB++)) && ((iii>=zA)) && ((iii<=kA))  && ((ziA--))
	
	((stevec2A+3==num_columns)) && ((A2==0))  && ((tA=$tA+1)) && ((iA>=zB)) && ((iA<=kB))  && ((ziB--))
	((stevec2B-3==0)) && ((B2==0))  && ((tB++)) && ((iB>=zA)) && ((iB<=kA))  && ((ziA--))
	
	((stevec3A+3==num_columns)) && ((A3==0))  && ((tA=$tA+1)) && ((i2A>=zB)) && ((i2A<=kB)) && ((ziB--))
	((stevec3B-3==0)) && ((B3==0))  && ((tB++)) && ((i2B>=zA)) && ((i2B<=kA))  && ((ziA--))
	
	A1=1
	A2=1
	A3=1
	B1=1
	B2=1
	B3=1
	
}

function defB {
	if [ $tB -eq 4 ]; then 
		i2B=$cB
		stevec3B=$num_columns
		((tB--))
	elif [ $tB -eq 3 ]; then
		iB=$cB
		stevec2B=$num_columns
		((tB--))
	elif [ $tB -eq 2 ]; then
		iii=$cB
		stevec1B=$num_columns
		((tB--))
	fi
	
	((stevec1A+3==num_columns)) && ((A1==0)) && ((tA++)) && ((ii>=zB)) && ((ii<=kB))  && ((ziB--))
	((stevec1B-3==0)) && ((B1==0)) && ((tB++)) && ((iii>=zA)) && ((iii<=kA))  && ((ziA--))
	
	((stevec2A+3==num_columns)) && ((A2==0))  && ((tA++)) && ((iA>=zB)) && ((iA<=kB))  && ((ziB--))
	((stevec2B-3==0)) && ((B2==0))  && ((tB++)) && ((iB>=zA)) && ((iB<=kA))  && ((ziA--))
	
	((stevec3A+3==num_columns)) && ((A3==0))  && ((tA++)) && ((i2A>=zB)) && ((i2A<=kB)) && ((ziB--))
	((stevec3B-3==0)) && ((B3==0))  && ((tB++)) && ((i2B>=zA)) && ((i2B<=kA))  && ((ziA--))
	
	A1=1
	A2=1
	A3=1
	B1=1
	B2=1
	B3=1
	
}

trap 'sA=0' SIGUSR1
trap 'sA=1' SIGUSR2
trap 'defA' SIGQUIT

trap 'sB=0' SIGTERM
trap 'sB=1' SIGCONT
trap 'defB' SIGTTIN



function Igrac { # prva komponenta koliko je puta prazno, printa n, printa $3 puta n
	for (( i = 1; i <= $(($1*2)); i++ )); do
		echo -n " ";
	done
	for (( i = 1; i <= $(($3)); i++ )); do
		echo -n $2;
	done
	echo 
}




for ((i=1;i<=num_rows;i++)) do
    for ((j=1;j<=num_columns;j++)) do
        matrix[$i,$j]="*"
    done
done

ispis=0

ii=200
iA=200
i2A=200

iii=190
iB=190
i2B=190

pA=0
sA=0  # ako je 0 ide u desno za 1 ide u levo
cA=5 #Cemtar prvog igraca odakle idu projektili
zA=0 #zacetek intervala A
kA=9 #konec intervala A
ziA=4 #3 zivota ima A
tA=4 #t hica ima A

pB=0
sB=0  # ako je 0 ide u desno za 1 ide u levo
cB=5 #Cemtar drugog igraca odakle idu projektili
zB=0 #zacetek intervala B
kB=9 #konec intervala B
ziB=4 #3 zivota ima B
tB=4 #t hica ima B

stevec1A=100
stevec2A=100
stevec3A=100
stevec1B=-200
stevec2B=-200
stevec3B=-200

clear
while sleep 0.15; do
clear

	#echo PID = $$
	echo
	echo
	
	echo $znak1: $(($ziA-1)) x ❤️"                                   "$(($tA-1)) x 🚀
	echo
	echo


	Igrac $pA $znak1 $dolzina
	for ((j=1;j<=num_columns;j++)) do
		for ((i=1;i<=num_rows;i++)) do
		
		
		    ((i==$ii)) && ((j==stevec1A)) && echo -n "${matrix[$i,$j]}" && ispis=1
		    
		    ((i==$ii)) && ((j==stevec1A+1)) && echo -n "${matrix[$i,$j]}" && ispis=1
		    
		    ((i==$ii)) && ((j==stevec1A+2)) && echo -n "${matrix[$i,$j]}" && ispis=1
		    
		    ((i==$ii)) && ((j==stevec1A+3)) && echo -n "${matrix[$i,$j]}" && ispis=1
		    
		    
		    ((i==$iA)) && ((j==stevec2A)) && echo -n "${matrix[$i,$j]}" && ispis=1
		    
		    ((i==$iA)) && ((j==stevec2A+1)) && echo -n "${matrix[$i,$j]}" && ispis=1
		    
		    ((i==$iA)) && ((j==stevec2A+2)) && echo -n "${matrix[$i,$j]}" && ispis=1
		    
		    ((i==$iA)) && ((j==stevec2A+3)) && echo -n "${matrix[$i,$j]}" && ispis=1
		    
		    
		    ((i==$i2A)) && ((j==stevec3A)) && echo -n "${matrix[$i,$j]}" && ispis=1
		    
		    ((i==$i2A)) && ((j==stevec3A+1)) && echo -n "${matrix[$i,$j]}" && ispis=1
		    
		    ((i==$i2A)) && ((j==stevec3A+2)) && echo -n "${matrix[$i,$j]}" && ispis=1
		    
		    ((i==$i2A)) && ((j==stevec3A+3)) && echo -n "${matrix[$i,$j]}" && ispis=1
		    
		    
		    
		    ((i==$iii)) && ((j==stevec1B)) && echo -n "${matrix[$i,$j]}" && ispis=1
		    
		    ((i==$iii)) && ((j==stevec1B-1)) && echo -n "${matrix[$i,$j]}" && ispis=1 
		    
		    ((i==$iii)) && ((j==stevec1B-2)) && echo -n "${matrix[$i,$j]}" && ispis=1
		    
		    ((i==$iii)) && ((j==stevec1B-3)) && echo -n "${matrix[$i,$j]}" && ispis=1 
		    
		    
		    
		    ((i==$iB)) && ((j==stevec2B)) && echo -n "${matrix[$i,$j]}" && ispis=1
		    
		    ((i==$iB)) && ((j==stevec2B-1)) && echo -n "${matrix[$i,$j]}" && ispis=1 
		    
		    ((i==$iB)) && ((j==stevec2B-2)) && echo -n "${matrix[$i,$j]}" && ispis=1
		    
		    ((i==$iB)) && ((j==stevec2B-3)) && echo -n "${matrix[$i,$j]}" && ispis=1
		    
		    
		    
		    ((i==$i2B)) && ((j==stevec3B)) && echo -n "${matrix[$i,$j]}" && ispis=1
		    
		    ((i==$i2B)) && ((j==stevec3B-1)) && echo -n "${matrix[$i,$j]}" && ispis=1 
		    
		    ((i==$i2B)) && ((j==stevec3B-2)) && echo -n "${matrix[$i,$j]}" && ispis=1
		    
		    ((i==$i2B)) && ((j==stevec3B-3)) && echo -n "${matrix[$i,$j]}" && ispis=1
		    
		    ((ispis==0)) && echo -n " " 
		    
		    
		    ispis=0
		    
		    
			    
		done
		echo
	done
	
	Igrac $pB $znak2 $dolzina
	echo
	echo
	echo $znak2: $(($ziB-1)) x ❤️"                                   "$(($tB-1)) x 🚀
	
	
	
	if (($sA==0)) ; then
		((pA!=num_columns)) && ((pA+=1)) && ((zA+=2)) && ((kA+=2)) && ((cA+=2)) || pA=$num_columns
	else
		((pA!=0)) && ((cA-=2)) && ((kA-=2)) && ((zA-=2)) && ((pA-=1))  || pA=0
	fi
	
	if (($sB==0)) ; then
		((pB!=num_columns))  && ((pB+=1)) && ((zB+=2)) && ((kB+=2)) && ((cB+=2))  || pB=$num_columns
	else
		((pB!=0))  && ((cB-=2)) && ((kB-=2)) && ((zB-=2)) && ((pB-=1))  || pB=0
	fi
	
	
	
	(($stevec3A+3==$num_columns)) && (($A3==0)) && ((tA=$tA+1)) && (($i2A>=$zB)) && (($i2A<=$kB)) && ((--ziB)) # <- Tu te nesto zeza
	((stevec3B-3==0)) && ((B3==0)) && ((tB++)) && ((i2B>=zA)) && ((i2B<=kA))  && ((ziA--))
	
	((stevec1A+3==num_columns)) && ((A1==0)) && ((tA=$tA+1)) && ((ii>=zB)) && ((ii<=kB))  && ((--ziB))
	((stevec1B-3==0)) && ((B1==0)) && ((tB++)) && ((iii>=zA)) && ((iii<=kA))  && ((ziA--))
	
	((stevec2A+3==num_columns)) && ((A2==0)) && ((tA=$tA+1)) && ((iA>=zB)) && ((iA<=kB))  && ((--ziB))
	((stevec2B-3==0)) && ((B2==0)) && ((tB++)) && ((iB>=zA)) && ((iB<=kA))  && ((ziA--))
	
	
	
	if ((ziA==1)); then
		clear
		cat GameOver
		echo
		echo
		echo $znak2 won
		((ende++))
	fi
	
	if ((ziB==1)); then
		clear
		cat GameOver
		echo
		echo
		echo $znak1 won
		((ende++))
	fi
	
	((ende>=2)) && exit 0
	((ende==1)) && ((ende++))
	
	
	
	((stevec1B--))
	((stevec1A++))
	
	((stevec2B--))
	((stevec2A++))
	
	((stevec3B--))
	((stevec3A++))
	
	A1=0
	A2=0
	A3=0
	B1=0
	B2=0
	B3=0
	
done

exit 1;

# Strahinja Đorđević 2024.
