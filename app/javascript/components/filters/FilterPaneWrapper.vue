<template>
  <div @click="closeWrapper()" class="pane--wrapper" :class="{ 'pane--wrapper--active' : isActive }"></div>
</template>

<script>
  // import { eventHub } from '../../ibat.js'

  export default {
    name: 'filter-pane-wrapper',

    data () {
      return {
        isActive: false
      }
    },

    created () {
      // eventHub.$on('paneOpened', this.openWrapper)
      // eventHub.$on('paneClosed', this.closeWrapper)
    },

    methods: {
      openWrapper () {
        this.isActive = true
      },

      closeWrapper () {
        if (this.isActive) {
          this.isActive = false

          // eventHub.$emit('triggerPaneClose')
        }
      }
    }
  }
</script>

<style lang="scss">
  .pane--wrapper {
    display: none;
    position: fixed;
    top: 0;
    right:0;
    bottom: 0;
    left: 0;
    z-index: 1001;

    &--active { display: block; }
  }
</style>
