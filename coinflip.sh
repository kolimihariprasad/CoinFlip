declare -A coinflips
declare -A order
read -p "enter the no of times coin needs to be fliped" flips
echo "enter the choice "
echo "1.single"
echo "2.double"
echo "3.Triple"
read choice
for((i=1;i<=$flips;i++))
do
        sides=""
        for((j=1;j<=$choice;j++))
        do
                flip=$((RANDOM%2))
                if [ $flip -eq 1 ]
                then
                        side="H"
                else
                        side="T"
                fi
                sides=$sides$side
        done
        order[$i]=$sides
        coinflips[$sides]=$(( ${coinflips[$sides]}+1 ))
done
max=0
for((k=1;k<=$flips;k++))
do
        key=${order[$k]}
        if [ ${coinflips[$key]} -gt $max ]
        then
                max=${coinflips[$key]}
                combination=$key
        fi
done
percentage=`awk "BEGIN {print ($max/$flips)*100}"`
echo "Winning combination is" $combination "-" $percentage"%"
