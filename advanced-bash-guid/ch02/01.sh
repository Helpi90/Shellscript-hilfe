# Cleanup
# 물론 root로 실행해야 합니다.

cd /var/log
cat /dev/null > messages
cat /dev/null > wtmp
echo "Log files cleaned up."