<template>
    <el-container>
        <el-aside class="el-aside-inside">
            <h4>监督信息查询</h4>
            <el-form :model="stateSupervisor.orderSearchForm" label-width="auto">
                <el-form-item label="记录提交时间">
                    <el-date-picker
                            v-model="stateSupervisor.orderSearchForm.occurrent_time"
                            type="datetime"
                            placeholder="日期时间"
                            format="YYYY/MM/DD HH:mm:ss"
                            value-format="YYYY-MM-DD HH:mm:ss "
                    />
                </el-form-item>
                <el-form-item label="期待反馈时间">
                    <el-date-picker
                            v-model="stateSupervisor.orderSearchForm.expect_resoluted_time"
                            type="datetime"
                            placeholder="日期时间"
                            format="YYYY/MM/DD HH:mm:ss"
                            value-format="YYYY-MM-DD HH:mm:ss"
                    />
                </el-form-item>
                <el-form-item label="监督信息内容">
                    <el-input v-model="stateSupervisor.orderSearchForm.description" placeholder="监督记录描述"/>
                </el-form-item>
                <el-form-item label="状态">
                    <el-select v-model="stateSupervisor.orderSearchForm.status" placeholder="请选择状态" style="width: 240px">
                        <el-option
                                v-for="item in orderStatus"
                                :key="item.value"
                                :label="item.label"
                                :value="item.value"
                        />
                    </el-select>
                </el-form-item>
            </el-form>
            <el-button type="primary" @click="doSelect">筛选</el-button>
            <el-button type="warning" @click="reset">回原</el-button>
            <el-button type="warning" @click="distribute">工单流程</el-button>
        </el-aside>
        <el-main class="el-main-inside">
            <el-scrollbar>

            </el-scrollbar>
        </el-main>
    </el-container>

    <el-dialog v-model="dialogWorkFlowRef" width="600px">
        <DialogWorkFlow/>
    </el-dialog>

</template>

<script setup>
/**
 * @author Kardia_sfx
 * @date 07-02-2024 14:10
 */
import {stateSupervisor} from "@/components/supervisor/SupervisorConsts";
import {orderStatus} from "@/components/public/WorkOrderConsts";
import DialogWorkFlow from "@/components/public/DialogWorkFlow.vue";
import {ref} from "vue";

const dialogWorkFlowRef = ref(false)

const doSelect = () => {
    console.log(stateSupervisor.orderSearchForm)
}

const reset = () => {
    stateSupervisor.orderSearchForm = {
        occurent_time:"",
        expect_resoluted_time:"",
        description:"",
        status:"",
    }
}

const distribute = () => {
    // stateSupervisor.dialogForm = { ...row }
    dialogWorkFlowRef.value = true
}
</script>

<style scoped>

</style>