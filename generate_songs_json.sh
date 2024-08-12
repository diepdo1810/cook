#!/bin/bash

# Tạo nội dung JSON
cat <<EOL > public/song_data.json
[
    {
        "name": "Ngày Đẹp Tươi",
        "artist": "Lê Minh",
        "cover": "https://p2.music.126.net/iYX91ckIGncvhAJxNSXbUA==/109951167946704074.jpg",
        "lrc": "lrc1.lrc",
        "theme": "#ebd0c2",
        "url": "http://m801.music.126.net/20240812182422/677ecf142d4bdff3e317754ea0776041/jdymusic/obj/wo3DlMOGwrbDjj7DisKw/20124842635/8167/77ed/8df5/de72643278bf4d8a8719fba96ddf8604.mp3"
    },
    {
        "name": "Chào Buổi Sáng",
        "artist": "MTV band",
        "cover": "https://p2.music.126.net/JiEboopZXEudbMV72C6LCg==/109951167840168156.jpg",
        "lrc": "lrc1.lrc",
        "theme": "#ebd0c2",
        "url": "http://m701.music.126.net/20240812182421/7dd16ffc4090d09a4a8f97c0772e5b50/jdymusic/obj/wo3DlMOGwrbDjj7DisKw/18356308211/c55f/9932/5376/9ec05ba5654a600d27b6de39c07738ae.mp3"
    },
    {
        "name": "Những Điều Nhỏ Nhoi",
        "artist": "Tỏa Sáng Sao Đôi",
        "cover": "https://p2.music.126.net/Kis2zsvLRZF-zk_88TZ9Cw==/109951169486204494.jpg",
        "lrc": "lrc1.lrc",
        "theme": "#ebd0c2",
        "url": "http://m801.music.126.net/20240812182423/1baef5c6dd3f6c03610bd911735dd306/jdymusic/obj/wo3DlMOGwrbDjj7DisKw/35133292620/1661/6988/5be4/3893a75011806c0ef6bd097366d25119.mp3"
    },
    {
        "name": "Mỗi Ngày Tôi Chọn Một Niềm Vui",
        "artist": "Bùi Lan Hương",
        "cover": "https://p2.music.126.net/hWzJ2wsDfngFXP4xY_7pNg==/109951167548074916.jpg",
        "lrc": "lrc1.lrc",
        "theme": "#ebd0c2",
        "url": "http://m801.music.126.net/20240812182421/50dc61fba945e39645565bace9f1fed0/jdymusic/obj/wo3DlMOGwrbDjj7DisKw/20000540504/820b/c2b9/f90b/31577f5904d937560f8b462d8900eb4a.mp3"
    },
    {
        "name": "Bài Ka Tuổi Trẻ (feat. Vũ Bùi Thu Thủy, Linh Cáo & Mel G)",
        "artist": "JGKiD",
        "cover": "https://p2.music.126.net/HpPqobX1-kkoum1PldkGsQ==/109951165062724906.jpg",
        "lrc": "lrc1.lrc",
        "theme": "#ebd0c2",
        "url": "http://m7.music.126.net/20240812182422/f23db4a1e635ab66cd831c80cd21e002/ymusic/obj/w5zDlMODwrDDiGjCn8Ky/2875386514/182a/c96e/18e5/c1ad9c717ab511f8020cac870383c78f.mp3"
    },
    {
        "name": "Một Ngày Mới",
        "artist": "Văn Mai Hương",
        "cover": "https://p2.music.126.net/4i8Is8LkLQh6lwU7tzF4oA==/109951167365155162.jpg",
        "lrc": "lrc1.lrc",
        "theme": "#ebd0c2",
        "url": "http://m801.music.126.net/20240812182422/2dca9e2de7cef01d0fecc647bf2d43aa/jdymusic/obj/wo3DlMOGwrbDjj7DisKw/14224178522/e564/734d/d9a0/c83ab04847e6a4d9eca48e51117fda5d.mp3"
    },
    {
        "name": "Tôi Thích",
        "artist": "Tóc Tiên",
        "cover": "https://p2.music.126.net/LC32A_EbVuhNvCvDR1d3mw==/109951164485188413.jpg",
        "lrc": "lrc1.lrc",
        "theme": "#ebd0c2",
        "url": "http://m7.music.126.net/20240812182422/97bbb5d04bd4a0e442d3c1fb18216175/ymusic/5553/040f/010e/b901527e713ef3219fdb6dd3e0a44b56.mp3"
    },
    {
        "name": "Yêu đời",
        "artist": "Nhóm MTV",
        "cover": "https://p2.music.126.net/GbKIcaLhMzKwKcB9WIqIOQ==/109951165317153951.jpg",
        "lrc": "lrc1.lrc",
        "theme": "#ebd0c2",
        "url": "http://m8.music.126.net/20240812182418/e02b1048494c74c09eab3f275bbef6bd/ymusic/obj/w5zDlMODwrDDiGjCn8Ky/4009816504/57df/b593/be78/b854608e598cae3b641da68a29aeb2c0.mp3"
    }
]
EOL

chmod +x public/song_data.json
