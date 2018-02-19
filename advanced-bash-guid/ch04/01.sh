#!/bin/bash
# ex9.sh

# 변수: 할당(assignment)과 치환(substitution)

a=375
hello=$a
#   ^ ^

#-------------------------------------------------------------------------
# 변수를 초기화 할 때 = 기호 양 옆의 공백은 허용하지 않습니다.
# 공백이 있다면 어떻게 될까요?

#  "VARIABLE =value"
#           ^
#% 스크립트는 "VARIABLE"을 커맨드로 인식하고 "=value" 인자와 함께 실행하려 할 것입니다.

#  "VARIABLE= value"
#            ^
#% 스크립트는 "value"를 커맨드로 인식하고
#+ 환경변수 "VARIABLE"을 ""로 셋팅하여 실행하려 할 것입니다.
#-------------------------------------------------------------------------


echo hello    # hello
# 변수 참조가 아니라 단순히 문자열 "hello"를 나타냅니다.

echo $hello   # 375
#    ^          이것은 변수 참조 입니다.
echo ${hello} # 375
#               위와 같은 변수 참조 입니다.

# Quoting ...
echo "$hello"    # 375
echo "${hello}"  # 375

echo

hello="A B  C   D"
echo $hello   # A B C D
echo "$hello" # A B  C   D
# 보시다시피, echo $hello 와 echo "$hello" 는 다른 결과를 나타냅니다.
# =======================================
# 변수에 큰 따옴표를 치면(Quoting) 공백이 보존됩니다.
# =======================================

echo

echo '$hello'  # $hello
#    ^      ^
# 작은 따옴표는 "$"를 문자 그대로 해석하기 때문에,
#+ 변수 참조를 비활성(이스케이프) 시킵니다.

# 인용부호의 타입에 따라 다른 효과가 나타남에 주목하세요.


hello=    # null 값을 설정합니다.
echo "\$hello (null value) = $hello"      # $hello (null value) =
#  변수를 null로 셋팅화는 것과 셋팅하지 않는 것과는
#+ 결과는 같지만(아래 참조) 실제로는 다릅니다.

# --------------------------------------------------------------

#  공백으로 구분하여 같은 라인에 여러개의 변수를 선언하는 것이 가능합니다.
#  하지만 가독성과 이식성이 떨어질 수 있으니 주의하세요.

var1=21  var2=22  var3=$V3
echo
echo "var1=$var1   var2=$var2   var3=$var3"

# 레거시 버전의 "sh"에서 문제가 발생할 수도 있습니다.

# --------------------------------------------------------------

echo; echo

numbers="one two three"
#           ^   ^
other_numbers="1 2 3"
#               ^ ^
#  값에 공백이 포함되어 있다면 따옴표가 필요합니다.
#  other_numbers=1 2 3                  # 에러 발생.
echo "numbers = $numbers"
echo "other_numbers = $other_numbers"   # other_numbers = 1 2 3
#  따옴표 대신 공백문자를 이스케이프 해도 됩니다.
mixed_bag=2\ ---\ Whatever
#           ^    ^ 이스케이프된 스페이스.

echo "$mixed_bag"         # 2 --- Whatever

echo; echo

echo "uninitialized_variable = $uninitialized_variable"
# 초기화되지 않은 변수는 null 값을 가집니다. (값이 없음)
uninitialized_variable=   #  선언되었으나, 초기화 되지는 않았음
                          #+ 위와 같이 null 값을 설정한 것과 같습니다.
echo "uninitialized_variable = $uninitialized_variable"
                          # 이것 역시 null 값을 가집니다.

uninitialized_variable=23       # 값을 설정 하고,
unset uninitialized_variable    # unset 합니다.
echo "uninitialized_variable = $uninitialized_variable"
                                # uninitialized_variable =
                                # 이것 역시 null 값을 가집니다.
echo

exit 0