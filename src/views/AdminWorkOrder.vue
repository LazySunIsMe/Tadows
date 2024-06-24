<template lang="html">
    <div class="common-layout">
        <el-container>
            <el-aside>
                <el-menu
                    default-active="2"
                    class="el-menu-vertical"
                    :collapse="isCollapse"
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
                    <el-image :src="laoshuyao" />
                </el-header>
                <el-main>
                    <el-container>
                        <el-aside class="el-aside-inside">
                            <h4>监督记录查询</h4>
                            <el-form  :model="recordForm" label-width="auto">
                                <el-form-item label="网格地址">
                                    <el-cascader
                                            size="large"
                                            :options="provinceAndCityData"
                                            :model="selectedOptions"
                                            :props="cityProps"
                                            placeholder="请选择城市"
                                    >
                                    </el-cascader>
                                </el-form-item>
                                <el-form-item label="监督信息内容">
                                    <el-input v-model="recordForm.description" placeholder="监督信息"/>
                                </el-form-item>
                                <el-form-item label="记录提交时间">
                                    <el-date-picker
                                            v-model="recordForm.occurrent_time"
                                            type="date"
                                            placeholder="日期"
                                            format="YYYY/MM/DD"
                                            value-format="YYYY-MM-DD"
                                    />
                                </el-form-item>
                                <el-form-item label="期待反馈时间">
                                    <el-date-picker
                                            v-model="recordForm.expect_resoluted_time"
                                            type="date"
                                            placeholder="日期"
                                            format="YYYY/MM/DD"
                                            value-format="YYYY-MM-DD"
                                    />
                                </el-form-item>
                                <el-form-item label="是否加急">
                                    <el-radio-group v-model="recordForm.if_expedited">
                                        <el-radio value="1">是</el-radio>
                                        <el-radio value="0">否</el-radio>
                                    </el-radio-group>
                                </el-form-item>
                            </el-form>
                            <el-button type="primary" @click="doSelect">筛选</el-button>
                            <el-button type="warning" @click="reset">回原</el-button>
                        </el-aside>
                        <el-main class="el-main-inside">
                            <el-scrollbar>
                                <el-button plain @click="recordDetailDialog = true">
                                    打开，打开，一定要打开
                                </el-button>
<!--                                <el-table :data="mainTableElement" stripe>-->
<!--                                    <el-table-column prop="" label="" width=""/>-->
<!--                                </el-table>-->
                            </el-scrollbar>
                        </el-main>
                    </el-container>
                </el-main>
            </el-container>
        </el-container>
    </div>

    <el-dialog v-model="recordDetailDialog" title="Shipping address" width="500">
        <el-form :model="recordForm">
            <el-form-item label="Promotion name" >
                <el-input v-model="recordForm.description" autocomplete="off" />
            </el-form-item>
            <el-form-item label="Zones" >
                <el-select v-model="recordForm.address" placeholder="Please select a zone">
                    <el-option label="Zone No.1" value="shanghai" />
                    <el-option label="Zone No.2" value="beijing" />
                </el-select>
            </el-form-item>
        </el-form>
        <template #footer>
            <div class="dialog-footer">
                <el-button @click="recordDetailDialog = false">Cancel</el-button>
                <el-button type="primary" @click="recordDetailDialog = false">
                    Confirm
                </el-button>
            </div>
        </template>
    </el-dialog>
</template>

<script>
import { computed, reactive, ref, toRefs } from "vue";
import { provinceAndCityData } from 'element-china-area-data'
import '@/assets/css/AdminWorkOrder.css';
import laoshuyao from '@/assets/QQ20240614142245.jpg';
import {Clock, DataBoard, DataLine, Document, Edit, House, Setting, User, WindPower} from "@element-plus/icons";

export default {
    name: "AdminWorkOrder",
    components: {WindPower, Edit, DataLine, DataBoard, Clock, Document, House, Setting, User},
    setup() {
        const state = reactive({
            isCollapse: ref(true),
            recordDetailDialog: ref(false),
            recordForm: {
                address:"",
                description:"",
                occurrent_time:"",
                expect_resoluted_time:"",
                if_expedited:"",
            },
            selectedOptions: [],
            mainTableElement: {}
        })

        const cityProps = {
            expandTrigger: 'hover'
        }

        const buttonIcon = computed(() => {
            return state.isCollapse ? 'Expand' : "Fold"
        })

        const toggleCollapse = () => {
            state.isCollapse = !state.isCollapse
        }

        function doSelect() {

        }

        function reset() {
            state.recordForm = {
                address:"",
                description:"",
                occurrent_time:"",
                expect_resoluted_time:"",
                if_expedited:"",
            }
        }

        return {
            ...toRefs(state),
            buttonIcon,
            toggleCollapse,
            doSelect,
            reset,
            provinceAndCityData,
            cityProps,
            laoshuyao
        }
    }
}
</script>

<style scoped>

</style>