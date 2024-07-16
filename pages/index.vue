<script lang="ts" setup>
import Default from '~/layouts/default.vue';
definePageMeta({
  alias: ['/'],
});
const rStore = useRecipeStore();
const router = useIonRouter();
const nextRandom = () => {
  router.push('/random');
}
</script>

<template>
  <ion-page>
    <ion-header>
      <ion-toolbar>
        <ion-title>Home</ion-title>
      </ion-toolbar>
    </ion-header>

    <ion-content class="ion-padding">
      <Default>
        <div text-4xl mt-10>
          <button
            class="cursor-pointer transition active:text-green-800 hover:(text-green-600)"
            :title="$t('重置')"
            @click="rStore.reset"
          >
            <div v-if="rStore.selectedStuff.length" i-mdi-pot-steam-outline />
            <div v-else i-mdi-pot-mix-outline />
          </button>
        </div>
        <p text="sm" m="b-4">
          {{ $t('cookToday') }}
        </p>

        <ChooseFood />
        <YlfIconButton
          icon="i-ri-arrow-right-s-line"
          @click="nextRandom"
        />
     </Default>
    </ion-content>
  </ion-page>
</template>
