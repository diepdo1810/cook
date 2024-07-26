<template>
    <div class="card flex justify-center">
        <PanelMenu :model="items" class="w-full md:w-80">
            <template #item="{ item }">
               <VegetableTagNew :item="item" />
            </template>
        </PanelMenu>
    </div>
</template>

<script setup>
import { meat, staple, tools, vegetable } from '~/data/food'
const { t: $t } = useI18n()
const rStore = useRecipeStore()
const curStuff = computed(() => rStore.selectedStuff)

console.log('curStuff', curStuff)
const mapDishTag = (text) => {
    const mappings = {
        '鱼（Todo）': '鱼',
    };
    return mappings[text] || '';
};

const speciaLabel = (text) => {
    if (text) {
        const mappedTag = mapDishTag(text);
        if (mappedTag) {
            return mappedTag;
        }

        return text;
    }
    return null;
};

const vegetableItems = vegetable.map(item => {
    return {
        ...item,
        name: $t(`vegetable.${speciaLabel(item.name)}`),
        emoji: item.emoji,
        active: curStuff.value.includes(item.name)
    }
})

const meatItems = meat.map(item => {
    return {
        ...item,
        name: $t(`meat.${speciaLabel(item.name)}`),
        emoji: item.emoji,
        active: curStuff.value.includes(item.name)
    }
})

const stapleItems = staple.map(item => {
    return {
        ...item,
        name: $t(`staple.${speciaLabel(item.name)}`),
        emoji: item.emoji,
        active: curStuff.value.includes(item.name)
    }
})

const toolsItems = tools.map(item => {
    return {
        ...item,
        name: $t(`tools.${speciaLabel(item.name)}`),
        emoji: item.icon,
        active: curStuff.value.includes(item.name)
    }
})

const items = ref([
    {
        name: $t('菜菜们'),
        emoji: "🥬",
        badge: vegetable.length,
        items: vegetableItems,
        type: 'vegetable',
    },
    {
        name: $t('肉肉们'),
        emoji: "🥩",
        badge: meat.length,
        items: meatItems,
        type: 'meat'
    },
    {
        name: $t('shorcutChoose'),
        emoji: "🍚",
        badge: staple.length,
        items: stapleItems,
        type: 'staple'
    },
    {
        name: $t('tools'),
        emoji: "🔪",
        badge: tools.length,
        items: toolsItems,
        type: 'tools'
    }
]);
</script>