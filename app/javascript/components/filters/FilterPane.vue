<template>
  <div class="pane--target" :class="{ 'pane--target--active' : isActive }">
    <button @click.prevent="closePane" class="button--plain pane--target__close icon-chevron-right"></button>

    <div class="pane--target__content">
      <h3 class="flex flex-v-center no-margin gutters pane--target__title">{{ title }}</h3>

      <!-- <filters :filters="filtersArray" :search="search" :layer-group="layerGroup"></filters> -->
    </div>
  </div>
</template>

<script>
  // import axios from 'axios'
  // import helpers from '../../utilities/helpers.js'
  // import { eventHub } from '../../ibat.js'
  // import Filters from './Filters.vue'

  export default {
    name: 'filer-pane',

    // components: { Filters },

    props: {
      id: {
        type: String,
        required: true
      },
      title: String,
      filters: Array,
      search: Boolean,
      source: String
    },

    data () {
      return {
        isActive: true,
        filtersArray: [],
        layerGroup: {}
      }
    },

    created () {
      // const event = 'triggerPaneOpen-' + helpers.spacesToKebab(this.id)

      // this.filtersArray = this.filters

      // eventHub.$on(event, this.openPane)
      // eventHub.$on('triggerPaneClose', this.closePane)

      // if (this.source != undefined) {
      //   eventHub.$on('getNewItems', this.updateSites)
      // }
    },

    destroyed () {
      // const event = 'triggerPaneOpen-' + helpers.spacesToKebab(this.id)

      // eventHub.$off(event, this.openPane)
      // eventHub.$off('triggerPaneClose', this.closePane)
      // eventHub.$off('getNewItems', this.updateSites)
    },

    methods: {
      openPane () {
        this.isActive = true
        // eventHub.$emit('paneOpened')
      },

      closePane () {
        this.isActive = false
        // eventHub.$emit('paneClosed')
      }
      // ,

      // updateSites () {
      //   const csrf = document.querySelectorAll('meta[name="csrf-token"]')[0].getAttribute('content')
      //   axios.defaults.headers.common['X-CSRF-Token'] = csrf
      //   axios.defaults.headers.common['Accept'] = 'application/json'

      //   axios.get(this.source)
      //     .then((response) => {
      //       const newSiteId = response.data[0].layers[0].id

      //       this.$store.commit('map/updateActiveSites', newSiteId)
      //       this.filtersArray = response.data
      //     })
      //     .catch(function (error) {
      //       console.log(error)
      //     })
      // }
    }
  }
</script>

<style lang="scss">
  .pane--target {
    position: fixed;
    right: 0;
    bottom: 0;
    z-index: 1002;

    transform: translateX(100%);

    transition: transform .4s ease-in-out;

    &--active {
      transform: translateX(0);
    }
  }
</style>
