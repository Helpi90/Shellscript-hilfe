#!/bin/bash

#  Tip:
#  특정 조건이 어떻게 평가되어야 하는지 확실치 않은 경우,
#+ if-test 내에서 테스트 합니다.

echo

echo "Testing \"0\""
if [ 0 ]      # zero
then
  echo "0 is true."
else          # Or else ...
  echo "0 is false."
fi            # 0은 true.

echo

echo "Testing \"1\""
if [ 1 ]      # one
then
  echo "1 is true."
else
  echo "1 is false."
fi            # 1은 true.

echo

echo "Testing \"-1\""
if [ -1 ]     # minus one
then
  echo "-1 is true."
else
  echo "-1 is false."
fi            # -1은 true.

echo

echo "Testing \"NULL\""
if [ ]        # NULL (empty condition)
then
  echo "NULL is true."
else
  echo "NULL is false."
fi            # NULL은 false.

echo

echo "Testing \"xyz\""
if [ xyz ]    # string
then
  echo "Random string is true."
else
  echo "Random string is false."
fi            # 임의의 문자열은 true.

echo

echo "Testing \"\$xyz\""
if [ $xyz ]   # $xyz가 null 인지 테스트합니다.
              # 하지만 현재는 초기화되지 않은 변수입니다.
then
  echo "Uninitialized variable is true."
else
  echo "Uninitialized variable is false."
fi            # 초기화되지 않은 변수는 false.

echo

echo "Testing \"-n \$xyz\""
if [ -n "$xyz" ]            # 좀더 유식한척하면...
then
  echo "Uninitialized variable is true."
else
  echo "Uninitialized variable is false."
fi            # 초기화되지 않은 변수는 false.

echo


xyz=          # 초기화 하였지만, null 값을 설정한 경우.

echo "Testing \"-n \$xyz\""
if [ -n "$xyz" ]
then
  echo "Null variable is true."
else
  echo "Null variable is false."
fi            # Null 변수는 false.


echo


# "false"는 언제 true 일까요?

echo "Testing \"false\""
if [ "false" ]              #  이것은 단순히 "false" 문자열을 의미하므로...
then
  echo "\"false\" is true." #+ 이것을 테스트하면 true입니다.
else
  echo "\"false\" is false."
fi            # "false"는 true.

echo

echo "Testing \"\$false\""  # 다시, 초기화되지 않은 변수입니다.
if [ "$false" ]
then
  echo "\"\$false\" is true."
else
  echo "\"\$false\" is false."
fi            # "$false"는 false.
              # 예상하던 결과를 얻었습니다.

#  초기화되지않은 "$true" 변수를 테스트하면 어떻게 될까요?

echo

exit 0