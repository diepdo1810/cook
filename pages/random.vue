<script setup lang="ts">
  const router = useIonRouter();
  const nextHelp = () => {
    router.push('/help');
  }
  const handleRefresh = (event: CustomEvent) => {
    setTimeout(() => {
      if (event.target) {
        (event.target as HTMLIonRefresherElement).complete();
      }
    }, 2000);
  }
</script>
<template>
  <ion-page>
    <ion-header>
      <ion-toolbar>
        <ion-title>Random</ion-title>
      </ion-toolbar>
    </ion-header>

    <ion-content>
      <ion-refresher slot="fixed" :pull-factor="0.5" :pull-min="100" :pull-max="200" @ionRefresh="handleRefresh($event)">
        <ion-refresher-content></ion-refresher-content>
      </ion-refresher>
      <div flex flex-col>
        <CommonHeader>
          {{ $t('今天吃什么') }}
        </CommonHeader>
        <div flex flex-grow flex-col items-center justify-center>
          <BackBtn ml-3 />
          <RandomRecipe />
          <YlfIconButton
            icon="i-ri-arrow-right-s-line"
            @click="nextHelp"
          />
        </div>
      </div>
    </ion-content>
  </ion-page>
</template>
