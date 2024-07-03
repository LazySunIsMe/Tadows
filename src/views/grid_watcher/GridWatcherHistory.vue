<template>
    <el-container>
        <el-aside class="el-aside-inside">
            <h4>历史任务查询</h4>
            <el-form :model="stateGridWatcher.historySearchForm" label-width="auto">
                <el-form-item label="指派人">
                    <el-input v-model="stateGridWatcher.historySearchForm.manager_work_number" placeholder="指派人姓名"/>
                </el-form-item>
                <el-form-item label="指派时间">
                    <el-date-picker
                            v-model="stateGridWatcher.historySearchForm.appointment_time"
                            type="datetime"
                            placeholder="日期时间"
                            format="YYYY/MM/DD HH:mm:ss"
                            value-format="YYYY-MM-DD HH:mm:ss "
                    />
                </el-form-item>
                <el-form-item label="完成时间">
                    <el-date-picker
                            v-model="stateGridWatcher.historySearchForm.completion_time"
                            type="datetime"
                            placeholder="日期时间"
                            format="YYYY/MM/DD HH:mm:ss"
                            value-format="YYYY-MM-DD HH:mm:ss "
                    />
                </el-form-item>
            </el-form>
            <el-button type="primary" @click="doSelect">筛选</el-button>
            <el-button type="warning" @click="reset">回原</el-button>
            <el-button type="warning" @click="checkDetail">checkDetail</el-button>
        </el-aside>
        <el-main class="el-main-inside">
            <el-scrollbar>

            </el-scrollbar>
        </el-main>
    </el-container>

    <GridWatcherQuestDialogDetailed
        ref=dialogDetailedRef
    />
</template>

<script setup>
/**
 * @author Kardia_sfx
 * @date 07-03-2024 14:01
 */

import {stateGridWatcher} from "@/components/grid_watcher/GridWatcherConsts";
import GridWatcherQuestDialogDetailed from "@/components/grid_watcher/GridWatcherQuestDialogDetailed.vue";
import {ref} from "vue";

const dialogDetailedRef = ref(false)

const reset = () => {
    stateGridWatcher.historySearchForm = {
        manager_work_number: "",
        appointment_time: "",
        completion_time: "",
    }
}

const doSelect = () => {
    console.log(stateGridWatcher.historySearchForm)
}

const checkDetail = () => {
    stateGridWatcher.gridQuestSituation = '2'
    dialogDetailedRef.value.open()
}

</script>

<style scoped>

</style>