#!/bin/bash
# 벌거벗은 변수

echo

# 변수가 "벌거벗은" 경우 즉, 변수앞에 '$'이 붙지않았다면,
# 이 때, 변수는 참조가 아니라 할당됩니다.

# 할당(Assignment)
a=879
echo "The value of \"a\" is $a."

# 'let'을 사용하여 할당
let a=16+5
echo "The value of \"a\" is now $a."

echo

# 'for' 루프 안에서 사용 (이렇게도 값을 할당 할 수 있습니다.):
echo -n "Values of \"a\" in the loop are: "
for a in 7 8 9 11
do
  echo -n "$a "
done

echo
echo

# 'read' 구문에서 사용 (역시 할당이 가능합니다):
echo -n "Enter \"a\" "
read a
echo "The value of \"a\" is now $a."

echo

exit 0