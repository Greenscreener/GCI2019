printf "Pls input the message you want to \"encrypt\": "
read message
printf "\"Encrypting\"...\n"
tmpDir=/tmp/stegosaurus-$RANDOM 
mkdir $tmpDir
cp img1.png $tmpDir
cp img2.jpg $tmpDir
cp img3.png $tmpDir
cd $tmpDir
echo $message > this-is-a-very-very-secret-message-btw
tar -cf stage1.tar this-is-a-very-very-secret-message-btw
cat stage1.tar | xxd -p -c1 | tac | xxd -p -r > stage2.rat
cat img1.png <(printf "\ngrnscrnr") stage2.rat > this-is-an-image.png
tar -cf this-is-fun-1000.tar this-is-an-image.png
for i in {999..0}
do
    tar -cf this-is-fun-$i.tar this-is-fun-$(($i + 1)).tar
    rm this-is-fun-$(($i + 1)).tar
done
cat img2.jpg <(printf "\ngrnscrnr") this-is-fun-0.tar > this-is-a-nice-picture-isnt-it.jpg
tar -czf stage4.tar.gz this-is-a-nice-picture-isnt-it.jpg
cat stage4.tar.gz | xxd -p -c1 | tac | xxd -p -r > stage5.rat.zg
cat img3.png <(printf "\ngrnscrnr") stage5.rat.zg > this-is-such-a-lovely-picture.png
cd - > /dev/null
cp $tmpDir/this-is-such-a-lovely-picture.png .
printf "$(pwd)/this-is-such-a-lovely-picture.png written. Done.\n"
rm -r $tmpDir
