list=("var x = 0" "var x = 22.5")

integerNumberGlob='?(-|+)+([[:digit:]])?(u|ul|lu)'
floatingNumberGlob='?(-|+)+([[:digit:]])?(.+([[:digit:]]))?(d|f|m)'
charGlob="'?'"
stringGlob='"*"'
nullGlob='null'
valueGlob="@($integerNumberGlob|$floatingNumberGlob|$charGlob|$stringGlob|$nullGlob)"

identifierGlob='[[:alpha:]]*([[:alnum:]])'
typeGlob="$identifierGlob"

glob="$typeGlob+([[:space:]])$identifierGlob*([[:space:]])=*([[:space:]])$valueGlob"

shopt -s nocasematch
for i in "${list[@]}"
do
  [[ "$i" == $glob ]] && echo $i || continue
done
