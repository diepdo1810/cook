<script setup lang="ts">
  const router = useIonRouter();
  const nextHelp = () => {
    router.push('/help');
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
