#!/bin/bash -xv
# SPDX-FileCopyrightText: 2022 Yosuke sakamoto
# SPDX-License-Identifier: BSD-3-Clause

#keisanに対してのテストプログラム#
 
ng () {
      echo NG at Line $1
      res=1
}

res=0

#I/0test#
out=$(seq 5 | ./keisan)
[ "${out}" = "-60 10000 3.0 6 5 " ] || ng ${LINENO}         

[ "$res" = 0 ] && echo OK
exit $res

# strange imput #
out=$(echo あ | ./plus) 
[ "$?" = 1 ]      || ng ${LINENO}
[ "${out}" = "" ] || ng ${LINENO} 
	        　
out=$(echo | ./plus) 
[ "$?" = 1 ]      || ng ${LINENO}
[ "${out}" = "" ] || ng ${LINENO}
		      　
[ "$res" = 0 ] && echo OK
exit $resi
