<script lang="ts" setup>
import { storeToRefs } from 'pinia'

const rStore = useRecipeStore()

const { selectedStuff, curTool } = storeToRefs(rStore)

const showSearchInput = ref(false)

const showTooltip = computed(() => !selectedStuff.value.length && !curTool.value)
</script>

<template>
  <div class="recipe-panel relative shadow transition hover:shadow-md" m="x-2 y-4" p="2" bg="gray-400/8">
    <RecipePanelTitle />
    <ToggleMode />
    <button absolute right-4 top-4 @click="showSearchInput = !showSearchInput">
      <div v-if="!showSearchInput" i-ri-search-line />
      <div v-else i-ri-search-fill />
    </button>
    <div class="cook-recipes" p="2">
      <SearchFoodInput v-if="showSearchInput" />
      <Transition mode="out-in">
        <span v-if="showTooltip" text="sm" p="2">{{ $t('你要先选食材或工具哦') }}～</span>
        <div v-else-if="rStore.isSearching" relative flex items-center justify-center p-6 text-xl>
          <div class="magnifying-glass" i-ri-search-line inline-flex />
        </div>
        <div v-else-if="rStore.paginatedRecipes.length">
          <DishTag v-for="item, i in rStore.paginatedRecipes" :key="i" :dish="item" />
        </div>
        <div v-else text="sm">
          <span>{{ $t('还没有完美匹配的菜谱呢') }}……</span>
          <br>
          <span>{{ $t('大胆尝试一下') }}，{{ $t('或者') }}</span>
          <a href="#" @click="rStore.reset()">
            <strong>{{ $t('换个组合') }}</strong>
          </a>
          <span>？</span>
          <br>
          <div m="t-1">
            <span>{{ $t('欢迎来') }}</span>
            <a class="text-blue-600 font-bold dark:text-blue-400" href="https://docs.qq.com/sheet/DQk1vdkhFV0twQVNS?tab=uykkic" target="_blank">{{ $t('这里') }}</a>
            <span>{{ $t('反馈新的菜谱') }}！</span>
          </div>
        </div>
      </Transition>
      <Paginator
        :rows="rStore.itemsPerPage"
        :totalRecords="rStore.displayedRecipe.length"
        :page="rStore.currentPage - 1" 
        @page="(e) => rStore.setPage(e.page + 1)"
        />
    </div>
  </div>
</template>


<style>
@keyframes circle-rotate {
  from {
    transform: rotate(0turn) translateY(60%) rotate(1turn);
  }
  to {
    transform: rotate(1turn) translateY(60%) rotate(0turn);
  }
}

.magnifying-glass {
  margin: auto;
  animation: circle-rotate 4s linear infinite;
}

.p-paginator {
  background: none !important;
}
</style>
