for dest in $(find /media/LYRASIS_Mule_4/Virginia_Beach_Work/000Dir -mindepth 1 -type d)
do
cp ./Virginia_beach_Sun_marc.xml $dest/marc.xml
done
