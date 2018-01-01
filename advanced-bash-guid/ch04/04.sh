#!/bin/bash
# int-or-string.sh

a=2334                   # 정수(Integer).
let "a += 1"
echo "a = $a "           # a = 2335
echo                     # 아직도 정수(Integer).


b=${a/23/BB}             # "23"을 "BB"로 대치합니다.
                         # $b는 문자열(string)로 변환됩니다.
echo "b = $b"            # b = BB35
declare -i b             # 변수 b를 정수로 선언하는 것은 별 도움이 되지 않습니다.
echo "b = $b"            # b = BB35

let "b += 1"             # BB35 + 1
echo "b = $b"            # b = 1
echo                     # Bash는 문자열의 "integer value"를 0으로 설정합니다.

c=BB34
echo "c = $c"            # c = BB34
d=${c/BB/23}             # "BB"를 "23"으로 대치합니다.
                         # $d를 정수로 만들었습니다.
echo "d = $d"            # d = 2334
let "d += 1"             # 2334 + 1
echo "d = $d"            # d = 2335
echo


# null 변수는 어떻게 될까요?
e=''                     # ... Or e="" ... Or e=
echo "e = $e"            # e =
let "e += 1"             # null 변수에 산술 연산이 가능할까요?
echo "e = $e"            # e = 1
echo                     # null 변수는 정수로 변환되었습니다.

# 선언되지 않은 변수는 어떻게 될까요?
echo "f = $f"            # f =
let "f += 1"             # 산술 연산이 가능할까요?
echo "f = $f"            # f = 1
echo                     # 선언되지 않은 변수는 정수로 변환되었습니다.
#
# 하지만...
let "f /= $undecl_var"   # 이경우 선언되지 않은 변수가 0으로 인식될까요?
#   let: f /= : syntax error: operand expected (error token is " ")
# Syntax error! $undecl_var 변수는 여기서는 0으로 설정되지 않습니다!
#
# 하지만 여전히...
let "f /= 0"
#   let: f /= 0: division by 0 (error token is "0")
# 예상했던 결과.


#  Bash는 (보통) 산술 연산을 수행할 때 null의 "정수 값"을 0으로 설정합니다.
#  하지만 이렇게 사용하지는 마세요.
#  이것은 문서화된 것이 아니고, 다른 곳에 이식시 동작하지 않을 수 있습니다.


#  결론: Bash의 변수는 타입이 없음

exit $?