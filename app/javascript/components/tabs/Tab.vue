<template>
  <div v-show="isActive" class="tab">
    <slot></slot>
  </div>
</template>

<script>
  export default {
    name: 'tab',
    props: {
      id: {
        required: true,
        type: String
      },
      title: {
        required: true,
        type: String
      },
      active: { type: Boolean }
    },
    data () {
      return {
        isActive: false
      }
    },
    created () {
      if (this.active) { this.isActive = this.active }
    }
  }
</script>

<style lang="scss">
  .tab {
    &__trigger {
      cursor: pointer;
    }
  }
</style>