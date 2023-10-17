<template>
  <Header/>
  <router-view class="v-view" />
  <Footer/>
</template>

<script>
import Header from "./components/UI/Header/v-header.vue";
import Footer from "./components/UI/Footer/v-footer.vue";
import {mapGetters, mapActions} from 'vuex'

export default {
  components: {
    Header,
    Footer
  },
  methods: mapActions(["infoToken"]),
  async mounted() {
      this.infoToken()
  }
}
</script>

<style>
@import url('https://fonts.googleapis.com/css2?family=Roboto&display=swap');

body {
  font-family: 'Roboto', sans-serif;
}

.container {
  max-width: 1100px;
  margin: 0 auto;
}

.v-inner {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.v-view {
  min-height: calc(100vh - 70px);
}
</style>
