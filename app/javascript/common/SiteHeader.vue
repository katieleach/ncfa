<template>
  <div class="header-wrapper">
    <div class="topbar--primary flex flex-v-center flex-h-between">
      <div class="topbar__select">
        Main NCFA Website
      </div>
    </div>
    <nav-bar></nav-bar>
    <div class="header">
      <h1 class="header__title">This is a title</h1>
      <p class="header__intro">{{intro}}</p>
    </div>
  </div>
</template>

<script>
import NavBar from './NavBar';

export default {
  components: {
    NavBar
  },
  //dummy text
  data: function () {
    return {
      intro: this.getIntroText()
    }
  },
  methods: {
    getIntroText () {
      let text = 'Some intro text ';
      for(let i=0; i<5; i++) {text += text};
      return text;
    }
  }
}
</script>

