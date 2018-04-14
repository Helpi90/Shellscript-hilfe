#!/bin/bash
# Cleanup, 버전 3

#  Warning:
#  -------
#  이 스크립트는 나중에 설명할 많은 기능을 담고 있습니다.
#  이 문서의 전반부를 끝내면 궁금한 점이 사라질 것입니다.



LOG_DIR=/var/log
ROOT_UID=0     # $UID가 0인 사용자만이 루트 권한을 가집니다.
LINES=50       # 저장된 기본 라인 수
E_XCD=86       # 디렉토리를 변경할 수 없는 경우의 에러
E_NOTROOT=87   # 루트 권한이 없는 경우의 에러


# 당연히 루트로 실행합니다.
if [ "$UID" -ne "$ROOT_UID" ]
then
  echo "Must be root to run this script."
  exit $E_NOTROOT
fi

if [ -n "$1" ]
# 명령줄 인자가 존재하는지 테스트 합니다.
then
  lines=$1
else
  lines=$LINES # Default, if not specified on command-line.
fi

#  Stephane Chazelas는 명령줄 인자를 체크하는 더 나은 방법을 제안했습니다.
#  하지만, 이 단계에서는 아직까지는 조금 고급 기술입니다.
#
#    E_WRONGARGS=85  # 숫자가 아닌 인자인 경우 (잘못된 인자 포맷 체크)
#
#    case "$1" in
#    ""      ) lines=50;;
#    *[!0-9]*) echo "Usage: `basename $0` lines-to-cleanup";
#     exit $E_WRONGARGS;;
#    *       ) lines=$1;;
#    esac
#
# 위의 구문을 해석하려면 "Loops" 챕터를 참고하십시오.

cd $LOG_DIR

if [ `pwd` != "$LOG_DIR" ]  # or   if [ "$PWD" != "$LOG_DIR" ]
                            # Not in /var/log?
then
  echo "Can't change to $LOG_DIR."
  exit $E_XCD
fi  # 로그파일을 삭제하기 전에 올바른 디렉토리인지 재확인합니다.

# 더 효율적인 방법:
#
# cd /var/log || {
#   echo "Cannot change to necessary directory." >&2
#   exit $E_XCD;
# }


tail -n $lines messages > mesg.temp # 메시지 로그파일의 마지막 섹션을 저장합니다.
mv mesg.temp messages               # 저장한 것을 시스템 로그 파일로 이름을 변경합니다.


#  위의 방법이 더 안전하기 때문에,
#  cat /dev/null > messages 는 더이상 필요하지 않습니다.

cat /dev/null > wtmp  #  ': > wtmp' 와 '> wtmp' 는 동일한 효과를 나타냅니다.
echo "Log files cleaned up."
#  /var/log 디렉토리에는 이 스크립트에 영향받지 않는 다른 로그들이 있음에 유의하세요.

exit 0
#  스크립트의 리턴 값이 0인 경우 쉘에 성공을 알립니다.