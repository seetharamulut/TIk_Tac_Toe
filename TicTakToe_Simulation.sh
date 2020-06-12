#! /bin/bash/ 

echo "Welcome to TicTakToe game"

echo "Starting a new game"

function reset(){

	player=1

	array=(. . . . . . . . . )

	game_Status=1
}

function checkmatch(){

	if [ ${array[$1]} != "." ] && [ ${array[$1]} == ${array[$2]} ] && [ ${array[$2]} == ${array[$3]} ]
	then
		game_Status=0
	fi
}

function checkBoard(){

	checkmatch 0 1 2
	checkmatch 3 4 5
	checkmatch 6 7 8
	checkmatch 0 3 6
	checkmatch 1 4 7
	checkmatch 2 5 8
	checkmatch 0 4 8
	checkmatch 2 4 6
}

function printBoard(){

	echo "0   ${array[0]} ${array[1]} ${array[2]}"
	echo "1   ${array[3]} ${array[4]} ${array[5]}"
	echo "2   ${array[6]} ${array[7]} ${array[8]}"
}

function toss(){

	echo "select :"

	echo "1) Head"

	echo "2) Tails"

	read -r tossSelected

	tossValue=$(( (( $RANDOM%2 ))+1 ))

	if [ $tossValue -eq $tossSelected ]
	then
		echo "player won the toss"
	elif [ $tossValue -ne $tossSelected ] && [ $tossSelected -lt 3 ]
	then
		echo "player lost toss"
		player=$(( (( $player%2 ))+1 ))
	else
		echo "enter valid input"
		toss
	fi

}

function assignSymbol(){

        if [ $(( $RANDOM%2 )) -eq 1 ]
        then
                player_One_Symbol=X
		player_Two_Symbol=O
        else
		player_One_Symbol=O
                player_Two_Symbol=X
        fi

        echo "player one symbol is : "$player_One_Symbol
	echo "player two symbol is : "$player_Two_Symbol

        toss
}

function setBoard(){

	arrayId=$(( $(( $1-1 )) * 3 + $(( $2-1)) ))

	if [ ${array[$arrayId]} == "." ]
	then
		array[$arrayId]=$3
	else
		echo "cannot place there"
	fi
}


function playerInput(){

	if [ $player -eq 1 ]
	then
		player_Symbol=$player_One_Symbol
	else
		player_Symbol=$player_Two_Symbol
	fi

		echo "to set a value enter : set [row number] [column number]"
		echo "to restart the game enter : reset"
		read -r command row column

		if [ $command == "set" ]
		then
			setBoard $row $column $player_Symbol
		elif [ $command == "reset" ]
		then
			gameStart
		else
			echo "enter a valid input"
			playerInput
		fi

}

function gameStart(){

	reset

        assignSymbol

        echo "player "$player "turn"

	while [ $game_Status -eq 1 ]
	do
        	printBoard

		playerInput

		checkBoard

		if [ $game_Status -eq 0 ]
		then 
			printBoard
			echo "player "$player "won the game"
		else
			player=$(( (( $player%2 ))+1 ))

			echo "player "$player "turn"
		fi
	done
}

gameStart
