<template>
  <div flex flex-col>
    <CommonHeader>
      {{ $t('今天吃什么') }}
    </CommonHeader>
    <div flex flex-grow flex-col items-center justify-center>
      <RandomRecipe />
    </div>
  </div>
</template>
