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
                <el-form-item label="标题精确查询">
                    <el-input v-model="stateAdmin.noticeSearchForm.title_accurate" placeholder="公告标题"/>
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
        </el-aside>
        <el-main class="el-main-inside">
            <el-scrollbar>

            </el-scrollbar>
        </el-main>
    </el-container>
</template>

<script setup>
/**
 * @author Kardia_sfx
 * @date 06-30-2024 12:59
 */

import {noticePosition, noticeType, stateAdmin} from "@/components/Admin/AdminConsts";
</script>

<style scoped>

</style>