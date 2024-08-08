<script lang="ts" setup>
import { ref, watch } from 'vue';
import { useI18n } from 'vue-i18n';

const { locale } = useI18n();
const selectedLanguage = ref(locale.value);

const langs = ref([
  { name: 'English', value: 'en' },
  { name: 'Vietnamese', value: 'vi' },
]);

watch(selectedLanguage, (newLocale: any) => {
  locale.value = newLocale;
});
</script>

<template>
    <div class="card flex justify-center">
        <select v-model="selectedLanguage" aria-labelledby="basic">
            <option v-for="lang in langs" :key="lang.value" :value="lang.value">{{ $t(lang.value) }}</option>
        </select>
    </div>
</template>

<style scoped>
select {
    background: none;
    outline: none;
    box-shadow: none;
    -webkit-appearance: none;
    -moz-appearance: none;
    text-indent: 1px;
    text-overflow: '';
}
</style>