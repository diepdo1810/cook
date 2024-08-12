import 'aplayer/dist/APlayer.min.css';
import APlayer from 'aplayer';

export default defineNuxtPlugin((nuxtApp) => {
  nuxtApp.provide('aplayer', APlayer);
});
