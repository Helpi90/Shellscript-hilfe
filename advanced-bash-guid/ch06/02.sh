true    # 빌트인 "true"
echo "exit status of \"true\" = $?"     # 0

! true
echo "exit status of \"! true\" = $?"   # 1
# 명령어와 "!" 사이에 공백이 필요합니다.
#    !true  는 "command not found" 오류가 발생합니다.
#
# 명령어 앞의 '!' 연산자는 Bash 히스토리 매커니즘을 호출합니다.

true
!true
# 이번에는 오류가 발생하지 않습니다.
# 단순히 이전 명령(true)을 반복합니다.


# =========================================================== #
# _pipe_ 앞에 !를 붙여 반환된 죵료 상태를 반전시킵니다.
ls | bogus_command     # bash: bogus_command: command not found
echo $?                # 127

! ls | bogus_command   # bash: bogus_command: command not found
echo $?                # 0
# ! 는 파이프의 실행을 변경하지는 않고, 단순히 종료 상태만 변경합니다.
# =========================================================== #

# Thanks, Stéphane Chazelas and Kristopher Newsome.