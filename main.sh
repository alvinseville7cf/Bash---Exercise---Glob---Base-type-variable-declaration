list=("x" "x1" "1x"
  "x = 0" "x1 = 0" "1x = 0"
  "var x = 0" "var x1 = 0" "var 1x = 0"
  "int x = 0" "int x1 = 0" "int 1x = 0")

integerNumberGlob='?(-|+)+([[:digit:]])?(u|ul|lu)'
floatNumberGlob='?(-|+)+([[:digit:]])?(.+([[:digit:]]))?(d|f|m)'
charGlob="'?'"
stringGlob='"*"'
varGlob="@($integerNumberGlob|$floatNumberGlob|$charGlob|$stringGlob)"

integralTypeGlob='@(sbyte|byte|short|ushort|int|uint|long|ulong)'
floatingPointTypeGlob='@(float|double|decimal)'
charTypeGlob='char'
stringTypeGlob='string'
varTypeGlob='var'

declare -A typeValueDictionary=(["$integralTypeGlob"]="$integerNumberGlob" ["$floatingPointTypeGlob"]="$floatNumberGlob"
  ["$charTypeGlob"]="$charGlob" ["$stringTypeGlob"]="$stringGlob"
  ["$varTypeGlob"]="$varGlob")

identifierGlob='[[:alpha:]]*([[:alnum:]])'
valueGlob="@($integerNumberGlob|$floatNumberGlob|$charGlob|$stringGlob)"

glob='@('
for type in "${!typeValueDictionary[@]}"
do
  glob+="$type+([[:space:]])$identifierGlob*([[:space:]])=*([[:space:]])${typeValueDictionary[$type]}|"
done
glob="${glob:0:-1}"
glob+=')'
echo "$glob"

shopt -s nocasematch
for i in "${list[@]}"
do
  [[ "$i" == $glob ]] && echo $i || continue
done