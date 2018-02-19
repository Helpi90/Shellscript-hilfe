#!/bin/bash

# 예를들어 아래와 같이 최소 10개 이상의 매개변수(parameter)를 사용하여 이 스크립트를 호출하세요.
# ./scriptname 1 2 3 4 5 6 7 8 9 10
MINPARAMS=10

echo

echo "The name of this script is \"$0\"."
# 현재 디렉토리(./)를 포함합니다.
echo "The name of this script is \"`basename $0`\"."
# 경로 정보를 제거합니다.('basename' 참조)

echo

if [ -n "$1" ]              # 조건식의 변수에 따옴표를 칩니다.
then
 echo "Parameter #1 is $1"  # #을 이스케이프 하기 위해 따옴표가 필요합니다.
fi

if [ -n "$2" ]
then
 echo "Parameter #2 is $2"
fi

if [ -n "$3" ]
then
 echo "Parameter #3 is $3"
fi

# ...


if [ -n "${10}" ]  # $9 보다 큰 매개변수는 {대괄호}로 감싸야 합니다.
then
 echo "Parameter #10 is ${10}"
fi

echo "-----------------------------------"
echo "All the command-line parameters are: "$*""

if [ $# -lt "$MINPARAMS" ]
then
  echo
  echo "This script needs at least $MINPARAMS command-line arguments!"
fi

echo

exit 0