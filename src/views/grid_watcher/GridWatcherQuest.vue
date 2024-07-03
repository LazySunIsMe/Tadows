<template>
    <el-container>
        <el-aside class="el-aside-inside">
            <h4>检测任务查询</h4>
            <el-form :model="stateGridWatcher.questSearchForm" label-width="auto">
                <el-form-item label="指派人">
                    <el-input v-model="stateGridWatcher.questSearchForm.manager_work_number" placeholder="指派人姓名"/>
                </el-form-item>
                <el-form-item label="指派时间">
                    <el-date-picker
                            v-model="stateGridWatcher.questSearchForm.occurrent_time"
                            type="datetime"
                            placeholder="日期时间"
                            format="YYYY/MM/DD HH:mm:ss"
                            value-format="YYYY-MM-DD HH:mm:ss "
                    />
                </el-form-item>
                <el-form-item label="期望完成时间">
                    <el-date-picker
                            v-model="stateGridWatcher.questSearchForm.expect_resoluted_time"
                            type="datetime"
                            placeholder="日期时间"
                            format="YYYY/MM/DD HH:mm:ss"
                            value-format="YYYY-MM-DD HH:mm:ss "
                    />
                </el-form-item>
                <el-form-item label="加急">
                    <el-radio-group v-model="stateGridWatcher.questSearchForm.if_expedited">
                        <el-radio value="1">是</el-radio>
                        <el-radio value="0">否</el-radio>
                    </el-radio-group>
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
import GridWatcherQuestDialogDetailed from "@/components/grid_watcher/GridWatcherQuestDialogDetailed.vue";
import {stateGridWatcher} from "@/components/grid_watcher/GridWatcherConsts";
import {ref} from "vue";

const dialogDetailedRef = ref(false)

const reset = () => {
    stateGridWatcher.questSearchForm = {
        manager_work_number: "",
        appointment_time: "",
        expect_resoluted_time: "",
        if_expedited:"",
    }
}

const doSelect = () => {
    console.log(stateGridWatcher.questSearchForm)
}

const checkDetail = () => {
    stateGridWatcher.gridQuestSituation = '1'
    dialogDetailedRef.value.open()
}
</script>

<style scoped>

</style>