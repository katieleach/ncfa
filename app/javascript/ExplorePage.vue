<template>
  <div>
    <site-header></site-header>
    <nav-bar></nav-bar>

    <div class="container">
      <h1>Natural Capital Risk Explorer Tool</h1>
      <p>Abc</p>
    </div>

    <explore-menu></explore-menu>

    <div class="container">
      <tabs>
        <tab id="tab-services" title="Ecosystem Services" :active="true">
          <explore-content-services></explore-content-services>
        </tab>

        <tab id="tab-assets" title="Natural Capital Assets">
          <explore-content-assets></explore-content-assets>
        </tab>
      </tabs>
    </div>

    <site-footer></site-footer>
  </div>
</template>

<script>
import Tabs from './components/tabs/Tabs'
import Tab from './components/tabs/Tab'

import SiteHeader from './common/SiteHeader'
import SiteFooter from './common/SiteFooter'
import NavBar from './common/NavBar'

import ExploreMenu from './components/ExploreMenu'
import ExploreContentAssets from './components/ExploreContentAssets'
import ExploreContentServices from './components/ExploreContentServices'

export default {
  components: {
    Tabs,
    Tab,
    SiteHeader,
    NavBar,
    SiteFooter,
    ExploreMenu,
    ExploreContentAssets,
    ExploreContentServices
  }
}
</script>

<style scoped>
h1 {
  font-family: Roboto;
}
</style>
