<script setup lang="ts">
import { Dialog, DialogPanel, DialogTitle, TransitionChild, TransitionRoot } from '@headlessui/vue'
import { loading, handleLoading } from '~/composables/loading';

import { db } from '~/utils/db'

const isOpen = ref(false)

function closeModal() {
  isOpen.value = false
}

const startLoading = async () => {
  await handleLoading();
}

async function openModal() {
  await handleLoading()
  isOpen.value = true
}
const { t: $t } = useI18n()
const keyword = ref('')
async function getFilterRecipes(keyword: string) {
  return db.recipes.filter((recipe) => {
    const name = $t(`dishTag.${recipe.name}`)
    return name.includes(keyword)
  }).toArray()
}
const filteredRecipes = computedAsync(async () => {
  startLoading()
  return await getFilterRecipes(keyword.value)
})
</script>

<template>
  <YlfIconButton
    absolute right-3 top-5
    class="icon-btn hover:text-yellow-400 !outline-none"
    text-xl
    title="切换" @click="openModal"
  >
    <div i="ri-search-line" />
  </YlfIconButton>

  <TransitionRoot appear :show="isOpen" as="template">
    <Dialog as="div" class="relative z-10" @close="closeModal">
      <TransitionChild
        as="template"
        enter="duration-300 ease-out"
        enter-from="opacity-0"
        enter-to="opacity-100"
        leave="duration-200 ease-in"
        leave-from="opacity-100"
        leave-to="opacity-0"
      >
        <div class="fixed inset-0 bg-black/10" />
      </TransitionChild>

      <div class="fixed inset-0 overflow-y-auto">
        <div
          class="h-full flex justify-center text-center"
        >
          <TransitionChild
            as="template"
            enter="duration-300 ease-out"
            enter-from="opacity-0 scale-95"
            enter-to="opacity-100 scale-100"
            leave="duration-200 ease-in"
            leave-from="opacity-100 scale-100"
            leave-to="opacity-0 scale-95"
          >
            <DialogPanel
              class="h-full max-w-xl w-full transform overflow-hidden bg-white p-4 text-left align-middle shadow-xl transition-all dark:bg-dark-600"
              md="rounded-2xl"
              overflow="auto"
              flex="~ col"
            >
              <DialogTitle
                as="h3"
                class="flex items-center justify-center text-lg font-medium leading-6"
              >
                <div relative inline-flex flex="grow">
                  <div
                    i-ri-search-line
                    class="absolute left-3 top-2 cursor-pointer text-gray-400"
                  />
                  <input
                    v-model="keyword"
                    type="text"
                    class="w-full rounded-full bg-transparent text-sm focus:outline-none focus:ring-1 focus:ring-blue-500 placeholder-gray-400"
                    border="~ rounded-full gray-300 op-50 focus:border-blue-500"
                    :placeholder="$t('搜索菜谱')"
                    autofocus py-2 pl-10 pr-3
                  >
                  <div
                    v-if="keyword" i-ri-close-line
                    class="absolute right-3 top-2 cursor-pointer text-gray-400"
                    @click="keyword = ''"
                  />
                </div>
                <div op="70" ml-2 inline-flex cursor-pointer text-base @click="closeModal">
                  {{ $t('取消') }}
                </div>
              </DialogTitle>
              <div flex="~ col grow" overflow="auto" class="mt-2" text-xs>
                <DishTag v-for="item, i in filteredRecipes" :key="i" :dish="item" />
              </div>
            </DialogPanel>
          </TransitionChild>
        </div>
      </div>
    </Dialog>
  </TransitionRoot>



  <div class="card flex justify-center spinner-overlay" v-if="loading">
        <ProgressSpinner style="width: 50px; height: 50px" strokeWidth="8" fill="transparent"
            animationDuration=".5s" aria-label="loading recipe" />
  </div>
</template>

<style>
.spinner-overlay {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background: rgba(0, 0, 0, 0.5);
  display: flex;
  align-items: center;
  justify-content: center;
  z-index: 1000;
}
</style>
