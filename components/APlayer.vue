<template>
    <div ref="aplayer" id="aplayer" />
</template>
  
<script setup>
import { onMounted, ref } from 'vue';
import { useNuxtApp } from '#app';
/**
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
            // const url = await fetchSongDetails(song.id);
            const localUrl = `/mp3/perfect_day_${song.id}.mp3`;
            return {
                name: song.name,
                artist: song.artist,
                url: localUrl,
                cover: song.cover,
                lrc: 'lrc1.lrc',
                theme: song.theme
            };
        }));

        return audioList;
    }

    async function saveAudioListToLocalStorage() {
        const audioList = await createAudioList();
        localStorage.setItem('audio', JSON.stringify(audioList));
    }

    if (!localStorage.getItem('audio')) {
        saveAudioListToLocalStorage();
    }
*/

const lists = ref([]);

const Audio = function(response, songList) {
    this.response = response;
    this.songList = songList;
}

Audio.prototype.fetch = async function() {
    this.response = await fetch(this.response);
    return this.response;
}

Audio.prototype.getList = async function() {
    const response = await this.fetch();
    this.songList = await response.json();

    return this.songList;
}

const songList = new Audio('/songs.json');

// show all url mp3 and loading

async function createAudioList() {
    const lists = await songList.getList();
    const audioList = lists.map(song => ({
        name: song.name,
        artist: song.artist,
        url: song.url,
        cover: song.cover,
        theme: song.theme
    }));

    return audioList;
}

if (!localStorage.getItem('audio')) {
    createAudioList().then(audioList => {
        localStorage.setItem('audio', JSON.stringify(audioList));
    });
}


onMounted(async () => {
    const id = document.getElementById('aplayer');
    const { $aplayer } = useNuxtApp();
    const audioList = JSON.parse(localStorage.getItem('audio'));

    if (!audioList) {
        return;
    }

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
  