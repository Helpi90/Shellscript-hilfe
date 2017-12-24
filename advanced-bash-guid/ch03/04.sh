#!/bin/bash

# 현재 디렉토리에서 지난 24시간 이내에 수정된 모든 파일을 "tarball"로 백업합니다.

BACKUPFILE=backup-$(date +%m-%d-%Y)
#                 백업 파일 이름에 날짜를 포함합니다.
#                 Thanks, Joshua Tschida, for the idea.
archive=${1:-$BACKUPFILE}
#  명령줄에서 백업파일의 이름을 지정하지 않은 경우
#+ 기본 이름은 "backup-MM-DD-YYYY.tar.gz."이 됩니다.

tar cvf - `find . -mtime -1 -type f -print` > $archive.tar
gzip $archive.tar
echo "Directory $PWD backed up in archive file \"$archive.tar.gz\"."


#  Stephane Chazelas는 너무 많은 파일이 존재하거나
#+ 파일이름에 공백이 있는 경우 위의 코드가 실패할 것이라 지적합니다.

# 그는 다음과 같은 대안을 제안했습니다:
# -------------------------------------------------------------------
#   find . -mtime -1 -type f -print0 | xargs -0 tar rvf "$archive.tar"
#      GNU 버전의 "find"를 사용

#   find . -mtime -1 -type f -exec tar rvf "$archive.tar" '{}' \;
#         다른 UNIX 계열의 "find"를 사용, 하지만 훨씬 느립니다.
# -------------------------------------------------------------------

exit 0