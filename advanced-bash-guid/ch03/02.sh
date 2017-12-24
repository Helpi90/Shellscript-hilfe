#!/bin/bash
# rpm-check.sh

#  rpm 파일의 상세정보, 파일목록, 설치여부를 조회하고,
#+ 결과를 파일로 저장합니다.
#
#  이 스크립트는 코드 블록을 사용하는 방법에 대해 서술합니다.

SUCCESS=0
E_NOARGS=65

if [ -z "$1" ]
then
  echo "Usage: `basename $0` rpm-file"
  exit $E_NOARGS
fi

{ # 코드 블록 시작
  echo
  echo "Archive Description:"
  rpm -qpi $1       # 상세정보 조회
  echo
  echo "Archive Listing:"
  rpm -qpl $1       # 파일 목록 조회
  echo
  rpm -i --test $1  # 설치 여부 조회
  if [ "$?" -eq $SUCCESS ]
  then
    echo "$1 can be installed."
  else
    echo "$1 cannot be installed."
  fi
  echo              # 코드 블록 종료
} > "$1.test"       # 블록 내의 모든 결과를 파일로 리다이렉트

echo "Results of rpm test in file $1.test"

# 옵션들에 대한 설명은 rpm man 페이지를 참조하세요.

exit 0