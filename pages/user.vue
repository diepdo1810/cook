<script lang="ts" setup>
import { links } from '~/constants'
</script>

<template>
  <div>
    <CommonHeader>
      {{ $t('我的') }}
    </CommonHeader>

    <div
      class="mx-auto max-w-md w-full"
      px-2
      text-left
    >
      <div mt-2 gap="3" grid="~ cols-3">
        <YlfIconItem to="/recipes/history" icon="i-ri-history-line" :label="$t('历史记录')" />
        <YlfIconItem to="/recipes/collect" icon="i-ri-star-line" :label="$t('我的收藏')" />
        <YlfIconItem to="/cookbooks" icon="i-ri-article-line" :label="$t('自定义菜谱')" />
      </div>

      <YlfForm>
        <YlfFormItem icon="i-ri-feedback-line" :label="$t('立即反馈')" :to="links.feedback" target="_blank" />
        <YlfFormItem icon="i-ri-mail-send-line" :label="$t('立即投稿')" :to="links.contribute" target="_blank" />
      </YlfForm>

      <YlfForm>
        <YlfFormItem icon="i-ri-settings-line" :label="$t('设置')" to="/settings" />
      </YlfForm>

      <!-- <YlfForm>
        <YlfFormItem icon="i-ri-article-line" label="自定义菜谱 TODO" to="/cookbooks/" />
      </YlfForm> -->

      <YlfForm>
        <YlfFormItem icon="i-ri-question-line" :label="$t('帮助')" to="/help" />
        <YlfFormItem icon="i-ri-information-line" :label="$t('关于')" to="/help" />
      </YlfForm>
    </div>

    <BaseFooter mt-4 />
  </div>
</template>
