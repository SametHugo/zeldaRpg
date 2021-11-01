#!/bin/bash

#Calling the different csv files
data_file=players.csv
data_file1=bosses.csv
data_file2=enemies.csv
first_line=0
bleuc='\e[1;34m'
vert='\e[0;32m'
jaune='\e[1;33m'
rouge='\e[0;31m'
neutre='\e[1;37m'
rose='\e[1;31m'

# Creation of the info_player function
info_player() {
	player_name="$name"
	player_hp="$hp"
	player_str="$str"
	player_rar="$raritys"
}
# Creation of the info_boss function
info_boss() {
	boss_name="$name"
	boss_hp="$hp"
	boss_str="$str"
	boss_rar="$raritys"
}
# Creation of the info_target function
info_target() {
	target_name="$name"
	target_hp="$hp"
	target_str="$str"
	target_rar="$raritys"
}

#### Random Player ####

#The 100 is excluded in the random number
randomChoice=$(($RANDOM%100))
#echo $randomChoice
while IFS=',' read -r id name hp mp str int def res spd luck race class raritys ; do
	# 50%  chance
	if [[ $randomChoice -le 49 ]] && [[ $raritys -eq 1 ]];then
		info_player
	# 30%  chance
	elif [[ $randomChoice -ge 50 ]] && [[ $randomChoice -le 79 ]] && [[ $raritys -eq 2 ]];then
		info_player
	# 15%  chance
	elif [[ $randomChoice -ge 80 ]] && [[ $randomChoice -le 94 ]] && [[ $raritys -eq 3 ]];then
    info_player
	# 4%  chance
	elif [[ $randomChoice -ge 95 ]] && [[ $randomChoice -le 98 ]] && [[ $raritys -eq 4 ]];then
    info_player
	# 1%  chance
	elif [[ $randomChoice -eq 99 ]] && [[ $raritys -eq 5 ]];then
		info_player
	else
		first_line=1
	fi
done < $data_file

#### Random Boss ####

#The 200 is excluded in the random number
randomChoice1=$(($RANDOM%200))
#echo $randomChoice1
while IFS=',' read -r idd name hp mp str int def res spd luck race class raritys ; do
	if [[ $randomChoice1 -le 99 ]] && [[ $raritys -eq 1 ]];then
		info_boss
	elif [[ $randomChoice1 -ge 100 ]] && [[ $randomChoice1 -le 159 ]] && [[ $raritys -eq 2 ]];then
		info_boss
	elif [[ $randomChoice1 -ge 160 ]] && [[ $randomChoice1 -le 174 ]] && [[ $raritys -eq 3 ]] && [[ $idd -eq 2 ]];then
		info_boss
	elif [[ $randomChoice1 -ge 175 ]] && [[ $randomChoice1 -le 189 ]] && [[ $raritys -eq 3 ]] && [[ $idd -eq 5 ]];then
		info_boss
	elif [[ $randomChoice1 -ge 190 ]] && [[ $randomChoice1 -le 193 ]] && [[ $raritys -eq 4 ]] && [[ $idd -eq 3 ]];then
			info_boss
	elif [[ $randomChoice1 -ge 194 ]] && [[ $randomChoice1 -le 197 ]] && [[ $raritys -eq 4 ]] && [[ $idd -eq 6 ]];then
			info_boss
	elif [[ $randomChoice1 -ge 198 ]] && [[ $randomChoice1 -le 199 ]] && [[ $raritys -eq 5 ]];then
		info_boss
	else
		first_line=1
	fi
done < $data_file1


#### Random Enemy ####

#The 200 is excluded in the random number
randomChoice2=$(($RANDOM%200))
#echo $randomChoice2
while IFS=',' read -r idd name hp mp str int def res spd luck race class raritys ; do
	if [[ $randomChoice2 -ge 0 ]] && [[ $randomChoice2 -le 24 ]] && [[ $raritys -eq 1 ]] && [[ $idd -eq 7 ]];then
		info_target
	elif [[ $randomChoice2 -ge 25 ]] && [[ $randomChoice2 -le 49 ]] && [[ $raritys -eq 1 ]] && [[ $idd -eq 10 ]];then
		info_target
	elif [[ $randomChoice2 -ge 50 ]] && [[ $randomChoice2 -le 74 ]] && [[ $raritys -eq 1 ]] && [[ $idd -eq 11 ]];then
		info_target
	elif [[ $randomChoice2 -ge 75 ]] && [[ $randomChoice2 -le 99 ]] && [[ $raritys -eq 1 ]] && [[ $idd -eq 12 ]];then
		info_target
	elif [[ $randomChoice2 -ge 100 ]] && [[ $randomChoice2 -le 129 ]] && [[ $raritys -eq 2 ]] && [[ $idd -eq 6 ]];then
		info_target
	elif [[ $randomChoice2 -ge 130 ]] && [[ $randomChoice2 -le 159 ]] && [[ $raritys -eq 2 ]] && [[ $idd -eq 9 ]];then
		info_target
	elif [[ $randomChoice2 -ge 160 ]] && [[ $randomChoice2 -le 174 ]] && [[ $raritys -eq 3 ]] && [[ $idd -eq 1 ]];then
		info_target
	elif [[ $randomChoice2 -ge 175 ]] && [[ $randomChoice2 -le 189 ]] && [[ $raritys -eq 3 ]] && [[ $idd -eq 8 ]];then
		info_target
	elif [[ $randomChoice2 -ge 190 ]] && [[ $randomChoice2 -le 193 ]] && [[ $raritys -eq 4 ]] && [[ $idd -eq 3 ]];then
		info_target
	elif [[ $randomChoice2 -ge 194 ]] && [[ $randomChoice2 -le 197 ]] && [[ $raritys -eq 4 ]] && [[ $idd -eq 4 ]];then
		info_target
	elif [[ $randomChoice2 -eq 198 ]] && [[ $raritys -eq 5 ]] && [[ $idd -eq 2 ]];then
		info_target
	elif [[ $randomChoice2 -eq 199 ]] && [[ $raritys -eq 5 ]] && [[ $idd -eq 5 ]];then
		info_target
	else
		first_line=1
	fi
done < $data_file2

echomsg_stats() {
  echo
	echo -e ${rouge} "         ""$1"
	echo -e ${rouge} "         ""HP: $2/$3"
	echo
	echo -e ${vert} "         ""$4"
	echo -e ${vert} "         ""HP: $5/$6"
	echo
  echo -e ${neutre}    "--------Options--------"
  echo " ""1. Attack       2. Heal"
}

fightAction() {
	playerr_str=$3
	targett_chp=$4
	#Checkin actual target hp
	target_hp=$((targett_chp-playerr_str));
	target_str=$5
	#$1 is the use input
	#Attack choice condition
	if [[ $1 -eq 1 ]]; then
		if [[ $target_hp -gt 0 ]]; then
      echo
			echo -e ${vert}"You attacked and dealt $player_str damages"
			echo
			echo -e ${rouge}"Target attacked you and dealt $target_str dmg"
			echo
			return 1
		elif [[ $target_hp -le 0 ]]; then
      echo
			echo -e ${vert}"You attacked and dealt $player_str damages"
			echo
			echo -e ${rouge}"Target's dead"
			echo
			return 2
		fi
	#Heal choice condition
	elif [[ $1 -eq 2 ]]; then
    echo
		echo -e ${vert}"You Healed for $6"
		echo
		echo -e ${rouge}"Target attacked you and dealt $target_str dmg"
		echo
		return 3
	fi
}

#Main function
app() {

	target_name=$1
	target_mhp=$2
	#Setting currenthp to max value because at the begining, target have his maxhp
	#But doing it like this allow us to modify the value and modifying it inside code
	target_chp=$target_mhp
	target_str=$3

	boss_name=$4
	boss_mhp=$5
	boss_chp=$boss_mhp
	boss_str=$6

	max_floor=$7
	current_floor=1

	player_mhp=$8
	player_chp=$player_mhp
	player_str=$9
  
  heal_value=$(($player_hp/2))
	#Shift =>
		#When you call function, default behavior is 9 params max
		#Shift allow you to n-1 param
		#So param number 10 at function call is another param 9 inside function
	shift
	player_name=$9
  shift
  difficulty=$9

    #IF DIFFICULTY IS CHANGED
  if [[ difficulty -eq 2 ]]; then
    target_mhp=$((target_mhp+(target_mhp/2)))
    target_str=$((target_str+(target_str/2)))
    target_chp=$target_mhp

    boss_mhp=$((boss_mhp+(boss_mhp/2)))
    boss_str=$((boss_str+(boss_str/2)))
    boss_chp=$boss_mhp
  elif [[ difficulty -eq 3 ]]; then
    target_mhp=$((target_mhp*2))
    target_str=$((target_str*2))
    target_chp=$target_mhp
    boss_mhp=$((boss_mhp*2))
    boss_str=$((boss_str*2))
    boss_chp=$boss_mhp
  fi

	#While checkin is it's the 9 first floors or not, if not => Boss Fight
	while [[ current_floor -lt max_floor ]]
	do
		#At each newfight (when a new floor is encountered)
		echo -e ${bleuc}"========== FIGHT $current_floor =========="
		#At begining of each fight, reset HP
		target_chp=$target_mhp
		current_floor=$((current_floor+1))
		#While until ennemy is defeated or Link death
		while [[ $player_chp -gt 0 && $target_chp -gt 0 ]]
		do
			echomsg_stats "$target_name" "$target_chp" "$target_mhp" "$player_name" "$player_chp" "$player_mhp"
			#Reading user input, then executing Fight function giving user input
			read -s action
			fightAction "$action" "$player_chp" "$player_str" "$target_chp" "$target_str" "$heal_value"
			#Result is the returned value of fight function
			result=$?
			#Different possibilities depending on returned value of the fight
			if [[ $result -eq 1 ]]; then
				target_chp=$((target_chp-player_str))
				player_chp=$((player_chp-target_str))
			elif [[ $result -eq 2 ]]; then
				target_chp=$((target_chp-player_str))
			elif [[ $result -eq 3 ]]; then
				player_chp=$((player_chp+heal_value))
				if [[ player_chp -gt $player_mhp ]]; then
					player_chp=$player_mhp
				fi
				player_chp=$((player_chp-target_str))
			fi
		done
    if [[ player_chp -le 0 ]]; then
      echo
      echo -e ${rouge}"You lost again $target_name"
      current_floor=$((current_floor+10));
    fi
	done
	#Boss Fight, so when floor 10
	if [[ current_floor -eq max_floor ]]; then
		echo "========== FIGHT $current_floor =========="
		target_chp=$boss_chp
		target_mhp=$boss_mhp
		target_name=$boss_name
		#At each turn while both (player and Boss) are alive
		while [[ $player_chp -gt 0 && $target_chp -gt 0 ]]
		do
			echomsg_stats "$target_name" "$target_chp" "$target_mhp" "$player_name" "$player_chp" "$player_mhp"
			read -s action
			fightAction "$action" "$player_chp" "$player_str" "$target_chp" "$boss_str" "$heal_value"
			result=$?
      if [[ $result -eq 1 ]]; then
              target_chp=$((target_chp-player_str))
              player_chp=$((player_chp-boss_str))
      elif [[ $result -eq 2 ]]; then
              target_chp=$((target_chp-player_str))
      elif [[ $result -eq 3 ]]; then
              player_chp=$((player_chp+heal_value))
              if [[ player_chp -gt $player_mhp ]]; then
                      player_chp=$player_mhp
              fi
              player_chp=$((player_chp-boss_str))
      fi
		done
		if [[ $target_chp -le 0 ]]; then
			echo -e ${rose}"You Won by defeating $boss_name"
		elif [[ $player_chp -le 0 ]]; then
			echo -e ${rouge}"$boss_name defeated you"
		fi
	fi
}

#call the script for the different modes
./BasicGameCustomization.sh
result=$?
#Calling app func
if [[ $result -eq 1 || $result -eq 2 || $result -eq 3 ]]; then
  app "$target_name" "$target_hp" "$target_str" "$boss_name" "$boss_hp" "$boss_str" "10" "$player_hp" "$player_str" "$player_name" "$result"
elif [[ $result -eq 4 ]]; then
  echo "You choose to leave the game"
fi
