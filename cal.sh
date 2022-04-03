#!/bin/bash

read num1 <  num1.txt
read num2 < num2.txt
PS3="select menu:"
if [ $# = 0 ]
then
	echo ...none operator parameter...
	select var in "add" "sub" "div" "mul"
do
        if [ "$var" = "add" ]
        then
                op="add"
                total=$((num1 + num2))
                break
        elif [ "$var" = "sub" ]
        then
                op="sub"
                total=$((num1 - num2))
                break
        elif [ "$var" = "div" ]
        then
                op="div"
                total=$((num1 / num2))
                break

        else
                op="mul"
                total=$((num1 * num2))
                break
        fi
done
else
	op="$1"

        if [ "$op" = "add" ]
        then
                op="add"
                total=$((num1 + num2))
        elif [ "$op" = "sub" ]
        then
                op="sub"
                total=$((num1 - num2))
        elif [ "$op" = "div" ]
        then
                op="div"
                total=$((num1 / num2))
        else
                op="mul"
                total=$((num1 * num2))
        fi

fi

echo "$op selected"
        echo "num1 : $num1"
        echo "num2 : $num2"
        echo "op : $op"
        echo "total : $total"
        exit 0

