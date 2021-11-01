#Declaration of different colors
bleuc='\e[1;34m'
vert='\e[0;32m'
jaune='\e[1;33m'
rouge='\e[0;31m'
neutre='\e[1;37m'
rose='\e[1;31m'
blink='\033[5m'

#Creation of the app function
app() {
  echo "            1. New Game"  "   2. Quit"
  read -s action
  if [[ action -eq 1 ]]; then
    echo "            Choose your difficulty"
    echo -e ${vert}"       1. Normal"  ${jaune}"2. Difficult"  ${rouge}"3. Insane"
    read -s difficulty
    if [[ difficulty -eq 1 ]]; then
      return 1
    elif [[ difficulty -eq 2 ]]; then
      return 2
    elif [[ difficulty -eq 3 ]]; then
      return 3
    fi
  else
    return 4
  fi
}

app
