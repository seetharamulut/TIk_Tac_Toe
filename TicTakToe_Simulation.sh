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

function columnCheck(){

		for (( i=0; i<3; i++ ))
		do
			j=0
			if [ ${array[$(( $j *3 + $i ))]} != "." ] && [ ${array[$(( $j *3 + $i ))]} == ${array[$(( $j+1 *3 + $i ))]} ] && [ ${array[$(( $j+1 *3 + $i ))]} == ${array[$(( $j+2 *3 + $i ))]} ]
			then
				gameStatus=0
			fi
		done
}

function rowCheck(){

                for (( i=0; i<3; i++ ))
                do
                        j=0
                        if [ ${array[$(( $i *3 + $j ))]} != "." ] && [ ${array[$(( $i *3 + $j ))]} == ${array[$(( $i *3 + $j+1 ))]} ] && [ ${array[$(( $i *3 + $j+1 ))]} == array[$(( $i *3 + $j+2 ))]} ]
                        then
                                gameStatus=0
                        fi
                done
}

function diagonalCheck(){

        if [ ${array[0]} != "." ] && [ ${array[0]} == ${array[4]} ] && [ ${array[4]} == ${array[8]} ]
        then
                gameStatus=0
        elif [ ${array[2]} != "." ] && [ ${array[2]} == ${array[4]} ] && [ ${array[4]} == ${array[6]} ]
        then
                gameStatus=0
        fi
}

function computerCheckToWinRow(){

	for (( i=0; i<3; i++ ))
        do
        	j=0
		if [ $valueSet -eq 0 ]
		then
			if [ ${array[$(( $i *3 + $j ))]} == $computerSymbol ] && [ ${array[$(( $i *3 + $j+1 ))]} == $computerSymbol ] && [ ${array[$(( $i *3 + $j+2 ))]} == "." ]
			then
	valueSet=0			array[$(( $i *3 + $j+2 ))]=$computerSymbol
				valueSet=1
			elif [ ${array[$(( $i *3 + $j ))]} == $computerSymbol ] && [ ${array[$(( $i *3 + $j+1 ))]} == "." ] && [ ${array[$(( $i *3 + $j+2 ))]} == $computerSymbol ]
			then
				array[$(( $i *3 + $j+1 ))]=$computerSymbol
				valueSet=1
			elif [ ${array[$(( $i *3 + $j ))]} == "." ] && [ ${array[$(( $i *3 + $j+1 ))]} == $computerSymbol ] && [ ${array[$(( $i *3 + $j+2 ))]} == $computerSymbol ]
			then
				array[$(( $i *3 + $j ))]=$computerSymbol
				valueSet=1
			fi
		fi
	done
}

function computerCheckToWinColumn(){

	for (( i=0; i<3; i++ ))
        do
                j=0
                if [ $valueSet -eq 0 ]
                then
                        if [ ${array[$(( $j *3 + $i ))]} == $computerSymbol ] && [ ${array[$(( $j+1 *3 + $i ))]} == $computerSymbol ] && [ ${array[$(( $j+2 *3 + $i ))]} == "." ]
                        then
                                array[$(( $j+2 *3 + $i ))]=$computerSymbol
                                valueSet=1
                        elif [ ${array[$(( $j *3 + $i ))]} == $computerSymbol ] && [ ${array[$(( $j+1 *3 + $i ))]} == "." ] && [ ${array[$(( $j+2 *3 + $i ))]} == $computerSymbol ]
                        then
                                array[$(( $j+1 *3 + $i ))]=$computerSymbol
                                valueSet=1
                        elif [ ${array[$(( $j *3 + $i ))]} == "." ] && [ ${array[$(( $j+1 *3 + $i ))]} == $computerSymbol ] && [ ${array[$(( $j+2 *3 + $i ))]} == $computerSymbol ]
                        then
                                array[$(( $j *3 + $i ))]=$computerSymbol
                                valueSet=1
                        fi
                fi
        done
}

function computerCheckDiagonal(){

	if [ $valueSet -eq 0 ]
	then
		if [ ${array[0]} == $1 ] && [ ${array[4]} == $1 ] && [ ${array[8]} == '.' ]
        	then
        		array[8]=$2
                	valueSet=1
        	elif [ ${array[0]} == $1 ] && [ ${array[4]} == "." ] && [ ${array[8]} == $1 ]
        	then
                	array[4]=$2
                	valueSet=1
        	elif [ ${array[0]} == "." ] && [ ${array[4]} == $1 ] && [ ${array[8]} == $1 ]
        	then
             		array[0]=$2
                	valueSet=1
		elif [ ${array[2]} == $1 ] && [ ${array[4]} == $1 ] && [ ${array[6]} == '.' ]
        	then
                	array[6]=$2
                	valueSet=1
        	elif [ ${array[2]} == $1 ] && [ ${array[4]} == "." ] && [ ${array[6]} == $1 ]
        	then
                	array[4]=$2
                	valueSet=1
        	elif [ ${array[2]} == "." ] && [ ${array[4]} == $1 ] && [ ${array[6]} == $1 ]
        	then
                	array[2]=$2
                	valueSet=1
        	fi
	fi
}

function computerCheckToBlockRow(){

        for (( i=0; i<3; i++ ))
        do
                j=0
                if [ $valueSet -eq 0 ]
                then
                        if [ ${array[$(( $i *3 + $j ))]} == $playerOneSymbol ] && [ ${array[$(( $i *3 + $j+1 ))]} == $playerOneSymbol ] && [ ${array[$(( $i *3 + $j+2 ))]} == "." ]
                        then
                                array[$(( $i *3 + $j+2 ))]=$computerSymbol
                                valueSet=1
                        elif [ ${array[$(( $i *3 + $j ))]} == $playerOneSymbol ] && [ ${array[$(( $i *3 + $j+1 ))]} == "." ] && [ ${array[$((  $i *3 + $j+2 ))]} == $playerOneSymbol ]
                        then
                                array[$(( $i *3 + $j+1 ))]=$computerSymbol
                                valueSet=1
                        elif [ ${array[$(( $i *3 + $j ))]} == "." ] && [ ${array[$(( $i *3 + $j+1 ))]} == $playerOneSymbol ] && [ ${array[$((  $i *3 + $j+2 ))]} == $playerOneSymbol ]
                        then
                                array[$(( $i *3 + $j ))]=$computerSymbol
                                valueSet=1
                        fi
                fi
        done
}

function computerCheckToBlockColumn(){

        for (( i=0; i<3; i++ ))
        do
                j=0
                if [ $valueSet -eq 0 ]
                then
                        if [ ${array[$(( $j *3 + $i ))]} == $playerOneSymbol ] && [ ${array[$(( $j+1 *3 + $i ))]} == $playerOneSymbol ] && [ ${array[$(( $j+2 *3 + $i ))]} == "." ]
                        then
                                array[$(( $j+2 *3 + $i ))]=$computerSymbol
                                valueSet=1
                        elif [ ${array[$(( $j *3 + $i ))]} == $playerOneSymbol ] && [ ${array[$(( $j+1 *3 + $i ))]} == "." ] && [ ${array[$(( $j+2 *3 + $i ))]} == $playerOneSymbol ]
                        then
                                array[$(( $j+1 *3 + $i ))]=$computerSymbol
                                valueSet=1
                        elif [ ${array[$(( $j *3 + $i ))]} == "." ] && [ ${array[$(( $j+1 *3 + $i ))]} == $playerOneSymbol ] && [ ${array[$(( $j+2  *3 + $i ))]} == $playerOneSymbol ]
                        then
                                array[$(( $j *3 + $i ))]=$computerSymbol
                                valueSet=1
                        fi
                fi
        done
}


function computerCheckForCorner(){

	for (( i=0; i<3; i=$(( $i+2 )) ))
	do
		if [ $valueSet -eq 0 ]
       		then
			j=0
			if [ ${array[$(( $i *3 + $j ))]} == "." ]
        		then
        			array[$(( $i *3 + $j ))]=$computerSymbol
                		valueSet=1
			elif [ ${array[$(( $i *3 + $j+2 ))]} == "." ]
 		       then
                		array[$(( $i *3 + $j+2 ))]=$computerSymbol
                		valueSet=1

			fi
		fi
	done
}

function computerCheckForSide(){

	for (( i=0; i<3; i++ ))
	do
  		if [ $valueSet -eq 0 ]
      		then
			j=1
 			if [ ${array[$(( $i *3 + $j ))]} == "." ]
                	then
                        	array[$(( $i *3 + $j ))]=$computerSymbol
                        	valueSet=1
                	elif [ ${array[$(( $i+1 *3 + $j-1 ))]} == "." ]
                	then
                        	array[$(( $i+1 *3 + $j-1 ))]=$computerSymbol
                        	valueSet=1
			fi
			j=$(( $j+2 ))
		fi
	done
}

function computerCheckForCentre(){

	if [ $valueSet -eq 0 ]
        then
		if [ ${array[4]} == "." ]
		then
			array[4]=$computerSymbol
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
	rowCheck
	columnCheck
	diagonalCheck
}

function printBoard(){

	echo "   ${array[0]} ${array[1]} ${array[2]}"
	echo "   ${array[3]} ${array[4]} ${array[5]}"
	echo "   ${array[6]} ${array[7]} ${array[8]}"
	echo "   -----"
}

function tossSelection(){

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
		tossSelection
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
		player=$(( (( $player%2 ))+1 ))
	fi
}

function computerInput(){

	valueSet=0
	computerCheckToWinRow
        computerCheckToWinColumn
        computerCheckDiagonal $computerSymbol $computerSymbol 
	computerCheckToBlockRow
        computerCheckToBlockColumn
        computerCheckDiagonal $playerSymbol $computerSymbol 
	computerCheckForCorner
	computerCheckForCentre
	computerCheckForSide
}

function playerInput(){

	if [ $player -eq 1 ]
	then
		playerSymbol=$playerOneSymbol
	else
		playerSymbol=$playerTwoSymbol
	fi
		echo "to set a value enter : set row number column number"
		echo "to restart the game enter : reset"
		read -r command row column

		if [ $command == "set" ]
		then
			setBoard $row $column $playerSymbol
		elif [ $command == "reset" ]
		then
			startGame
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

function startGame(){
	reset
	gameMode
        assignSymbol
	tossSelection

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

startGame
