#!/bin/bash
# arith-tests.sh
# 산술식 테스트

# (( ... )) 구조는 산술식을 평가하고 테스트합니다.
# 종료 상태는 [ ... ] 구조와 반대입니다.

(( 0 ))
echo "Exit status of \"(( 0 ))\" is $?."         # 1

(( 1 ))
echo "Exit status of \"(( 1 ))\" is $?."         # 0

(( 5 > 4 ))                                      # true
echo "Exit status of \"(( 5 > 4 ))\" is $?."     # 0

(( 5 > 9 ))                                      # false
echo "Exit status of \"(( 5 > 9 ))\" is $?."     # 1

(( 5 == 5 ))                                     # true
echo "Exit status of \"(( 5 == 5 ))\" is $?."    # 0
# (( 5 = 5 ))  gives an error message.

(( 5 - 5 ))                                      # 0
echo "Exit status of \"(( 5 - 5 ))\" is $?."     # 1

(( 5 / 4 ))                                      # 나누기 ok
echo "Exit status of \"(( 5 / 4 ))\" is $?."     # 0

(( 1 / 2 ))                                      # 나누기 결과가 1보다 작기 때문에,
echo "Exit status of \"(( 1 / 2 ))\" is $?."     # 0으로 Rounded off 됨.
                                                 # 1

(( 1 / 0 )) 2>/dev/null                          # 0으로 나누는 것은 허용되지 않음.
#           ^^^^^^^^^^^
echo "Exit status of \"(( 1 / 0 ))\" is $?."     # 1

# "2>/dev/null"은 무슨 역할을 할까요?
# 이것을 지운다면 어떤 일이 벌어질까요?
# 이것을 지운다음 스크립트를 재실행해 봅시다.

# ======================================= #

# (( ... )) 는 if-then 테스트에서도 유용하게 사용됩니다.

var1=5
var2=4

if (( var1 > var2 ))
then #^      ^      Note: $var1, $var2가 아닙니다. 왜일까요?
  echo "$var1 is greater than $var2"
fi     # 5 is greater than 4

exit 0