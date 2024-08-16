<script lang="ts" setup>
import Cookies from 'js-cookie'
const rStore = useRecipeStore()
const showDialog = ref(false);
const countdown = ref(15);
let interval: NodeJS.Timeout | undefined;

onMounted(() => {
  const dialogShown = Cookies.get('dialogShown');

  if (!dialogShown) {
    showDialog.value = true;

    interval = setInterval(() => {
      countdown.value--;
      if (countdown.value === 0) {
        showDialog.value = false;
        clearInterval(interval);
        Cookies.set('dialogShown', 'true', { expires: 7 });
      }
    }, 1000);
  }
});

onUnmounted(() => {
  clearInterval(interval);
});

</script>

<template>
  <div text-4xl>
    <button
      class="cursor-pointer transition active:text-green-800 hover:(text-green-600)"
      :title="$t('重置')"
      @click="rStore.reset"
    >
      <div v-if="rStore.selectedStuff.length" i-mdi-pot-steam-outline />
      <div v-else i-mdi-pot-mix-outline />
    </button>
  </div>
  <p text="sm" m="b-4">
    {{ $t('cookToday') }}
  </p>
  <ChooseFood />

  <Dialog v-model:visible="showDialog" header="COOK" position="top" :style="{ width: '50rem' }" :breakpoints="{ '1199px': '75vw', '575px': '90vw' }" :draggable="false" modal maximizable>
    <p>Kính gửi quý khách,</p>
    <br>
    <p>Chúng tôi rất vui khi được đồng hành cùng bạn trong hành trình khám phá ẩm thực với ứng dụng Cook. 
      Để giúp bạn có trải nghiệm tốt nhất, chúng tôi đã chuẩn bị một <a href="https://cook-wiki.vercel.app/" target="_blank" class="wiki">
        tài liệu hướng dẫn chi tiết</a>, 
      chứa đầy đủ thông tin và hướng dẫn cụ thể về cách sử dụng các tính năng của ứng dụng.</p>
      <br>

    <p>Chúng tôi gợi ý bạn hãy dành chút thời gian truy cập và 
      <a href="https://cook-wiki.vercel.app/" target="_blank" class="wiki">tham khảo tài liệu hướng dẫn</a> 
      để hiểu rõ hơn về những tính năng tuyệt vời mà Cook mang lại. 
      Tài liệu này sẽ giúp bạn khai thác tối đa tiềm năng của ứng dụng và biến mỗi bữa ăn trở thành một trải nghiệm thú vị.</p>
      <br>
    <p>Cảm ơn bạn đã tin tưởng và sử dụng Cook!</p>

    <p>Chúc bạn có những giây phút nấu ăn vui vẻ và thành công!</p>
    <br>
    <p>Tự động đóng sau {{ countdown }}s</p>
  </Dialog>
  <!-- <ChooseFoodNew /> -->

</template>

<style scoped>
.wiki {
  color: #3b82f6;
  text-decoration: underline;
  cursor: pointer;
}
</style>