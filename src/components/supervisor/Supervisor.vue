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
                    <router-link v-for="(path, index) in supervisorPaths" :key="index" :to="path">
                        <el-menu-item :index="index">
                            <el-icon v-if="index === '1'"><House /></el-icon>
                            <el-icon v-if="index === '2'"><DocumentAdd /></el-icon>
                            <el-icon v-if="index === '3'"><Clock /></el-icon>
                            <template #title>{{ supervisorTitles[index] }}</template>
                        </el-menu-item>
                    </router-link>
                </el-menu>
            </el-aside>
            <el-container>
                <el-header>
                    <el-icon class="el-icon-fold" :size="30" color="#FFFFFF" @click="toggleCollapse">
                        <component :is="buttonIcon"/>
                    </el-icon>
                    <h3>{{ supervisorTitle }}</h3>
                    <el-image class="el-image-avatar" :src="laoshuyao" />
                </el-header>
                <el-main>
                    <router-view></router-view>
                </el-main>
            </el-container>
        </el-container>
    </div>
</template>

<script setup>/**
 * @author Kardia_sfx
 * @date 07-01-2024 22:33
 */
import {useRoute} from "vue-router";
import {computed, onMounted, ref} from "vue";
import {supervisorPaths, supervisorTitles} from "@/components/supervisor/SupervisorConsts";
import {Clock, DocumentAdd, House} from "@element-plus/icons";
import laoshuyao from "@/assets/QQ20240614142245.jpg";

const route = useRoute()
const isCollapse = ref(true)
const activeIndex = ref()

onMounted(() => {
    if (route.path === supervisorPaths[1]) activeIndex.value = '1';
    if (route.path === supervisorPaths[2]) activeIndex.value = '2';
    if (route.path === supervisorPaths[3]) activeIndex.value = '3';
})

const buttonIcon = computed(() => {
    return isCollapse.value ? 'Expand' : "Fold"
})

const supervisorTitle = computed(() => supervisorTitles[activeIndex.value])

const toggleCollapse = () => {
    isCollapse.value = !isCollapse.value
}

const handleSelect = (index) => {
    activeIndex.value = index;
}
</script>

<style scoped>

</style>