<template>
    <div class="v-container-main">
      <div class="v-inner v-top">
       <div class="v-home-btn">
         <h2>ДОБРО ПОЖАЛОВАТЬ</h2>
         <div>
           <ButtonMain link="items" title="Тестирование" />
         </div>
       </div>
       <img width="478" height="279" src="../../../assets/main.png" alt="">
     </div>
    </div>
</template>

<script>
import ButtonMain from '../Button/v-btn-main.vue'

export default {
  components: {
    ButtonMain
  }
}
</script>

<style scoped>
.v-container-main {
  max-width: 950px;
  margin: 0 auto;
}

.v-top {
  margin: 60px 0px;
}

h2 {
  margin-bottom: 50px;
}
</style>