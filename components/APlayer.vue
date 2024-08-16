<template>
    <div ref="aplayer" id="aplayer" />
</template>
  
<script setup>
import { onMounted } from 'vue';
import { useNuxtApp } from '#app';


async function fetchSongList() {
    const ids = '1987660367,1977983298,2144492937,1955720485,1455452759,1943498394,1403213631,1479174227'
    const response = await fetch(`https://chiaser-music.vercel.app/api/song/detail?ids=${ids}&realIP=211.161.244.70`);
    const data = await response.json();
    return data.songs.map(song => ({
        id: song.id,
        name: song.name,
        artist: song.ar[0].name,
        cover: song.al.picUrl,
        theme: '#ebd0c2'
    }));
}

async function fetchSongDetails(id) {
    const response = await fetch(`https://chiaser-music.vercel.app/api/song/url?id=${id}&br=320000&realIP=211.161.244.70`);
    const data = await response.json();
    return data.data[0].url;
}

async function createAudioList() {
    const songList = await fetchSongList();
    const audioList = await Promise.all(songList.map(async song => {
        const url = await fetchSongDetails(song.id);
        return {
            id: song.id,
            name: song.name,
            artist: song.artist,
            url: url,
            cover: song.cover,
            lrc: 'lrc1.lrc',
            theme: song.theme
        };
    }));

    return audioList;
}

onMounted(async () => {
    const id = document.getElementById('aplayer');
    const { $aplayer } = useNuxtApp();
    const audioList = await createAudioList();

    new $aplayer({
        container: id,
        fixed: true,
        listFolded: false,
        listMaxHeight: 90,
        lrcType: 3,
        audio: audioList
    })
});
  </script>
  