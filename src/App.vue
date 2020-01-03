<template>
  <div id="app">
    <navbar/>
    <intro/>
    <wifi-inputs/>
    <about/>
    <qrfooter/>
  </div>
</template>

<script lang="ts">
import { Component, Vue } from 'vue-property-decorator';
import navbar from './components/navbar.vue';
import wifiInputs from './components/input.vue';
import intro from './components/intro.vue';
import about from './components/about.vue';
import qrfooter from './components/footer.vue';

@Component({
  components: {
    navbar,
    intro,
    wifiInputs,
    about,
    qrfooter,
  },
})
export default class App extends Vue {}
</script>

<style lang="scss">
@import url('https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap');
@import "assets/main.css";
#app {
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}
</style>
