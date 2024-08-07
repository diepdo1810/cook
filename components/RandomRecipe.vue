<script lang="ts" setup>
const { count, inc, dec } = useCount()
const { random, randomRecipes } = useRandomRecipe(count)
</script>

<template>
  <div inline-flex m="y-3">
    <Button type="button" icon="pi pi-minus" @click="dec()" />
    <div font="mono" w="15" m-auto inline-block>
      {{ count }}
    </div>
    <Button type="button" icon="pi pi-plus" @click="inc()" />
  </div>
  <Button icon="pi pi-spin pi-cog" :label="$t('随机一下')" @click="random" />

  <div v-show="randomRecipes.length > 0">
    <div m="t-8" flex="~ col">
      <template v-for="recipe, i in randomRecipes" :key="i">
        <DishTag v-if="recipe" :dish="recipe" />
      </template>
    </div>
  </div>

  <ScrollTop />
</template>
