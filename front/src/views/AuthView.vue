<template>
  <div class="v-auth">
    <div class="container">
      <Form />
    </div>
  </div>
</template>

<script>
import router from '@/router'
import Form from '../components/UI/Form/v-form.vue'

export default {
  components: {
    Form
  },

  async mounted() {
    if(this.$store.state.users.isAutoriztion.Auth == true)
      router.push('/profile')
  },
}
</script>
