<template>
  <div>
    <site-header></site-header>

    <map-explore :mapbox-token="mapboxToken" id="map--explore"></map-explore>

    <filter-pane id="filters-layers" :filters="[]" title="Select layers"></filter-pane>
  </div>
</template>

<script>
import SiteHeader from './common/SiteHeader'

import MapExplore from './components/Map'
import FilterPane from './components/filters/FilterPane'

export default {
  components: {
    SiteHeader,
    MapExplore,
    FilterPane
  },

  data() {
    return {
      mapboxToken: 'pk.eyJ1IjoibGV2aWF0aGFuczE3IiwiYSI6ImNpeDd5YWIzZTAwM3Myb29jaHNleW02YTgifQ.KOR1dSr7sTbWUtXw4V6tpA'
    }
  }
}
</script>
