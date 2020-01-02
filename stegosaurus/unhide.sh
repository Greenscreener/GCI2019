filename=$1
printf "\"Decrypting\"...\n"
tmpDir=/tmp/stegosaurus-$RANDOM
mkdir $tmpDir
cp $filename $tmpDir
cd $tmpDir
cat $filename | awk '/grnscrnr/,0' > stage5.tmp.rat.zg
dd if=stage5.tmp.rat.zg bs=1 skip=8 of=stage5.rat.zg 2>/dev/null
cat stage5.rat.zg | xxd -p -c1 | tac | xxd -p -r > stage4.tmp.tar.gz
dd if=stage4.tmp.tar.gz bs=1 skip=1 of=stage4.tar.gz 2>/dev/null
tar -xf stage4.tar.gz
cat this-is-a-nice-picture-isnt-it.jpg | awk '/grnscrnr/,0' > this-is-fun-0.tmp.tar
dd if=this-is-fun-0.tmp.tar bs=1 skip=8 of=this-is-fun-0.tar 2>/dev/null
for i in {0..1000}
do
    tar -xf this-is-fun-$i.tar
    rm this-is-fun-$i.tar
done
cat this-is-an-image.png | awk '/grnscrnr/,0' > stage2.tmp.rat
dd if=stage2.tmp.rat bs=1 skip=8 of=stage2.rat 2>/dev/null
cat stage2.rat | xxd -p -c1 | tac | xxd -p -r  > stage1.tmp.tar
dd if=stage1.tmp.tar bs=1 skip=1 of=stage1.tar 2>/dev/null
tar -xf stage1.tar
printf "Message: "
cat this-is-a-very-very-secret-message-btw
rm -r $tmpDir
