heads=0
tails=0
flip=$((RANDOM%2))
if [ $flip -eq 1 ]
then
	echo Heads
else
	echo Tails
fi
