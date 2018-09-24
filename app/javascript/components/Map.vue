<template>
  <div class="map-wrapper">
    <div :id="id" class="map"></div>
  </div>
</template>

<script>
import * as turf from '@turf/turf'

import LayersControl from '../utilities/layers-control.js'

export default {
  props: {
    id: {
      type: String,
      required: true
    },

    mapboxToken: {
      type: String,
      required: true
    }
  },

  data () {
    return {}
  },

  mounted () {
    mapboxgl.accessToken = this.mapboxToken

    const map = new mapboxgl.Map({
      container: this.id,
      style: 'mapbox://styles/mapbox/light-v9',
      pitchWithRotate: false,
      center: [0, 30],
      zoom: 1
    })

    this.map = map

    map.on('load', () => {
      const navControl = new mapboxgl.NavigationControl()
      const layersControl = new LayersControl()

      const geocoderControl = new MapboxGeocoder({
        accessToken: mapboxgl.accessToken,
        flyTo: true,
        zoom: false
      })

      map.addControl(navControl, 'bottom-right')
      map.addControl(layersControl, 'bottom-left')
      map.addControl(geocoderControl, 'top-left')

      geocoderControl.on('result', (e) => {
        this.addMarker(turf.feature(e.result.geometry))
      })

      geocoderControl.on('clear', (e) => {
        this.clearMarker()
      })

      this.createMarkerLayer()
    })
  },

  methods: {
    createMarkerLayer() {
      this.map.addSource('marker-layer', {
        'type': 'geojson',
        'data': {'type': 'FeatureCollection', 'features': []}
      })

      this.map.addLayer({
        'id': 'marker-layer-points',
        'type': 'circle',
        'source': 'marker-layer',
        'paint': {
          'circle-radius': 6,
          'circle-color': '#B42222',
        },
        'filter': ['==', '$type', 'Point'],
        'layout': {
          'visibility': 'visible'
        }
      })
    },

    addMarker(feature) {
      const fc = turf.featureCollection([feature])
      this.map.getSource('marker-layer').setData(fc)
    },

    clearMarker() {
      this.map.getSource('marker-layer').setData(turf.featureCollection([]))
    }
  }
}
</script>

<style scoped>
</style>