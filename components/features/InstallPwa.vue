<script lang="ts" setup>
const app = useAppStore()

function install() {
  const deferredPrompt = app.deferredPrompt
  // Show the install prompt
  deferredPrompt.prompt()
  // Wait for the user to respond to the prompt
  deferredPrompt.userChoice.then((choiceResult: any) => {
    if (choiceResult.outcome === 'accepted')
      // eslint-disable-next-line no-console
      console.log('User accepted the install prompt')
    else
      // eslint-disable-next-line no-console
      console.log('User dismissed the install prompt')
  })
}
const visible = ref(false);
</script>

<template>
  <Transition>
    <div v-if="app.deferredPrompt" text="center" m="t-2">
      <button
        class="shadow"
        text="white" bg="green-500" p="x-4 y-2" m="2" inline-flex
        items-center justify-center rounded-md font-bold
        @click="visible = true"
      >
        <div i-ri-install-line mr-1 inline-flex />
        <span inline-flex>Tải về thiết bị di động</span>
      </button>
    </div>
  </Transition>
  <Dialog v-model:visible="visible" maximizable modal header="Thông báo" :style="{ width: '50rem' }" :breakpoints="{ '1199px': '75vw', '575px': '90vw' }">
    <p class="m-0">
      Chúng tôi vui mừng thông báo rằng ứng dụng của chúng tôi hiện đã có phiên bản dành cho thiết bị di động. 
      Tuy nhiên, do đây là phiên bản thử nghiệm, có thể sẽ gặp phải một số vấn đề kỹ thuật. 
      Chúng tôi xin chân thành cảm ơn sự thông cảm và kiên nhẫn của quý khách hàng trong quá trình chúng tôi tiếp tục hoàn thiện sản phẩm.
    </p>
    <hr>
    <div flex flex-col items-center justify-center>
      <img src="/public/qr.png" alt="qr code">
    </div>
    <hr>
    <br>
    <a href="https://cookcommunity.vercel.app/" target="_blank" style="text-decoration: none;" flex flex-col items-center justify-center>Nếu cần thêm thông tin hoặc hỗ trợ, đừng ngần ngại liên hệ với chúng tôi.</a>
  </Dialog>
</template>
