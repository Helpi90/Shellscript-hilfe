function mkalias () {
  if [[ $1 && $2 ]]
    then
      echo -e "alias $1=\'$2\'" >> ~/.bash_aliases
      alias $1=$2
  fi
}
