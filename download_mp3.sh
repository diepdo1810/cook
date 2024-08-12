#!/bin/bash

declare -A songs=(
    ["1479174227"]="http://m801.music.126.net/20240812152512/d282675baccccc843f971aab39f41577/jdymusic/obj/wo3DlMOGwrbDjj7DisKw/20124842635/8167/77ed/8df5/de72643278bf4d8a8719fba96ddf8604.mp3"
    ["1977983298"]="http://m701.music.126.net/20240812152355/3dee97720e6dc23a679f02c0b4f70bfc/jdymusic/obj/wo3DlMOGwrbDjj7DisKw/18356308211/c55f/9932/5376/9ec05ba5654a600d27b6de39c07738ae.mp3"
    ["2144492937"]="http://m801.music.126.net/20240812152355/53b91f8951789ff110a166a32bf6e56c/jdymusic/obj/wo3DlMOGwrbDjj7DisKw/35133292620/1661/6988/5be4/3893a75011806c0ef6bd097366d25119.mp3"
    ["1955720485"]="http://m701.music.126.net/20240812152359/f6b6cd6c448225a7241ad96ca6f1f868/jdymusic/obj/wo3DlMOGwrbDjj7DisKw/20000540504/820b/c2b9/f90b/31577f5904d937560f8b462d8900eb4a.mp3"
    ["1455452759"]="http://m8.music.126.net/20240812152400/8758e8163e16241a6d3e6521bd9ea4c7/ymusic/obj/w5zDlMODwrDDiGjCn8Ky/2875386514/182a/c96e/18e5/c1ad9c717ab511f8020cac870383c78f.mp3"
    ["1943498394"]="http://m701.music.126.net/20240812152355/068dcd7abace0d47d8070368536edcdf/jdymusic/obj/wo3DlMOGwrbDjj7DisKw/14224178522/e564/734d/d9a0/c83ab04847e6a4d9eca48e51117fda5d.mp3"
    ["1403213631"]="http://m7.music.126.net/20240812152355/f361938389ef8efede2dc944e7030be1/ymusic/5553/040f/010e/b901527e713ef3219fdb6dd3e0a44b56.mp3"
    ["1479174227"]="http://m8.music.126.net/20240812152355/335fb71c7d6fa5e7b697d0a704a9b5e4/ymusic/obj/w5zDlMODwrDDiGjCn8Ky/4009816504/57df/b593/be78/b854608e598cae3b641da68a29aeb2c0.mp3"
)

mkdir -p mp3

for id in "${!songs[@]}"; do
    url="${songs[$id]}"
    filename="mp3/perfect_day_${id}.mp3"
    echo "Downloading ${filename}..."
    curl -o "$filename" "$url"
done

mv mp3/* public/mp3/

echo "All songs downloaded successfully."
