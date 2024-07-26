<script lang="ts" setup>
import { ref, watch } from 'vue';
import { useI18n } from 'vue-i18n';
import SelectButton from 'primevue/selectbutton';

const { locale } = useI18n();
const selectedLanguage = ref(locale.value);

const langs = ref([
  { name: 'English', value: 'en' },
  { name: 'Vietnamese', value: 'vi' },
]);

watch(selectedLanguage, (newLocale: any) => {
  locale.value = newLocale.value;
});
</script>

<template>
    <div class="card flex justify-center">
        <SelectButton v-model="selectedLanguage" :options="langs" optionLabel="name" aria-labelledby="basic" />
    </div>
</template>
