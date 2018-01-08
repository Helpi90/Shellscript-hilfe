#!/bin/bash
# ex18.sh

# 다음 3개의 서버 중 하나에서 'whois domain-name' 조회를 합니다:
#                    ripe.net, cw.net, radb.net

# 이 스크립트의 이름을 'wh'로 바꾸어 /user/local/bin 으로 복사합니다.

# 다음과 같은 심볼릭 링크가 필요합니다:
# ln -s /usr/local/bin/wh /usr/local/bin/wh-ripe
# ln -s /usr/local/bin/wh /usr/local/bin/wh-apnic
# ln -s /usr/local/bin/wh /usr/local/bin/wh-tucows

E_NOARGS=75


if [ -z "$1" ]
then
  echo "Usage: `basename $0` [domain-name]"
  exit $E_NOARGS
fi

# 스크립트의 이름을 확인하여 적절한 서버를 호출합니다.
case `basename $0` in    # 또는:    case ${0##*/} in
    "wh"       ) whois $1@whois.tucows.com;;
    "wh-ripe"  ) whois $1@whois.ripe.net;;
    "wh-apnic" ) whois $1@whois.apnic.net;;
    "wh-cw"    ) whois $1@whois.cw.net;;
    *          ) echo "Usage: `basename $0` [domain-name]";;
esac

exit $?