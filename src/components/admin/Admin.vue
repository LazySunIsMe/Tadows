<template>
    <div class="common-layout">
        <el-container>
            <el-aside>
                <el-menu
                        :default-active="activeIndex"
                        class="el-menu-vertical"
                        :collapse="isCollapse"
                        @select="handleSelect"
                >
                    <router-link v-for="(path, index) in adminPaths" :key="index" :to="path">
                        <el-menu-item :index="index">
                            <el-icon v-if="index === '1'"><House /></el-icon>
                            <el-icon v-if="index === '2'"><Document /></el-icon>
                            <el-icon v-if="index === '3'"><Clock /></el-icon>
                            <el-icon v-if="index === '4'"><WindPower /></el-icon>
                            <el-icon v-if="index === '5'"><DataLine /></el-icon>
                            <el-icon v-if="index === '6'"><Edit /></el-icon>
                            <el-icon v-if="index === '7'"><User /></el-icon>
                            <template #title>{{ adminTitles[index] }}</template>
                        </el-menu-item>
                    </router-link>
                </el-menu>
            </el-aside>
            <el-container>
                <el-header>
                    <el-icon class="el-icon-fold" :size="30" color="#FFFFFF" @click="toggleCollapse">
                        <component :is="buttonIcon"/>
                    </el-icon>
                    <h3>{{ adminTitle }}</h3>
                    <el-image class="el-image-avatar" :src="laoshuyao" />
                </el-header>
                <el-main>
                    <router-view></router-view>
                </el-main>
            </el-container>
        </el-container>
    </div>
</template>

<script setup>
import {Clock, DataLine, Document, Edit, House, User, WindPower} from "@element-plus/icons";
import {computed, onMounted, ref} from "vue";
import {useRoute} from "vue-router";
import '@/assets/css/MainPage.css';
import laoshuyao from "@/assets/QQ20240614142245.jpg";
import {adminPaths, adminTitles} from "./AdminConsts";

/**
 * @author Kardia_sfx
 * @date 06-24-2024 13:49
 */
const route = useRoute()
const isCollapse = ref(true)
const activeIndex = ref()

onMounted(() => {
    if (route.path === adminPaths[1]) activeIndex.value = '1';
    if (route.path === adminPaths[2]) activeIndex.value = '2';
    if (route.path === adminPaths[3]) activeIndex.value = '3';
    if (route.path === adminPaths[4]) activeIndex.value = '4';
    // if (route.path === '/admin/') activeIndex.value = '5';
    if (route.path === adminPaths[6]) activeIndex.value = '6';
    if (route.path === adminPaths[7]) activeIndex.value = '7';
})

const buttonIcon = computed(() => {
    return isCollapse.value ? 'Expand' : "Fold"
})

const adminTitle = computed(() => adminTitles[activeIndex.value])

const toggleCollapse = () => {
    isCollapse.value = !isCollapse.value
}

const handleSelect = (index) => {
    activeIndex.value = index;
    // console.log(activeIndex.value + adminTitles[activeIndex.value]);
}

</script>

<style scoped>

</style>