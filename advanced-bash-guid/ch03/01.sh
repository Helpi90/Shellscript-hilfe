#!/bin/bash
# /etc/fstab 에서 라인을 읽습니다.

File=/etc/fstab

{
read line1
read line2
} < $File

echo "First line in $File is:"
echo "$line1"
echo
echo "Second line in $File is:"
echo "$line2"

exit 0

# 자! 이제 라인의 각 필드는 어떻게 파싱하면 될까요?
# 힌트: awk 사용하거나...
# Hans-Joerg Diers는 "set" Bash 빌트인을 사용할 것을 제안합니다.