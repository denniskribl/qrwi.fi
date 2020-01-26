import '@fortawesome/fontawesome-free/css/all.min.css';
import 'bootstrap-css-only/css/bootstrap.min.css';
import 'mdbvue/lib/css/mdb.min.css';
import 'vue-slider-component/theme/default.css';

import Vue from 'vue';

import VueSlider from 'vue-slider-component';
import App from './App.vue';

import './registerServiceWorker';

Vue.component('VueSlider', VueSlider);

Vue.config.productionTip = false;


new Vue({
  render: h => h(App),
}).$mount('#app');
