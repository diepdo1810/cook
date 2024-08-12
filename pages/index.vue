<script lang="ts" setup>
const rStore = useRecipeStore()
</script>

<template>
  <div text-4xl>
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
  <!-- <ChooseFoodNew /> -->

</template>
