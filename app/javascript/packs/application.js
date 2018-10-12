import Vue from 'vue/dist/vue.esm'

import HomePage from '../HomePage.vue'
import ExplorePage from '../ExplorePage.vue'
import MapPage from '../MapPage.vue'

import TurbolinksAdapter from 'vue-turbolinks';
Vue.use(TurbolinksAdapter)

export const eventHub = new Vue()

document.addEventListener('turbolinks:load', () => {
  const app = new Vue({
    el: '#v-app',
    components: {
      HomePage,
      ExplorePage,
      MapPage
    }
  })
})