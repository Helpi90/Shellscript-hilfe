#!/bin/bash
# escaped.sh: 이스케이프된 문자

#############################################################
### 먼저 기본적인 이스케이프된 문자의 사용법을 보여드리겠습니다.      ###
#############################################################

# newline 이스케이프하기.
# ------------------

echo ""

echo "This will print
as two lines."
# This will print
# as two lines.

echo "This will print \
as one line."
# This will print as one line.

echo; echo

echo "============="


echo "\v\v\v\v"      # \v\v\v\v 문자열로 출력.
# 'echo'의 -e 옵션을 사용하면 이스케이프된 문자로 출력합니다.
echo "============="
echo "VERTICAL TABS"
echo -e "\v\v\v\v"   # 4개의 vertical tab을 출력합니다.
echo "=============="

echo "QUOTATION MARK"
echo -e "\042"       # " (quote, 8진수 ASCII 문자 42)를 출력합니다.
echo "=============="



# $'\X' 구조는 -e 옵션이 필요하지 않습니다.

echo; echo "NEWLINE and (maybe) BEEP"
echo $'\n'           # Newline.
echo $'\a'           # Alert (beep).
                     # 터미널에 따라 beep 대신 flash 일 수도 있습니다..

# 우리는 $'\nnn" 문자열 확장을 보았습니다. 그리고 이제...

# =================================================================== #
# Bash 버전 2에서 $'\nnn' 문자열 확장 구조가 도입되었습니다.
# =================================================================== #

echo "Introducing the \$\' ... \' string-expansion construct . . . "
echo ". . . featuring more quotation marks."

echo $'\t \042 \t'   # 챕으로 둘러싸인 Quote (")
# '\nnn' 은 8진수 값입니다.

# 16진수 값  $'\xhhh' 으로도 동작합니다.
echo $'\t \x22 \t'  # 탭으로 둘러싸인 Quote (").
# 이것을 지적해주신 Greg Keraunen 씨, 감사합니다.
# 이전 Bash 버전은 '\x022'을 허용했습니다.

echo


# 변수에 ASCII 문자 할당하기.
# ----------------------------------------
quote=$'\042'        # 변수에 " 를 할당합니다.
echo "$quote Quoted string $quote and this lies outside the quotes."

echo

# 변수에 ASCII 문자를 연결합니다.
triple_underline=$'\137\137\137'  # 137은 8진수 ASCII 코드 '-'입니다.
echo "$triple_underline UNDERLINE $triple_underline"

echo

ABC=$'\101\102\103\010'           # 101, 102, 103 는 8진수 A, B, C.
echo $ABC

echo

escape=$'\033'                    # 033 은 8진수 이스케이프.
echo "\"escape\" echoes as $escape"
#                                   output이 보이지 않음.

echo

exit 0