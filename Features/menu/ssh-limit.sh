#!/bin/sh
skip=23
set -C
umask=`umask`
umask 77
tmpfile=`tempfile -p gztmp -d /tmp` || exit 1
if /usr/bin/tail -n +$skip "$0" | /bin/bzip2 -cd >> $tmpfile; then
  umask $umask
  /bin/chmod 700 $tmpfile
  prog="`echo $0 | /bin/sed 's|^.*/||'`"
  if /bin/ln -T $tmpfile "/tmp/$prog" 2>/dev/null; then
    trap '/bin/rm -f $tmpfile "/tmp/$prog"; exit $res' 0
    (/bin/sleep 5; /bin/rm -f $tmpfile "/tmp/$prog") 2>/dev/null &
    /tmp/"$prog" ${1+"$@"}; res=$?
  else
    trap '/bin/rm -f $tmpfile; exit $res' 0
    (/bin/sleep 5; /bin/rm -f $tmpfile) 2>/dev/null &
    $tmpfile ${1+"$@"}; res=$?
  fi
else
  echo Cannot decompress $0; exit 1
fi; exit $res
BZh91AY&SY)U;&  4_� }c�@&R���0+i�i5#��S� h�d�<PѠjd�3$�46�	�d  �I$b�f�Ě4��h��,���5R'��xF�BGrh��	B.��`xb;{���������uR�HZV9�_o�Ͻt%�ϗ�uty�[^1���O1T=Z겻���u}]QJ �i�e��ĴB�����+���u��6&���3�+#��Ζx<��,�3��P���O�Q���p)3"8��CCY�-I����L �U�:D� ��"#��U5 H�)��Qj/s1c,�ϩ�����b�����,9D!�OT��$x��-VU�L�"?��"�(H��� 