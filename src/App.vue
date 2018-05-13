<template>
  <div id="app">
    
    <img src="./assets/logo.png">
    <transition appear v-on:after-appear="afterAppear">
      <Counter  :ports="setUpPorts"></Counter>
    </transition>
    <button @click="ports.counter.send(10)">Multiply by 10</button>
  </div>
</template>

<script>
// import Hello from './components/Hello'
// import { animate } from './animate';
import * as ElmComponent from './elm';
import anime from "animejs";

export default {
  name: 'app',
  data: () => ({
    animate: {},
    stuff: ''
  }),
  components: {
    'Counter': ElmComponent(require('./Counter.elm').Main)
  },
  methods: {
    setUpPorts: function (ports) {
      ports.watchCounter.subscribe(function (message) {
        console.log(message)
      })
      this.ports = ports
    },
    afterAppear: function (el) {
      this.animate = anime({
          targets: '#counter',
          opacity: "1",
          duration: "2000",
          easing: 'easeInOutCirc',
          rotate: '10turn'
        });
      this.animate.play();
    }
  }
}
</script>
<style>
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}

#counter {
  opacity: 0;
}

</style>
