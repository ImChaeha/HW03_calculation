#!/bin/bash


filename=num1.txt
filename2=num2.txt
declare -a myArray
myArray=(`cat "$filename" "$filename2"`)


PS3="select menu:"
if [ $# = 0 ]
then
	echo ...none operator parameter...
	select var in "add" "sub" "div" "mul"
do
        if [ "$var" = "add" ]
        then
                op="add"
                
                for (( i = 0 ; i < ${#myArray[@]} ; i++))
		do
		  echo ${myArray[$i]}
		  ((total += myArray[$i]))
		done
                break
        elif [ "$var" = "sub" ]
        then
                op="sub"
		for (( i = 0 ; i < ${#myArray[@]} ; i++))
		do
		  ((total -= myArray[$i]))
		done
                break
        elif [ "$var" = "div" ]
        then
                op="div"
		for (( i = 0 ; i < ${#myArray[@]} ; i++))
		do
		  ((total /= myArray[$i]))
		done
                break

        else
                op="mul"
		for (( i = 0 ; i < ${#myArray[@]} ; i++))
		do
		  ((total *= myArray[$i]))
		done
                break
        fi
done
else
	op="$1"

        if [ "$op" = "add" ]
        then
                op="add"
		for (( i = 0 ; i < ${#myArray[@]} ; i++))
		do
		  ((total += myArray[$i]))
		done
        elif [ "$op" = "sub" ]
        then
                op="sub"
                for (( i = 0 ; i < ${#myArray[@]} ; i++))
		do
		  ((total -= myArray[$i]))
		done
        elif [ "$op" = "div" ]
        then
                op="div"
                for (( i = 0 ; i < ${#myArray[@]} ; i++))
		do
		  ((total /= myArray[$i]))
		done
        else
                op="mul"
		for (( i = 0 ; i < ${#myArray[@]} ; i++))
		do
		  ((total *= myArray[$i]))
		done
        fi

fi

echo "$op selected"
        echo "nums : $myArray"
        echo "op : $op"
        echo "total : $total"
        exit 0
