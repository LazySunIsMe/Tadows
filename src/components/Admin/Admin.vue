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
                    <el-menu-item index="1">
                        <el-icon><House /></el-icon>
                        <template #title>{{ adminTitles[1] }}</template>
                    </el-menu-item>
                    <router-link to="/admin/workOrder">
                        <el-menu-item index="2">
                            <el-icon><Document /></el-icon>
                            <template #title>{{ adminTitles[2] }}</template>
                        </el-menu-item>
                    </router-link>
                    <el-menu-item index="3" >
                        <el-icon><Clock /></el-icon>
                        <template #title>{{ adminTitles[3] }}</template>
                    </el-menu-item>
                    <el-menu-item index="4">
                        <el-icon><WindPower /></el-icon>
                        <template #title>{{ adminTitles[4] }}</template>
                    </el-menu-item>
                    <el-menu-item index="5">
                        <el-icon><DataLine /></el-icon>
                        <template #title>{{ adminTitles[5] }}</template>
                    </el-menu-item>
                    <el-menu-item index="6">
                        <el-icon><Edit /></el-icon>
                        <template #title>{{ adminTitles[6] }}</template>
                    </el-menu-item>
                    <el-menu-item index="7">
                        <el-icon><User /></el-icon>
                        <template #title>{{ adminTitles[7] }}</template>
                    </el-menu-item>
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
import {computed, ref} from "vue";
import '@/assets/css/Admin.css';
import laoshuyao from "@/assets/QQ20240614142245.jpg";

/**
 * @author Kardia_sfx
 * @date 06-24-2024 13:49
 */

const isCollapse = ref(true)
const activeIndex = ref('1')

const buttonIcon = computed(() => {
    return isCollapse.value ? 'Expand' : "Fold"
})

const adminTitle = computed(() => adminTitles[activeIndex.value]);

const toggleCollapse = () => {
    isCollapse.value = !isCollapse.value
}

const adminTitles = {
    '1': '首页',
    '2': '待处理监督信息',
    '3': '监督历史记录',
    '4': 'AQI实测数据',
    '5': 'AQI数据大屏',
    '6': '公告信息管理',
    '7': '人员管理审核'
};

function handleSelect(index) {
    activeIndex.value = index;
}

</script>

<style scoped>

</style>