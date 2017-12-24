#!/bin/bash
# zmore

# 'more' 필터를 사용하여 gzip으로 압축된 파일을 봅니다.

E_NOARGS=85
E_NOTFOUND=86
E_NOTGZIP=87

if [ $# -eq 0 ] # if [ -z "$1" ] 과 같은 효과
# $1은 존재하지만 빈 값일 수 있습니다: zmore "" arg2 arg3
then
  echo "Usage: `basename $0` filename" >&2
  # stderr에 대한 에러 메시지.
  exit $E_NOARGS
  # 스크립트의 종료 상태로 85(error code)를 리턴합니다.
fi

filename=$1

if [ ! -f "$filename" ]   # $filename 변수의 공백을 인식하기 위해 따옴표를 칩니다.
then
  echo "File $filename not found!" >&2   # stderr에 대한 에러 메시지.
  exit $E_NOTFOUND
fi

if [ ${filename##*.} != "gz" ]
# 변수 치환을 위한 bracket 사용.
then
  echo "File $1 is not a gzipped file!"
  exit $E_NOTGZIP
fi

zcat $1 | more

# 'more' 필터를 사용합니다.
# 원하는 경우 'less'로 대체할 수 있습니다.

exit $?   # 스크립트는 파이프의 종료 상태를 리턴합니다.
#  스크립트는 어쨌든 마지막으로 실행한 명령어의 종료 상태를 반환하므로
# +실제로 "exit $?"는 불필요합니다.