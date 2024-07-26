<template>
    <div class="card flex justify-center">
        <PanelMenu :model="items" class="w-full md:w-80">
            <template #item="{ item }">
               <VegetableTagNew :item="item" @toggleStuff="toggleStuff(item, item.type)" />
            </template>
        </PanelMenu>
    </div>
    <RecipePanel ref="recipePanelRef" />
</template>

<script setup lang="ts">
import { meat, staple, tools, vegetable } from '~/data/food'
import { storeToRefs } from 'pinia'
import type { StuffItem } from '~/types'

const rStore = useRecipeStore()
const curStuff = computed(() => rStore.selectedStuff)

const recipeBtnRef = ref<HTMLButtonElement>()

const gtm = useGtm()
const recipePanelRef = ref()

function toggleStuff(item: StuffItem, category = '', _e?: Event) {
    console.log('toggleStuff', item)
    console.log('category', category)
  rStore.toggleStuff(item.name)

  if (curStuff.value.includes(item.name))
  gtm?.trackEvent({
    event: 'click',
    category: `${category}_${item.name}`,
    action: 'click_stuff',
    label: '食材',
  })
  gtm?.trackEvent({
    event: 'click_stuff',
    action: item.name,
  })
}

const meatLabel = 'meat';
const stapleLabel = 'staple';
const toolsLabel = 'tools';
const vegetableLabel = 'vegetable';


const { t: $t } = useI18n()

const mapItem = (food: Array<any>, name: string) => {
    return food.map(item => {
        return {
            ...item,
            name: item.name,
            emoji: name === toolsLabel ? item.icon : item.emoji,
            type: name,
            active: true,
        }
     })
}

const vegetableItems = mapItem(vegetable, vegetableLabel)

const meatItems = mapItem(meat, meatLabel)

const stapleItems = mapItem(staple, stapleLabel)

const toolsItems = mapItem(tools, toolsLabel)

const items = ref([
    {
        name: $t('菜菜们'),
        emoji: "🥬",
        badge: vegetable.length,
        items: vegetableItems,
        type: vegetableLabel,
    },
    {
        name: $t('肉肉们'),
        emoji: "🥩",
        badge: meat.length,
        items: meatItems,
        type: meatLabel,
    },
    {
        name: $t('shorcutChoose'),
        emoji: "🍚",
        badge: staple.length,
        items: stapleItems,
        type: stapleLabel,
    },
    {
        name: $t('tools'),
        emoji: "🔪",
        badge: tools.length,
        items: toolsItems,
        type: toolsLabel,
    }
]);
</script>