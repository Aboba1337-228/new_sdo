<template>
  <div class="home">
   <div class="container">
     <Title/>
     <Body />
   </div>
  </div>
</template>

<script>
import Title from "../components/UI/Main/v-title.vue";
import Body from "../components/UI/Main/v-body.vue";

export default {
  components: {
    Title,
    Body
  }
}
</script>
