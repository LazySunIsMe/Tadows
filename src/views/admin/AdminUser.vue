<template>
    <el-container>
        <el-aside class="el-aside-inside">
            <h4>用户信息查询</h4>
            <el-form  :model="stateAdmin.userSearchForm" label-width="auto">
                <el-form-item label="昵称">
                    <el-input v-model="stateAdmin.userSearchForm.user_nickname" placeholder="用户的昵称"/>
                </el-form-item>
                <el-form-item label="工号">
                    <el-input v-model="stateAdmin.userSearchForm.user_work_number" placeholder="用户的工号"/>
                </el-form-item>
                <el-form-item label="账户状态">
                    <el-radio-group v-model="stateAdmin.userSearchForm.if_active">
                        <el-radio value="1">启用</el-radio>
                        <el-radio value="0">禁用</el-radio>
                    </el-radio-group>
                </el-form-item>
                <el-form-item label="用户角色">
                    <el-select v-model="stateAdmin.userSearchForm.user_role" placeholder="请选择角色">
                        <el-option
                            v-for="item in userRole"
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
 * @date 06-30-2024 20:21
 */
import {userRole, stateAdmin} from "@/components/admin/AdminConsts";
</script>

<style scoped>

</style>