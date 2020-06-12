#! /bin/bash/

echo "Welcome to TicTakToe game"

echo "Starting a new game"

array=(. . . . . . . . .)

player=1

function printBoard(){

	echo "0   ${array[0]} ${array[1]} ${array[2]}"
	echo "1   ${array[3]} ${array[4]} ${array[5]}"
	echo "2   ${array[6]} ${array[7]} ${array[8]}"
}

printBoard

function toss(){

	echo "select :"

	echo "1) Head"

	echo "2) Tails"

	read -r tossSelected

	tossValue=$(( (( $RANDOM%2 ))+1 ))

	if [ $tossValue -eq $tossSelected ]
	then
		echo "player won the toss"
	else
		echo "player lost toss"
		player=$(( (( $player%2 ))+1 ))
	fi
}

function assignSymbol(){

        if [ $(( $RANDOM%2 )) -eq 1 ]
        then
                player_Symbol=X
        else
                player_Symbol=O
        fi

        echo "player symbol is : "$player_Symbol

        toss
}

assignSymbol
