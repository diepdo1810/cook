#!/bin/bash

declare -A songs=(
    [1987660367]="http://m801.music.126.net/20240813123534/4c08d6dde69bb7a03394d38a594bc45a/jdymusic/obj/wo3DlMOGwrbDjj7DisKw/20124842635/8167/77ed/8df5/de72643278bf4d8a8719fba96ddf8604.mp3?rid=ztXjOotSGDILa%2B5R8zHklA%3D%3D&uuid=rrPrt3PrmttphrCt0ddkhg%3D%3D"
    [1977983298]="http://m801.music.126.net/20240813123535/6f8e3af9e792714d461f8e07b9dfd5ef/jdymusic/obj/wo3DlMOGwrbDjj7DisKw/18356308211/c55f/9932/5376/9ec05ba5654a600d27b6de39c07738ae.mp3?rid=ztXjOotSGDILa%2B5R8zHklA%3D%3D&uuid=KDMZb9ORN4lJMkw%2BcBC53A%3D%3D"
    [2144492937]="http://m701.music.126.net/20240813123535/7dd24af0ea9a2542be814970b40b33e7/jdymusic/obj/wo3DlMOGwrbDjj7DisKw/35133292620/1661/6988/5be4/3893a75011806c0ef6bd097366d25119.mp3?rid=ztXjOotSGDILa%2B5R8zHklA%3D%3D&uuid=%2BZvrjsnt%2FveRyqJWXigf2g%3D%3D"
    [1955720485]="http://m701.music.126.net/20240813123535/a6bd18ef3b3489019ff4e6ab52df9e4b/jdymusic/obj/wo3DlMOGwrbDjj7DisKw/20000540504/820b/c2b9/f90b/31577f5904d937560f8b462d8900eb4a.mp3?rid=ztXjOotSGDILa%2B5R8zHklA%3D%3D&uuid=SfSiGtxs6bZ6aKrqydbtqQ%3D%3D"
    [1455452759]="http://m8.music.126.net/20240813123534/2ed263df54ae4e25b2495f2e9a2bc3f1/ymusic/obj/w5zDlMODwrDDiGjCn8Ky/2875386514/182a/c96e/18e5/c1ad9c717ab511f8020cac870383c78f.mp3?rid=ztXjOotSGDILa%2B5R8zHklA%3D%3D&uuid=U%2Bloy8LhFPbc5s9775T7hQ%3D%3D"
    [1943498394]="http://m801.music.126.net/20240813123534/7bca242856781d88223b41875ead5a79/jdymusic/obj/wo3DlMOGwrbDjj7DisKw/14224178522/e564/734d/d9a0/c83ab04847e6a4d9eca48e51117fda5d.mp3?rid=ztXjOotSGDILa%2B5R8zHklA%3D%3D&uuid=wQZ1AcT78YhsnkNXB8kT4w%3D%3D"
    [1403213631]="http://m8.music.126.net/20240813123535/6294aec5d711676923c9867a043de691/ymusic/5553/040f/010e/b901527e713ef3219fdb6dd3e0a44b56.mp3?rid=ztXjOotSGDILa%2B5R8zHklA%3D%3D&uuid=9sFNsWIJhzZx%2BLOWpRctmw%3D%3D"
    [1479174227]="http://m8.music.126.net/20240813123535/a91de283a35ec6bb41b82886e924d601/ymusic/obj/w5zDlMODwrDDiGjCn8Ky/4009816504/57df/b593/be78/b854608e598cae3b641da68a29aeb2c0.mp3?rid=ztXjOotSGDILa%2B5R8zHklA%3D%3D&uuid=K827%2FIzNCP7tyMJ4tIN%2BEA%3D%3D"
)

mkdir -p mp3

for id in "${!songs[@]}"; do
    url="${songs[$id]}"
    filename="mp3/perfect_day_${id}.mp3"
    echo "Downloading ${filename}..."
    curl -o "$filename" "$url"
done

cp mp3/* public/

echo "All songs downloaded successfully."
