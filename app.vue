<script setup lang="ts">
import { installPrompt } from './utils/pwa'
import { appName } from '~/constants'
import { useIndexedDB } from '~/composables/db'
import { loadingController } from '@ionic/vue';

// https://nuxt.com/docs/api/composables/use-head
useHead({
  title: appName,
  meta: [
    {
      name: 'description',
      content: '好的，今天我们来做菜！',
    },
  ],
})

const indexedDB = useIndexedDB()

onMounted(() => {
  installPrompt()
  showLoading()
  indexedDB.init()
})

const showLoading = async () => {
  const loading = await loadingController.create({
    message: 'Loading...',
    duration: 3000,
    cssClass: 'custom-loading'
  });
  await loading.present();
}
</script>

<template>
  <VitePwaManifest />
  <ion-app>
    <ion-router-outlet />
  </ion-app>
</template>
