#!/bin/bash
# gcd.sh: 최대 공약수(greatest common divisor)
#         유클리드 호제법을 사용합니다.

#  두 정수의 최대 공약수는 나머지 없이 두 정수를 모두 나눌수 있는 가장큰 정수값입니다.

#  유클리드 호제법은 연속적인 나눗셈을 사용합니다.
#
#    각 단계에서,
#+      피제수(dividend) <---  제수(divisor)
#+      제수(divisor)   <---  나머지(remainder)
#+   를 나머지(remainder) = 0이 될 때까지 수행합니다.
#    마지막 단계에서 최대 공약수는 피제수입니다.
#
#  유클리드의 호제법에 대한 훌륭한 토론은
#+ Jim Loy의 사이트 http://www.jimloy.com/number/euclids.htm을 참조하십시오.


# ------------------------------------------------------
# Argument check
ARGS=2
E_BADARGS=85

if [ $# -ne "$ARGS" ]
then
  echo "Usage: `basename $0` first-number second-number"
  exit $E_BADARGS
fi
# ------------------------------------------------------


gcd ()
{

  dividend=$1             #  Arbitrary assignment.
  divisor=$2              #! It doesn't matter which of the two is larger.
                          #  Why not?

  remainder=1             #  If an uninitialized variable is used inside
                          #+ test brackets, an error message results.

  until [ "$remainder" -eq 0 ]
  do    #  ^^^^^^^^^^  Must be previously initialized!
    let "remainder = $dividend % $divisor"
    dividend=$divisor     # Now repeat with 2 smallest numbers.
    divisor=$remainder
  done                    # Euclid's algorithm

}                         # Last $dividend is the gcd.


gcd $1 $2

echo; echo "GCD of $1 and $2 = $dividend"; echo


# Exercises :
# ---------
# 1) Check command-line arguments to make sure they are integers,
#+   and exit the script with an appropriate error message if not.
# 2) Rewrite the gcd () function to use local variables.

exit 0