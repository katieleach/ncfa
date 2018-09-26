<template>
  <div class="ecosystem">
    <section class="ecosystem-category">
      <header class="ecosystem-category__header" v-on:click="toggleCategory(1)">
        <h2>Ecosystem category</h2>
      </header>

      <template v-if="isCategoryVisible(1)">
        <section class="ecosystem-service explore-panel" :class="{'explore-panel--active': isServiceVisible(1)}">
          <header class="explore-panel__header flex flex-h-start flex-v-center" v-on:click="toggleService(1)">
            <div class="explore-panel__left">
              <h3>Animal-based energy</h3>
            </div>

            <div class="explore-panel__right">
              <span class="ecosystem-service__indicator"></span>
              <span class="ecosystem-service__indicator"></span>
            </div>
          </header>

          <template v-if="isServiceVisible(1)">
            <div class="explore-panel__content flex flex-h-start">
              <div class="explore-panel__left">
                <p>Abc...</p>
              </div>

              <div class="explore-panel__right flex flex-h-between flex-v-start">
                <ul class="ecosystem-service__assets">
                  <li>
                    <span class="ecosystem-service__indicator"></span>
                    Water
                  </li>
                  <li>
                    <span class="ecosystem-service__indicator"></span>
                    Habitats
                  </li>
                </ul>

                <div class="ecosystem-service__buttons">
                  <button>Factsheet</button>
                  <button>Explore map</button>
                </div>
              </div>
            </div>

            <table class="explore-panel__content ecosystem-service__processes">
              <colgroup>
                <col class="explore-panel__left">
                <col class="explore-panel__right">
              </colgroup>
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
.ecosystem-category__header {
  margin: 15px 0;
}

.ecosystem-category__header:hover {
  background: #ccc;
}

.explore-panel {
  border: 1px solid black;
}

.explore-panel__left {
  width: 30%;
}

.explore-panel__right {
  width: 70%;
}

.explore-panel__header,
.explore-panel__content {
  padding: 15px;
}

.explore-panel--active header {
  border-bottom: 1px solid black;
}

.explore-panel header h3 {
  margin: 0;
}

.ecosystem-service__indicator {
  background: salmon;
  border-radius: 50%;
  display: inline-block;
  height: 1em;
  width: 1em;
}

.ecosystem-service__assets {
  list-style: none;
  margin: 0;
  padding: 0;
}

.ecosystem-service__processes {
  width: 100%;
}

.ecosystem-service__processes thead th {
  text-align: left;
}

.ecosystem-service__buttons button {
  display: block;
  margin-bottom: 10px;
  width: 150px;
}
</style>