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
        <div flex>
          <BackBtn ml-3 />
          <CommonHeader flex items-center justify-center ml-5>
            {{ $t('今天吃什么') }}
          </CommonHeader>
        </div>
        <div flex flex-grow flex-col items-center justify-center>
          <RandomRecipe />
        </div>
      </div>
      <div flex justify-center>
          <CommonHeader flex items-center justify-center ml-5>
              {{ $t('帮助') }}
          </CommonHeader>
          <YlfIconButton
            icon="i-ri-arrow-right-s-line"
            @click="nextHelp" />
       </div>
    </ion-content>
  </ion-page>
</template>
