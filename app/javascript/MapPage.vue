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
      mapboxToken: process.env.MAPBOX_TOKEN
    }
  }
}
</script>
