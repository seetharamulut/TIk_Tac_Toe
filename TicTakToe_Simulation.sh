#! /bin/bash/ 

echo "Welcome to TicTakToe game"

echo "Starting a new game"

function reset(){

  	player=1

	array=(. . . . . . . . . )

	gameStatus=1
}

function statusOfGame(){

         if [ $gameStatus -eq 0 ]
                then
                        printBoard
			if [ $mode -eq 1 ] && [ $player -eq 2 ]
                        then
                                echo "computer won the game"
                        else
                                echo "player "$player "won the game"
			fi
                elif [ $gameStatus -eq 2 ]
                then
                        printBoard
                        echo "match tied"
                        gameStatus=0
                else
                        player=$(( (( $player%2 ))+1 ))

			if [ $mode -eq 1 ] && [ $player -eq 2 ]
			then
				echo "computer turn"
			else
                        	echo "player "$player "turn"
                	fi
	fi
}

function checkmatch(){
	if [ ${array[$1]} != "." ] && [ ${array[$1]} == ${array[$2]} ] && [ ${array[$2]} == ${array[$3]} ]
        then
                gameStatus=0
        fi

}

function checkToWin(){


	if [ $valueSet -eq 0 ]
	then
		if [ ${array[$1]} == $computerSymbol ] && [ ${array[$2]} == $computerSymbol ] && [ ${array[$3]} == "." ]
		then 
			array[$3]=$computerSymbol
			valueSet=1
		elif [ ${array[$1]} == $computerSymbol ] && [ ${array[$2]} == "." ] && [ ${array[$3]} == $computerSymbol ]
		then 
			array[$2]=$computerSymbol
			valueSet=1
		elif [ ${array[$1]} == "." ] && [ ${array[$2]} == $computerSymbol ] && [ ${array[$3]} == $computerSymbol ]
		then
			array[$1]=$computerSymbol
			valueSet=1
		fi 
	fi

}

function checkToBlock(){

	if [ $valueSet -eq 0 ]
        then

		if [ ${array[$1]} == $playerOneSymbol ] && [ ${array[$2]} == $playerOneSymbol ] && [ ${array[$3]} == "." ]
        	then
        		array[$3]=$computerSymbol
			valueSet=1
        	elif [ ${array[$1]} == $playerOneSymbol ] && [ ${array[$2]} == "." ] && [ ${array[$3]} == $playerOneSymbol ]
        	then
                	array[$2]=$computerSymbol
			valueSet=1
        	elif [ ${array[$1]} == "." ] && [ ${array[$2]} == $playerOneSymbol ] && [ ${array[$3]} == $playerOneSymbol ]
        	then
                	array[$1]=$computerSymbol
			valueSet=1
        	fi
	fi
}

function checkForCorner(){

	if [ $valueSet -eq 0 ]
        then
        	if [ ${array[$1]} == "." ]
        	then
        		array[$1]=$computerSymbol
			valueSet=1
        	elif [ ${array[$2]} == "." ]
        	then
                	array[$2]=$computerSymbol
			valueSet=1
		elif [ ${array[$3]} == "." ]
        	then
                	array[$3]=$computerSymbol
			valueSet=1
		elif [ ${array[$4]} == "." ]
        	then
                	array[$4]=$computerSymbol
			valueSet=1
		fi
	fi
}

function checkForSide(){

        if [ $valueSet -eq 0 ]
        then
                if [ ${array[$1]} == "." ]
                then
                        array[$1]=$computerSymbol
                        valueSet=1
                elif [ ${array[$2]} == "." ]
                then
                        array[$2]=$computerSymbol
                        valueSet=1
                elif [ ${array[$3]} == "." ]
                then
                        array[$3]=$computerSymbol
                        valueSet=1
                elif [ ${array[$4]} == "." ]
                then
                        array[$4]=$computerSymbol
                        valueSet=1
                fi
        fi
}

function checkForCentre(){

	if [ $valueSet -eq 0 ]
        then
		if [ ${array[$1]} == "." ]
		then
			array[$1]=$computerSymbol
			valueSet=1
		fi
	fi
}

function tieCheck(){

	if [ ${array[0]} != "." ] && [ ${array[1]} != "." ] && [ ${array[2]} != "." ] && [ ${array[3]} != "." ] && [ ${array[4]} != "." ] && 
		[ ${array[5]} != "." ] && [ ${array[6]} != "." ] && [ ${array[7]} != "." ] && [ ${array[8]} != "." ]
	then
		gameStatus=2
	fi
}

function checkBoard(){

	tieCheck
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

	case $mode in
		1) if [ $(( $RANDOM%2 )) -eq 1 ]
	           then
			playerOneSymbol=X
                	computerSymbol=O
        	   else
                	playerOneSymbol=O
                	computerSymbol=X
        	   fi
        	   echo "player one symbol is : "$playerOneSymbol
       		   echo "computer symbol is : "$computerSymbol ;;

        	2) if [ $(( $RANDOM%2 )) -eq 1 ]
        	   then
                	playerOneSymbol=X
			playerTwoSymbol=O
        	   else
			playerOneSymbol=O
                	playerTwoSymbol=X
        	   fi
        	   echo "player one symbol is : "$playerOneSymbol
		   echo "player two symbol is : "$playerTwoSymbol ;;
	esac
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

function computerInput(){

	valueSet=0

	checkToWin 0 1 2
        checkToWin 3 4 5
        checkToWin 6 7 8
        checkToWin 0 3 6
        checkToWin 1 4 7
        checkToWin 2 5 8
        checkToWin 0 4 8
        checkToWin 2 4 6
	checkToBlock 0 1 2
        checkToBlock 3 4 5
        checkToBlock 6 7 8
        checkToBlock 0 3 6
        checkToBlock 1 4 7
        checkToBlock 2 5 8
        checkToBlock 0 4 8
        checkToBlock 2 4 6
	checkForCorner 0 2 6 8
	checkForCentre 4
	checkForSide 1 3 5 7
}

function playerInput(){

	if [ $player -eq 1 ]
	then
		playerSymbol=$playerOneSymbol
	else
		playerSymbol=$playerTwoSymbol
	fi
		echo "to set a value enter : set [row number] [column number]"
		echo "to restart the game enter : reset"
		read -r command row column

		if [ $command == "set" ]
		then
			setBoard $row $column $playerSymbol
		elif [ $command == "reset" ]
		then
			gameStart
		else
			echo "enter a valid input"
			playerInput
		fi

}

function playerSelection(){

	case $mode in
		1) if [ $player -eq 1 ]
		   then
			playerInput
		   else
			computerInput
		   fi ;;
		2) playerInput
	esac
}

function gameMode(){

	echo "select"
	echo "1) vs compute"
	echo "2) two players"

	read -r mode
}

function gameVsComputer(){

 	if [ $player -eq 2 ]
        then
               	echo "computer turn"
        else
                echo "player one turn"
        fi

        while [ $gameStatus -eq 1 ]
        do
                printBoard
                playerSelection
                checkBoard
                statusOfGame
        done
}

function gameStart(){

	computerOption=nothing

	reset
	gameMode
        assignSymbol
	toss

	if [ $mode -eq 1 ]
	then
		gameVsComputer
	else
	        echo "player "$player "turn"

		while [ $gameStatus -eq 1 ]
		do
        		printBoard
			playerInput
			checkBoard
			statusOfGame
		done
	fi
}

gameStart
