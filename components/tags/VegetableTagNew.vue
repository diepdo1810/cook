<script lang="ts" setup>
import { defineProps } from 'vue';

const props = defineProps<{
  active: boolean,
  item: { 
    emoji: string,
    name: string,
    badge: number | undefined,
    icon: string | null,
    type: string | null,
    active: boolean | false,
 } 
}>()
console.log(props.item)
const bgOptimize = (type: string | null) => {
    if (type === 'vegetable') {
        return props.item.active ? 'green-600 opacity-90' : 'green-300 opacity-20'
    }

    if (type === 'meat') {
        return props.item.active ? 'red-600 opacity-90' : 'red-300 opacity-20'
    }

    if (type === 'staple') {
        return props.item.active ? 'yellow-600 opacity-90' : 'yellow-300 opacity-20'
    }

    if (type === 'tools') {
        return props.item.active ? 'blue-600 opacity-90' : 'blue-300 opacity-20'
    }
}
</script>

<template>
    <a v-ripple class="flex items-center px-4 py-2 cursor-pointer group" :bg="bgOptimize(props.item.type)">
        <span :class="[props.item.emoji, 'text-primary group-hover:text-inherit']"> {{ props.item.emoji }} </span>
        <span :class="['ml-2']" v-tooltip.top="$t('cook') + ' ' + props.item.name">{{ props.item.name }}</span>
        <Badge v-if="props.item.badge" class="ml-auto" :value="props.item.badge" />
    </a>
</template>
