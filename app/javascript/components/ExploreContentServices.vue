<template>
  <div class="ecosystem">
    <section class="ecosystem-category">
      <header v-on:click="toggleCategory(1)">
        <h2>Ecosystem category</h2>
      </header>

      <template v-if="isCategoryVisible(1)">
        <section class="ecosystem-service">
          <header v-on:click="toggleService(1)">
            <h3>Animal-based energy</h3>
            <span class="ecosystem-service__indicator"></span>
            <span class="ecosystem-service__indicator"></span>
          </header>

          <template v-if="isServiceVisible(1)">
            <p>Abc...</p>

            <ul>
              <li>
                <span class="ecosystem-service__indicator"></span>
                Water
              </li>
              <li>
                <span class="ecosystem-service__indicator"></span>
                Habitats
              </li>
            </ul>

            <button>Factsheet</button>
            <button>Explore map</button>

            <table class="ecosystem-service__processes">
              <thead>
                <tr>
                  <th>Producion processes</th>
                  <th>Materiality rating</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>Rainfed arable crops</td>
                  <td><span class="ecosystem-service__indicator"></span>Abc...</td>
                </tr>
                <tr>
                  <td>Dairy livestock</td>
                  <td><span class="ecosystem-service__indicator"></span>Abc...</td>
                </tr>
              </tbody>
            </table>
          </template>
        </section>
      </template>
    </section>
  </div>
</template>

<script>
export default {
  data() {
    return {
      visibleCategory: null,
      visibleService: null
    }
  },

  methods: {
    toggleCategory(id) {
      this.visibleCategory = (this.visibleCategory === id) ? null : id
    },

    isCategoryVisible(id) {
      return this.visibleCategory === id
    },

    toggleService(id) {
      this.visibleService = (this.visibleService === id) ? null : id
    },

    isServiceVisible(id) {
      return this.visibleService === id
    }
  }
}
</script>


<style scoped>
.ecosystem-service__indicator {
  background: red;
  border-radius: 50%;
  display: inline-block;
  height: 1em;
  width: 1em;
}
</style>