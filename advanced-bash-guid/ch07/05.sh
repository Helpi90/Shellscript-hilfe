#!/bin/bash

a=4
b=5

#  여기서 "a"와 "b"는 정수 또는 문자열로 간주합니다.
#  Bash 변수는 타입을 명확하게 지정하지 않기 때문에,
#+ 산술 비교인지 문자열 비교인지 모호한 부분이 있습니다.

# Bash는 변수의 모든 값이 정수로 구성된 경우 정수의 연산과 비교를 허용합니다.
# 하지만 주의를 요합니다.

echo

if [ "$a" -ne "$b" ]
then
  echo "$a is not equal to $b"
  echo "(arithmetic comparison)"
fi

echo

if [ "$a" != "$b" ]
then
  echo "$a is not equal to $b."
  echo "(string comparison)"
  #     "4"  != "5"
  # ASCII 52 != ASCII 53
fi

# 이러한 특별한 경우에 "-ne"와 "!=" 모두 동작합니다.

echo

exit 0