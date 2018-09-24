<template>
  <div>
    <site-header></site-header>

    Hello, world

    <site-footer></site-footer>
  </div>
</template>

<script>
import SiteHeader from './common/SiteHeader'
import SiteFooter from './common/SiteFooter'

export default {
  components: {
    SiteHeader,
    SiteFooter
  }
}
</script>
