#!/bin/bash
# weirdvars.sh: 이상한 변수를 출력(echo)하기.

echo

var="'(]\\{}\$\""
echo $var        # '(]\{}$"
echo "$var"      # '(]\{}$"     위와 같습니다.

echo

IFS='\'
echo $var        # '(] {}$"     \ 는 space로 변환됩니다. 왜 그럴까요?
echo "$var"      # '(]\{}$"

# 위의 예제는 Stephane Chazelas가 제공했습니다.

echo

var2="\\\\\""
echo $var2       #   "
echo "$var2"     # \\"
echo
# 하지만 ... var2="\\\\"" 은 안됩니다. 왜 그럴까요?
var3='\\\\'
echo "$var3"     # \\\\
# 강한 인용(Strong quoting)은 동작합니다.


# ************************************************************ #
# 위의 첫 번째 예제에서 본 것처럼 충접된 인용은 허용됩니다.

echo "$(echo '"')"           # "
#    ^           ^


# 때때로 이것은 유용하게 사용됩니다.

var1="Two bits"
echo "\$var1 = "$var1""      # $var1 = Two bits
#    ^                ^

# 또는 Chris Hiestand가 지적한 대로...

if [[ "$(du "$My_File1")" -gt "$(du "$My_File2")" ]]
#     ^     ^         ^ ^     ^     ^         ^ ^
then
  ...
fi
# ************************************************************ #