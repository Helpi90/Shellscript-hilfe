#!/bin/bash
#  str-test.sh: null 문자열 및 인용되지 않은(unquoted) 문자열 테스트

# if [ ... ] 사용하기

# 문자열이 초기화되어 있지 않다면, 정의된 값이 없습니다.
# 이 상태를 "null"이라고 부릅니다. (zero가 아닙니다!)

if [ -n $string1 ]    # string1은 선언되거나 초기화되지 않았습니다.
then
  echo "String \"string1\" is not null."
else
  echo "String \"string1\" is null."
fi                    # 잘못된 결과.
# $string1을 초기화하지 않았지만, null을 표시하지 않습니다.

echo

# 다시 시도해 봅시다.

if [ -n "$string1" ]  # 이번에는 $string1이 인용되었습니다.
then
  echo "String \"string1\" is not null."
else
  echo "String \"string1\" is null."
fi                    # 테스트 대괄호 구문내의 문자열은 따옴표로 인용합시다!

echo

if [ $string1 ]       # 이번에는 $string1만 써봅니다.
then
  echo "String \"string1\" is not null."
else
  echo "String \"string1\" is null."
fi                    # 이것도 잘 동작하네요.
# [ ... ] 테스트 연산자는 문자열이 null인지 감지합니다.
# 하지만 문자열을 인용하는 것이 좋은 방법입니다. (if [ "$string1" ])
#
# Stephane Chazelas가 지적한대로,
#    if [ $string1 ]    은 하나의 인수("]")를 가지며,
#    if [ "$string1" ]  은 두개의 인수(the empty "$string1" and "]")를 가집니다.


echo


string1=initialized

if [ $string1 ]       # 다시, $string1을 따옴표로 묶지 않았습니다.
then
  echo "String \"string1\" is not null."
else
  echo "String \"string1\" is null."
fi                    # 역시 올바른 결과를 제공합니다.
# 하지만 여전히 따옴표로 감싸는 것("$string1")이 나은 방법입니다. 왜냐하면...


string1="a = b"

if [ $string1 ]       # 이번에도 $string1을 따옴표로 묶지 않았습니다.
then
  echo "String \"string1\" is not null."
else
  echo "String \"string1\" is null."
fi                    # 따옴표로 묶지 않는 "$string1"은 잘못된 결과가 나옵니다!

exit 0   # Florian Wisser에게 감사드립니다.