#!/bin/bash

# Tạo nội dung JSON
cat <<EOL > public/song_data.json
[
  {
    "id": 1987660367,
    "name": "Ngày Đẹp Tươi",
    "artist": "Lê Minh",
    "url": "/mp3/perfect_day_1987660367.mp3",
    "cover": "https://p1.music.126.net/iYX91ckIGncvhAJxNSXbUA==/109951167946704074.jpg",
    "lrc": "lrc1.lrc",
    "theme": "#ebd0c2"
  },
  {
    "id": 1977983298,
    "name": "Chào Buổi Sáng",
    "artist": "MTV band",
    "url": "/mp3/perfect_day_1977983298.mp3",
    "cover": "https://p1.music.126.net/JiEboopZXEudbMV72C6LCg==/109951167840168156.jpg",
    "lrc": "lrc1.lrc",
    "theme": "#ebd0c2"
  },
  {
    "id": 2144492937,
    "name": "Những Điều Nhỏ Nhoi",
    "artist": "Tỏa Sáng Sao Đôi",
    "url": "/mp3/perfect_day_2144492937.mp3",
    "cover": "https://p1.music.126.net/Kis2zsvLRZF-zk_88TZ9Cw==/109951169486204494.jpg",
    "lrc": "lrc1.lrc",
    "theme": "#ebd0c2"
  },
  {
    "id": 1955720485,
    "name": "Mỗi Ngày Tôi Chọn Một Niềm Vui",
    "artist": "Bùi Lan Hương",
    "url": "/mp3/perfect_day_1955720485.mp3",
    "cover": "https://p1.music.126.net/hWzJ2wsDfngFXP4xY_7pNg==/109951167548074916.jpg",
    "lrc": "lrc1.lrc",
    "theme": "#ebd0c2"
  },
  {
    "id": 1455452759,
    "name": "Bài Ka Tuổi Trẻ (feat. Vũ Bùi Thu Thủy, Linh Cáo & Mel G)",
    "artist": "JGKiD",
    "url": "/mp3/perfect_day_1455452759.mp3",
    "cover": "https://p1.music.126.net/HpPqobX1-kkoum1PldkGsQ==/109951165062724906.jpg",
    "lrc": "lrc1.lrc",
    "theme": "#ebd0c2"
  },
  {
    "id": 1943498394,
    "name": "Một Ngày Mới",
    "artist": "Văn Mai Hương",
    "url": "/mp3/perfect_day_1943498394.mp3",
    "cover": "https://p1.music.126.net/4i8Is8LkLQh6lwU7tzF4oA==/109951167365155162.jpg",
    "lrc": "lrc1.lrc",
    "theme": "#ebd0c2"
  },
  {
    "id": 1403213631,
    "name": "Tôi Thích",
    "artist": "Tóc Tiên",
    "url": "/mp3/perfect_day_1403213631.mp3",
    "cover": "https://p1.music.126.net/LC32A_EbVuhNvCvDR1d3mw==/109951164485188413.jpg",
    "lrc": "lrc1.lrc",
    "theme": "#ebd0c2"
  },
  {
    "id": 1479174227,
    "name": "Yêu đời",
    "artist": "Nhóm MTV",
    "url": "/mp3/perfect_day_1479174227.mp3",
    "cover": "https://p1.music.126.net/GbKIcaLhMzKwKcB9WIqIOQ==/109951165317153951.jpg",
    "lrc": "lrc1.lrc",
    "theme": "#ebd0c2"
  }
]
EOL

chmod +x public/song_data.json
