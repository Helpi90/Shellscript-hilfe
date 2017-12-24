#!/bin/bash
# Bash 스크립트의 적절한 헤더입니다.

# Cleanup, 버전 2

# 물론 root로 실행해야 합니다.
# root가 아닌 경우 에러 메시지를 출력하고 종료하는 코드를 넣습니다.

LOG_DIR=/var/log
# 변수는 하드코딩된 값 보다 좋습니다.
cd $LOG_DIR

cat /dev/null > messages
cat /dev/null > wtmp


echo "Logs cleaned up."

exit #  스크립트를 "종료"하기 위한 올바르고 적절한 방법
     #  파라미터가 없는 "exit"의 경우 이전 명령어의 상태를 리턴합니다.