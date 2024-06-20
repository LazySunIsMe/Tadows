<template lang="html">
    <div class="common-layout">
        <el-container>
            <el-aside >
<!--                <el-button @click="toggleCollapse">-->
<!--                    {{ isCollapse ? 'Expand' : 'Collapse' }}-->
<!--                </el-button>-->
                <el-menu
                    default-active="2"
                    class="el-menu-vertical"
                    :collapse="isCollapse"
                >
                    <el-sub-menu index="1">
                        <template #title>
                            <el-icon><Location /></el-icon>
                            <span>Navigator One</span>
                        </template>
                        <el-menu-item-group>
                            <template #title><span>Group One</span></template>
                            <el-menu-item index="1-1">item one</el-menu-item>
                            <el-menu-item index="1-2">item two</el-menu-item>
                        </el-menu-item-group>
                        <el-menu-item-group title="Group Two">
                            <el-menu-item index="1-3">item three</el-menu-item>
                        </el-menu-item-group>
                        <el-sub-menu index="1-4">
                            <template #title><span>item four</span></template>
                            <el-menu-item index="1-4-1">item one</el-menu-item>
                        </el-sub-menu>
                    </el-sub-menu>
                    <el-menu-item index="2">
                        <el-icon><Menu /></el-icon>
                        <template #title>Navigator Two</template>
                    </el-menu-item>
                    <el-menu-item index="3" disabled>
                        <el-icon><Document /></el-icon>
                        <template #title>Navigator Three</template>
                    </el-menu-item>
                    <el-menu-item index="4">
                        <el-icon><Setting /></el-icon>
                        <template #title>Navigator Four</template>
                    </el-menu-item>
                </el-menu>
            </el-aside>
            <el-container>
                <el-header>
<!--                    <el-button :icon="buttonIcon" :icon-size="18" type="primary" size=large @click="toggleCollapse" />-->
                    <el-icon :size="20" color="#FFFFFF" @click="toggleCollapse"><component :is="buttonIcon"/></el-icon>
                    oi
                </el-header>
                <el-main>
                    <el-container>
                        <el-aside>Inside aside</el-aside>
                        <el-main>Inside main</el-main>
                    </el-container>
                </el-main>
            </el-container>
        </el-container>
    </div>
</template>

<script>
import { computed, reactive, ref, toRefs } from "vue";
import '@/assets/css/AdminWorkOrder.css';

export default {
    name: "AdminWorkOrder",
    setup() {
        const state = reactive({
            isCollapse: ref(true)
        })

        const buttonIcon = computed(() => {
            return state.isCollapse ? 'Expand' : "Fold"
        })

        const toggleCollapse = () => {
            state.isCollapse = !state.isCollapse

        }

        return {
            ...toRefs(state),
            buttonIcon,
            toggleCollapse
        }
    }
}
</script>

<style scoped>

</style>