<template>
    <el-dialog v-model="dialogAddVisible" title="新增公告" width="600">
        <el-form :model="stateAdmin.dialogForm">
            <el-row :gutter="20">
                <el-col :span="12">
                    <el-form-item label="标题">
                        <el-input v-model="stateAdmin.dialogForm.title" placeholder="请输入ID"></el-input>
                    </el-form-item>
                </el-col>
                <el-col :span="12">
                    <el-form-item label="类型">
                        <el-select v-model="stateAdmin.dialogForm.type" placeholder="请选择类型" style="width: 240px">
                            <el-option
                                    v-for="item in noticeType"
                                    :key="item.value"
                                    :label="item.label"
                                    :value="item.value"
                            />
                        </el-select>
                    </el-form-item>
                </el-col>
            </el-row>
            <el-row :gutter="20">
                <el-col :span="12">
                    <el-form-item label="位置">
                        <el-select v-model="stateAdmin.dialogForm.if_important" placeholder="请选择位置" style="width: 240px">
                            <el-option
                                    v-for="item in noticePosition"
                                    :key="item.value"
                                    :label="item.label"
                                    :value="item.value"
                            />
                        </el-select>
                    </el-form-item>
                </el-col>
                <el-col :span="12">
                    <el-form-item label="头图">
                        上传占位
                    </el-form-item>
                </el-col>
            </el-row>
            <span>公告内容的顺序与表格中内容顺序相同</span>
            <el-form-item>
                <el-table>

                </el-table>
            </el-form-item>
        </el-form>
        <el-button type="primary" @click="">新增文本</el-button>
        <el-button type="warning" @click="">新增多媒体内容</el-button>
        <el-button type="danger" @click="">清空内容</el-button>
    </el-dialog>
</template>

<script setup>/**
 * @author Kardia_sfx
 * @date 07-03-2024 12:51
 */
import {stateAdmin} from "@/components/admin/AdminConsts";
import {ref} from "vue";
import {noticePosition, noticeType} from "@/components/public/NoticeConsts";

const dialogAddVisible = ref (false)

const open = () => {
    console.log('Opening dialog with data:', stateAdmin.dialogForm);
    dialogAddVisible.value = true
}

const close = () => {
    dialogAddVisible.value = false
}

defineExpose({
    open,
    close,
})

</script>

<style scoped>

</style>