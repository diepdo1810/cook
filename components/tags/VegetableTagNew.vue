<script lang="ts" setup>
import { defineProps } from 'vue';

const props = defineProps<{
  item: { 
    emoji: string,
    name: string,
    badge: number | undefined,
    icon: string | null,
    type: string | null,
    active: boolean
 } 
}>()

const bgOptimize = (type: string | null) => {
    if (type === 'vegetable') {
        return props.item.active ? '' : 'green-300 opacity-20'
    }

    if (type === 'meat') {
        return props.item.active ? '' : 'red-300 opacity-20'
    }

    if (type === 'staple') {
        return props.item.active ? '' : 'yellow-300 opacity-20'
    }

    if (type === 'tools') {
        return props.item.active ? '' : 'blue-300 opacity-20'
    }

    return '';
}

const mapDishTag = (text: string) => {
    const mappings: { [key: string]: string } = {
        '鱼（Todo）': '鱼',
    };
    return mappings[text] || '';
};

const speciaLabel = (text: string | null) => {
    if (text) {
        const mappedTag = mapDishTag(text);
        if (mappedTag) {
            return mappedTag;
        }

        return text;
    }
    return null;
};
</script>

<template>
    <a v-ripple class="flex items-center px-4 py-2 cursor-pointer group" :bg="bgOptimize(props.item.type)" @click="$emit('toggleStuff')">
        <span :class="[props.item.emoji, 'text-primary group-hover:text-inherit']"> {{ props.item.emoji }} </span>
        <span :class="['ml-2']" v-tooltip.top="$t('cook') + ' ' + props.item.name">{{ $t(props.item.type + '.' + speciaLabel(props.item.name)) }}</span>
        <Badge v-if="props.item.badge" class="ml-auto" :value="props.item.badge" />
    </a>
</template>
