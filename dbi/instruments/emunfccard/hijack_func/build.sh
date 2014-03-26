#!/bin/sh

list=`ls *.c`

rm -f *.o
for i in $list;
do
~/android/toolchain/arm-2008q3/bin/arm-none-linux-gnueabi-gcc -I../libnfc-nxp/inc -I../../../Nfc/jni -I.. -I../libnfc-nxp/src -c $i
done

list=`ls *_thumb.c`
for i in $list;
do
~/android/toolchain/arm-2008q3/bin/arm-none-linux-gnueabi-gcc -I../libnfc-nxp/inc -I../../../Nfc/jni -I.. -I../libnfc-nxp/src -c $i -mthumb
done

list=`ls *.h`

rm -f ../hijacks.h
echo "// autogenerated file" >../hijacks.h
echo "#ifndef __HIJACKS_H__" >>../hijacks.h
echo "#define __HIJACKS_H__" >>../hijacks.h

for i in $list;
do
echo "#include \"hijack_func/$i\"" >>../hijacks.h
done
echo "#endif" >>../hijacks.h
