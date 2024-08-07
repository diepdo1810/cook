import { ref } from 'vue';

const loading = ref(false);

const handleLoading = async () => {
  loading.value = true;
  await new Promise((resolve) => setTimeout(resolve, 1000));
  loading.value = false;
}

export { loading, handleLoading };
