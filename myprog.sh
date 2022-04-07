#!/bin/bash

PS3="select menu: "
if [ ! -d "temp " ]
then
	mkdir temp
	echo "...create temp directory..."
fi
chmod 777 mycal.sh
mv num1.txt num2.txt mycal.sh temp
echo "...copy files to temp directory..."
cd temp
select var in "add" "sub" "div" "mul"
do
	if [ "$var"="add" ]
	then
		op="add"
		break;
	elif [ "$var"="sub" ]
	then
		op="sub"
		break
	elif [ "$var"="div" ]
	then
		op="div"
		break
	else
		op="mul"
		break
	fi
done
./mycal.sh $var
exit 0
