<template>
    <div class="work_flow_div">
        工单流程
    </div>
    <el-steps style="max-width: 600px" :active="1" finish-status="success" process-status="process" align-center class="steps">
        <el-step title="Step 1" :icon="Upload" />
        <el-step title="Step 2" :icon="User" />
        <el-step title="Step 3" :icon="Comment" />
    </el-steps>
    <el-form :model="stateAdmin.dialogForm">
        <el-form-item label="状态">
            <el-select v-model="stateAdmin.dialogForm.status" placeholder="请选择状态" style="width: 240px">
                <el-option
                    v-for="item in statusOptions"
                    :key="item.value"
                    :label="item.label"
                    :value="item.value"
                />
            </el-select>
        </el-form-item>
        <el-row :gutter="20">
            <el-col :span="12">
                <el-form-item label="处理管理员">
                    <el-input placeholder="管理员姓名"/>
                </el-form-item>
            </el-col>
            <el-col :span="12">
                <el-form-item label="分配网格员">
                    <el-input v-model="stateAdmin.dialogForm.grid_watcher_number" placeholder="网格员姓名"/>
                </el-form-item>
            </el-col>
        </el-row>
    </el-form>
</template>

<script setup>
/**
 * @author Kardia_sfx
 * @date 06-28-2024 11:31
 */

import {Upload, User, Comment} from "@element-plus/icons";
import {stateAdmin} from "@/components/Admin/AdminConsts";


</script>

<style scoped>

.work_flow_div {
    text-align: left;
    margin-bottom: 10px;
}

.steps {
    height: 60px;
    width: 100%;
    border: 1px solid;
    padding-top: 10px;
    margin-bottom: 10px;
}

</style>