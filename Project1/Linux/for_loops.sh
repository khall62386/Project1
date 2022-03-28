#!/bin/bash 
#sudo nano for_loops.sh

# Creating Variables

nums=$(echo {0..9})
states=('Utah' 'California' 'Texas' 'Hawaii' 'Nevada')
ls_out=$(ls)

execs=$(find /home -type f -perm 777 2> /dev/null)

# Create For Loops
# Create a loop that prints only 3, 5 and 7

for num in ${nums[@]}; do
  if [$num = 3 ] || [ $num = 5 ] || [ $num = 7 ]; then 
  echo $num
  fi
done

# Creating a loop that is looking for Hawaii

for state in ${states[@]}; do
  if [ $state == 'Hawaii' ]; then
   echo "Hawaii is the best!" 
  else
   echo "I'm not a fan of Hawaii." 
 fi 
done

# creating a for loop that will print out variables

for x in ${ls_out[@]; do
  echo $x
done

# creating a for loop to print exec

for exec in ${execs[@]; do
  echo $exec

done
