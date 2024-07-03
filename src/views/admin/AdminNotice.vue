<template>
    <el-container>
        <el-aside class="el-aside-inside">
            <h4>公告信息查询</h4>
            <el-form :model="stateAdmin.noticeSearchForm" label-width="auto">
                <el-form-item label="发布时间段">
                    <el-date-picker
                        v-model="stateAdmin.noticeSearchForm.publish_time"
                        type="datetimerange"
                        range-separator="到"
                        start-placeholder="开始时间"
                        end-placeholder="结束时间"
                        format="YYYY/MM/DD HH:mm:ss"
                        value-format="YYYY-MM-DD HH:mm:ss "
                    />
                </el-form-item>
                <el-form-item label="标题模糊查询">
                    <el-input v-model="stateAdmin.noticeSearchForm.title_vague" placeholder="公告标题"/>
                </el-form-item>
                <el-form-item label="公告类型">
                    <el-select v-model="stateAdmin.noticeSearchForm.type" placeholder="请选择类型" style="width: 240px">
                        <el-option
                            v-for="item in noticeType"
                            :key="item.value"
                            :label="item.label"
                            :value="item.value"
                        />
                    </el-select>
                </el-form-item>
                <el-form-item label="公告位置">
                    <el-select v-model="stateAdmin.noticeSearchForm.if_important" placeholder="请选择位置" style="width: 240px">
                        <el-option
                            v-for="item in noticePosition"
                            :key="item.value"
                            :label="item.label"
                            :value="item.value"
                        />
                    </el-select>
                </el-form-item>
            </el-form>
            <el-button type="primary" @click="doSelect">筛选</el-button>
            <el-button type="warning" @click="reset">回原</el-button>
            <el-button type="warning" @click="addNotice">addNotice</el-button>
        </el-aside>
        <el-main class="el-main-inside">
            <el-scrollbar>

            </el-scrollbar>
        </el-main>
    </el-container>

    <AdminNoticeDialogAdd
        ref=dialogAddRef
    />
</template>

<script setup>/**
 * @author Kardia_sfx
 * @date 06-30-2024 12:59
 */
import {ref} from "vue";

const dialogAddRef = ref (false)

const addNotice = () => {
    // row
    // stateAdmin.dialogForm = { ...row }
    // console.log("selected row:", stateAdmin.dialogForm)
    dialogAddRef.value.open()
}

const doSelect = () => {
    console.log(stateAdmin.noticeSearchForm)
}

const reset = () => {
    stateAdmin.noticeSearchForm = {
        publish_time:"",
        title_vague:"",
        type:"",
        if_important:"",
    };
};

import {stateAdmin} from "@/components/admin/AdminConsts";
import {noticePosition, noticeType} from "@/components/public/NoticeConsts";
import AdminNoticeDialogAdd from "@/components/admin/AdminNoticeDialogAdd.vue";
</script>

<style scoped>

</style>