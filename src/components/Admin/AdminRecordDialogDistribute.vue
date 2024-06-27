<template>
    <el-dialog v-model="dialogVisible" title="检测任务指派" width="500" >
        <!-- 第一部分：监督任务ID、网格地址级联菜单和“只看空闲网格员”按钮 -->
        <div>
            <el-form :inline="true">
                <el-form-item label="监督任务ID">
                    <el-input v-model="taskId"></el-input>
                </el-form-item>
                <el-form-item label="网格地址">
                    <el-cascader
                        :options="gridOptions"
                        v-model="selectedGrid"
                        placeholder="请选择网格地址"
                        style="width: 200px;"
                    ></el-cascader>
                </el-form-item>
                <el-form-item>
                    <el-button type="primary">只看空闲网格员</el-button>
                </el-form-item>
            </el-form>
        </div>

        <!-- 第二部分：表格展示网格员信息 -->
        <el-table :data="gridMembers" style="margin-top: 20px;">
            <el-table-column prop="id" label="网格员ID"></el-table-column>
            <el-table-column prop="name" label="姓名"></el-table-column>
            <el-table-column prop="completedTasks" label="完成任务数"></el-table-column>
            <el-table-column prop="currentTasks" label="当前负责任务数"></el-table-column>
            <el-table-column label="操作">
                <template #default="{ row }">
                    <el-button type="primary" @click="assignTask(row)">指派</el-button>
                </template>
            </el-table-column>
        </el-table>
    </el-dialog>
</template>

<script setup>/**
 * @author Kardia_sfx
 * @date 06-26-2024 10:48
 */
import {ref} from "vue";

const dialogVisible = ref(false)

const taskId = ref('');
const selectedGrid = ref([]);
const gridMembers = ref([
    { id: 1, name: '网格员A', completedTasks: 5, currentTasks: 2 },
    { id: 2, name: '网格员B', completedTasks: 3, currentTasks: 1 },
    { id: 3, name: '网格员C', completedTasks: 7, currentTasks: 3 },
]);

const gridOptions = ref([
    {
        value: '区域A',
        label: '区域A',
        children: [
            { value: '网格A', label: '网格A' },
            { value: '网格B', label: '网格B' },
        ],
    },
    {
        value: '区域B',
        label: '区域B',
        children: [
            { value: '网格C', label: '网格C' },
            { value: '网格D', label: '网格D' },
        ],
    },
]);

const open = () => {
    dialogVisible.value = true
}

const close = () => {
    dialogVisible.value = false
}

defineExpose({
    open,
    close,
})

const assignTask = (row) => {
    // 处理指派任务的逻辑，可以根据具体需求进行实现
    console.log('Assign task to:', row);
};

</script>

<style scoped>

</style>