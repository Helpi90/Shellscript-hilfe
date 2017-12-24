#!/bin/bash
# broken-link.sh
# Written by Lee bigelow <ligelowbee@yahoo.com>
# Used in ABS Guide with permission.

#  죽은 심볼릭링크(symlink)를 찾아서 인용된 형태로 출력하고,
#+ 출력된 결과를 xargs에 입력하여 처리할 수 있게 하는 순수한 쉘 스크립트 입니다.
#+ eg. sh broken-link.sh /somedir /someotherdir|xargs rm
#
#  아래와 같은 더 나은 방법이 있습니다:
#
#  find "somedir" -type l -print0|\
#  xargs -r0 file|\
#  grep "broken symbolic"|
#  sed -e 's/^\|: *broken symbolic.*$/"/g'
#
#+ 하지만, 이것은 순수한 Bash 구문은 아닙니다.
#  Caution: /proc 파일 시스템과 순환 링크를 주의하세요.
################################################################


#  스크립트에 인수가 전달되지 않으면 검색할 디렉토리를 현재 디렉토리로 설정합니다.
#+ 인수가 전달되었다면, 전달된 인수를 검색할 디렉토리로 설정합니다.
######################

[ $# -eq 0 ] && directorys=`pwd` || directorys=$@


#  디렉토리를 체크할 linkchk 함수를 설정합니다.
#+ element가 링크이며 파일이 존재하지 않는다면, 인용하여 출력합니다.
#  만약, element가 디렉토리 내의 서브 디렉토리라면
#+ 서브 디렉토리를 linkchk 함수로 전달합니다.
##########

linkchk () {
    for element in $1/*; do
      [ -h "$element" -a ! -e "$element" ] && echo \"$element\"
      [ -d "$element" ] && linkchk $element
    # '-h' 는 심볼릭링크인지 검사하며, '-d'는 디렉토리인지 검사합니다.
    done
}

#  스크립트로 전달된 각각의 arg가 유효한 디렉토리인 경우 linkchk() 함수로 전달합니다.
#+ 그렇지 않다면, 에러 메시지와 사용법을 출력합니다.
##################
for directory in $directorys; do
    if [ -d $directory ]
	then linkchk $directory
	else
	    echo "$directory is not a directory"
	    echo "Usage: $0 dir1 dir2 ..."
    fi
done

exit $?