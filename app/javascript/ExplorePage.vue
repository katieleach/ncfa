<template>
  <div>
    <site-header></site-header>

    <h1>Natural Capital Risk Explorer Tool</h1>
    <p>Abc</p>

    <explore-menu></explore-menu>
    <explore-sections-tabs></explore-sections-tabs>

    <explore-content-services></explore-content-services>
    <explore-content-assets></explore-content-assets>

    <site-footer></site-footer>
  </div>
</template>

<script>
import SiteHeader from './common/SiteHeader'
import SiteFooter from './common/SiteFooter'

import ExploreMenu from './components/ExploreMenu'
import ExploreSectionsTabs from './components/ExploreSectionsTabs'
import ExploreContentAssets from './components/ExploreContentAssets'
import ExploreContentServices from './components/ExploreContentServices'

export default {
  components: {
    SiteHeader,
    SiteFooter,
    ExploreMenu,
    ExploreSectionsTabs,
    ExploreContentAssets,
    ExploreContentServices
  }
}
</script>
