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
                        <template #title>首页</template>
                    </el-menu-item>
                    <el-menu-item index="2">
                        <el-icon><Document /></el-icon>
                        <template #title>待处理监督信息</template>
                    </el-menu-item>
                    <el-menu-item index="3" >
                        <el-icon><Clock /></el-icon>
                        <template #title>监督历史记录</template>
                    </el-menu-item>
                    <el-menu-item index="4">
                        <el-icon><WindPower /></el-icon>
                        <template #title>AQI实测数据</template>
                    </el-menu-item>
                    <el-menu-item index="5">
                        <el-icon><DataLine /></el-icon>
                        <template #title>AQI数据大屏</template>
                    </el-menu-item>
                    <el-menu-item index="6">
                        <el-icon><Edit /></el-icon>
                        <template #title>公告信息管理</template>
                    </el-menu-item>
                    <el-menu-item index="7">
                        <el-icon><User /></el-icon>
                        <template #title>人员管理审核</template>
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
                    <slot></slot>
                </el-main>
            </el-container>
        </el-container>
    </div>
</template>

<script>
import {Clock, DataLine, Document, Edit, House, User, WindPower} from "@element-plus/icons";
import {computed, reactive, ref, toRefs} from "vue";
import '@/assets/css/Admin.css';
import {provinceAndCityData} from "element-china-area-data";
import laoshuyao from "@/assets/QQ20240614142245.jpg";

/**
 * @author Kardia_sfx
 * @date 06-24-2024 13:49
 */
export default {
    name: "Admin",
    components: {User, Edit, DataLine, WindPower, Clock, Document, House},
    setup() {
        const state = reactive({
            isCollapse: ref(true),
            activeIndex: ref('2'),
        })

        const buttonIcon = computed(() => {
            return state.isCollapse ? 'Expand' : "Fold"
        })

        const adminTitle = computed(() => adminTitles[state.activeIndex]);

        const toggleCollapse = () => {
            state.isCollapse = !state.isCollapse
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
            state.activeIndex = index;
        }

        return {
            ...toRefs(state),
            buttonIcon,
            handleSelect,
            adminTitle,
            toggleCollapse,
            provinceAndCityData,
            laoshuyao
        }
    }
}
</script>

<style scoped>

</style>