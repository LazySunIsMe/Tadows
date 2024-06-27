<template>
<!--    <img alt="lao_shu_yao1" src="./assets/QQ20240614134430.gif" class="image-class">-->
<!--    <img alt="lao_shu_yao2" src="./assets/QQ20240614142119.gif" class="image-class">-->
<!--    <img alt="lao_shu_yao3" src="./assets/QQ20240614142245.jpg" class="image-class">-->
<!--    <HelloWorld msg="了解你的老鼠药"/>-->
    <router-view/>
</template>

<script setup>
// import HelloWorld from './components/HelloWorld.vue'
import axios from 'axios';
axios.defaults.baseURL = 'http://localhost:8083/nepm/';

// 解决ERROR ResizeObserver loop completed with undelivered notifications.

const debounce = (fn, delay) => {
    let timer = null;
    return function () {
        let context = this;
        let args = arguments;
        clearTimeout(timer);
        timer = setTimeout(function () {
            fn.apply(context, args);
        }, delay)
    }
}

const _ResizeObserver = window.ResizeObserver
window.ResizeObserver = class ResizeObserver extends _ResizeObserver {
    constructor(callback) {
        callback = debounce(callback, 16);
        super(callback);
    }
}

</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
.image-class {
    width: 300px;
    height: 300px;
}
</style>
