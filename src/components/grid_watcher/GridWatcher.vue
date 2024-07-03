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
                    <router-link v-for="(path, index) in gridWatcherPaths" :key="index" :to="path">
                        <el-menu-item :index="index">
                            <el-icon v-if="index === '1'"><House /></el-icon>
                            <el-icon v-if="index === '2'"><Document /></el-icon>
                            <el-icon v-if="index === '3'"><Clock /></el-icon>
                            <template #title>{{ gridWatcherTitles[index] }}</template>
                        </el-menu-item>
                    </router-link>
                </el-menu>
            </el-aside>
            <el-container>
                <el-header>
                    <el-icon class="el-icon-fold" :size="30" color="#FFFFFF" @click="toggleCollapse">
                        <component :is="buttonIcon"/>
                    </el-icon>
                    <h3>{{ gridWatcherTitle }}</h3>
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
import {useRoute} from "vue-router";
import {computed, onMounted, ref} from "vue";
import {Clock, Document, House} from "@element-plus/icons";
import {gridWatcherPaths, gridWatcherTitles} from "@/components/grid_watcher/GridWatcherConsts";
import laoshuyao from "@/assets/QQ20240614142245.jpg";

/**
 * @author Kardia_sfx
 * @date 07-03-2024 13:15
 */
const route = useRoute()
const isCollapse = ref(true)
const activeIndex = ref()

onMounted(() => {
    if (route.path === gridWatcherPaths[1]) activeIndex.value = '1';
    if (route.path === gridWatcherPaths[2]) activeIndex.value = '2';
    if (route.path === gridWatcherPaths[3]) activeIndex.value = '3';
})

const buttonIcon = computed(() => {
    return isCollapse.value ? 'Expand' : "Fold"
})

const gridWatcherTitle = computed(() => gridWatcherTitles[activeIndex.value])

const toggleCollapse = () => {
    isCollapse.value = !isCollapse.value
}

const handleSelect = (index) => {
    activeIndex.value = index;
}

</script>

<style scoped>

</style>