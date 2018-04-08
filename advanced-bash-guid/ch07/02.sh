#!/bin/bash

echo

if test -z "$1"
then
  echo "No command-line arguments."
else
  echo "First command-line argument is $1."
fi

echo

if /usr/bin/test -z "$1"      # "test" 빌트인과 동일함.
#  ^^^^^^^^^^^^^              # 전체 경로 지정
then
  echo "No command-line arguments."
else
  echo "First command-line argument is $1."
fi

echo

if [ -z "$1" ]                # 위의 코드블럭과 기능적으로 동일합니다.
#   if [ -z "$1"                이 경우에도 동작해야 하지만...
#+  Bash 는 닫는 괄호가 없다는 에러 메시지를 응답합니다.
then
  echo "No command-line arguments."
else
  echo "First command-line argument is $1."
fi

echo


if /usr/bin/[ -z "$1" ]       # 역시, 기능적으로 위와 동일합니다.
# if /usr/bin/[ -z "$1"       # 동작합니다. 하지만 에러 메시지를 출력합니다.
#                             # Note:
#                               Bash 버전 3.x 에서 고쳐졌습니다.
then
  echo "No command-line arguments."
else
  echo "First command-line argument is $1."
fi

echo

exit 0