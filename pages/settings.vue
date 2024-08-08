<script lang="ts" setup>
import { ref } from "vue";
const app = useAppStore()

definePageMeta({
  layout: 'child',
})
const selectedCountry = ref();
const countries = ref([
    { name: 'Australia', code: 'AU' },
    { name: 'Brazil', code: 'BR' },
    { name: 'China', code: 'CN' },
    { name: 'Egypt', code: 'EG' },
    { name: 'France', code: 'FR' },
    { name: 'Germany', code: 'DE' },
    { name: 'India', code: 'IN' },
    { name: 'Japan', code: 'JP' },
    { name: 'Spain', code: 'ES' },
    { name: 'United States', code: 'US' }
]);
</script>

<template>
  <div>
    <CommonHeader>
      {{ $t('设置') }}
    </CommonHeader>

    <div
      class="mx-auto max-w-md w-full"
      px-2
      text-left
    >
      <YlfForm>
        <YlfFormItem :label="$t('离开网页后保留选中数据')">
          <YlfSwitch v-model="app.settings.keepLocalData" />
        </YlfFormItem>
        <YlfFormItem :label="$t('langs')">
          <LanguageSwitcher />
        </YlfFormItem>
        <YlfFormItem :label="$t('更多设置')" />
      </YlfForm>
    </div>
  </div>
</template>
