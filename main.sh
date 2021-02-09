list=("x" "x1" "1x"
  "x = 0" "x1 = 0" "1x = 0"
  "var x = 0" "var x1 = 0" "var 1x = 0"
  "int x = 0" "int x1 = 0" "int 1x = 0")

integerNumberGlob='?(-|+)+([[:digit:]])?(u|ul|lu)'
floatingNumberGlob='?(-|+)+([[:digit:]])?(.+([[:digit:]]))?(d|f|m)'
charGlob="'?'"
stringGlob='"*"'
valueGlob="@($integerNumberGlob|$floatNumberGlob|$charGlob|$stringGlob)"

integralTypeGlob='sbyte|byte|short|ushort|int|uint|long|ulong'
floatingPointTypeGlob='float|double|decimal'
charTypeGlob='char'
stringTypeGlob='string'
varTypeGlob='var'
typeGlob="@($integralTypeGlob|$floatingPointTypeGlob|$charTypeGlob|$stringTypeGlob|$varTypeGlob)"

identifierGlob='[[:alpha:]]*([[:alnum:]])'

glob="$typeGlob+([[:space:]])$identifierGlob*([[:space:]])=*([[:space:]])$valueGlob"
echo "glob == $glob"

shopt -s nocasematch
for i in "${list[@]}"
do
  [[ "$i" == $glob ]] && echo $i || continue
done