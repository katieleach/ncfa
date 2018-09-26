<template>
  <div class="explore-menu flex flex-h-start">
    <div class="explore-menu__selection">
      <label for="sector">1. Sector</label>
      <select id="sector">
        <option>Sector A</option>
        <option>Sector B</option>
        <option>Sector C</option>
      </select>
    </div>

    <div class="explore-menu__selection">
      <label for="industry">2. Sub Industry</label>
      <select id="industry">
        <option>Industry A</option>
        <option>Industry B</option>
        <option>Industry C</option>
      </select>
    </div>

    <div class="explore-menu__selection">
      <label for="process">3. Production Processes</label>
      <select id="process">
        <option>Process A</option>
        <option>Process B</option>
        <option>Process C</option>
      </select>
    </div>
  </div>
</template>

<style scoped>
.explore-menu {
  background: #ccc;
  border: solid black;
  border-width: 1px 0;
  margin: 40px 0;
}

.explore-menu__selection {
  border-right: 1px solid black;
  padding: 20px 30px;
}

.explore-menu__selection:last-child {
  border-right: none;
}

.explore-menu__selection label {
  display: block;
}
</style>
