<template>
    <div ref="aplayer" id="aplayer" />
</template>
  
<script setup>
import { onMounted, ref } from 'vue';
import { useNuxtApp } from '#app';
  
async function fetchSongList() {
    const ids = '1987660367,1977983298,2144492937,1955720485,1455452759,1943498394,1403213631,1479174227'
    const response = await fetch(`https://chiaser-music.vercel.app/api/song/detail?ids=${ids}&realIP=211.161.244.70`);
    const data = await response.json();
    return data.songs.map(song => ({
        id: song.id,
        name: song.name,
        artist: song.ar[0].name,  // Assuming the artist is in the first element of the `ar` array
        cover: song.al.picUrl,
        theme: '#ebd0c2' // You can update this as needed
    }));
}

async function fetchSongDetails(id) {
    const response = await fetch(`https://chiaser-music.vercel.app/api/song/url?id=${id}&br=320000&realIP=211.161.244.70`);
    const data = await response.json();
    return data.data[0].url;  // Assuming the URL is in the first element of the `data` array
}

async function createAudioList() {
    const songList = await fetchSongList();
    const audioList = await Promise.all(songList.map(async song => {
        const url = await fetchSongDetails(song.id);
        return {
            name: song.name,
            artist: song.artist,
            url: url,
            cover: song.cover,
            lrc: 'lrc1.lrc', // Assuming you have the lyrics file or need to fetch it
            theme: song.theme
        };
    }));

    return audioList;
}

async function saveAudioListToLocalStorage() {
    const audioList = await createAudioList();
    localStorage.setItem('audio', JSON.stringify(audioList));
}

if (!localStorage.getItem('audio'))
saveAudioListToLocalStorage();

onMounted(() => {
    const id = document.getElementById('aplayer');
    const { $aplayer } = useNuxtApp();
    const audioList = JSON.parse(localStorage.getItem('audio'));

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
  