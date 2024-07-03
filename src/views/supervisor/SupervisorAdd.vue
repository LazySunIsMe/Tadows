<template>
    <el-container>
        <el-main class="el-main-inside">
            <el-form :model="stateSupervisor.dialogForm">
                <el-row :gutter="20">
                    <el-col :span="12">
                        <el-form-item label="网格地址">
                            <el-cascader
                                :options="cityData"
                                v-model="stateSupervisor.dialogForm.address"
                                :props="cityProps"
                                placeholder="请选择城市"
                            ></el-cascader>
                        </el-form-item>
                    </el-col>
                    <el-col :span="12">
                        <el-form-item label="监督信息类型">
                            <el-radio-group v-model="stateSupervisor.dialogForm.if_expedited">
                                <el-radio value="0">监督请求</el-radio>
                                <el-radio value="1">质询</el-radio>
                            </el-radio-group>
                        </el-form-item>
                    </el-col>
                </el-row>
                <el-row :gutter="20">
                    <el-col :span="12">
                        <el-form-item label="状况发生时间">
                            <el-date-picker
                                v-model="stateSupervisor.dialogForm.occurrent_time"
                                type="datetime"
                                placeholder="选择日期时间"
                                style="width: 100%;"
                                format="YYYY/MM/DD HH:mm:ss"
                                value-format="YYYY-MM-DD HH:mm:ss"
                            ></el-date-picker>
                        </el-form-item>
                    </el-col>
                    <el-col :span="12">
                        <el-form-item label="期望反馈时间">
                            <el-date-picker
                                v-model="stateSupervisor.dialogForm.expect_resoluted_time"
                                type="datetime"
                                placeholder="选择日期时间"
                                style="width: 100%;"
                                format="YYYY/MM/DD HH:mm:ss"
                                value-format="YYYY-MM-DD HH:mm:ss"
                            ></el-date-picker>
                        </el-form-item>
                    </el-col>
                </el-row>
                <el-form-item label="内容描述">
                    <el-input
                        type="textarea"
                        v-model="stateSupervisor.dialogForm.description"
                        placeholder="请输入内容描述"
                        :autosize="{ minRows: 6, maxRows: 6 }"
                    ></el-input>
                </el-form-item>
                <el-form-item label="附件预览">
                    附件上传占位
                </el-form-item>
            </el-form>
            <el-button type="success" @click="addRecord">提交</el-button>
            <el-button type="primary" @click="">保存</el-button>
            <el-button type="danger" @click="">清空</el-button>
        </el-main>
    </el-container>

</template>

<script setup>
/**
 * @author Kardia_sfx
 * @date 07-02-2024 10:10
 */
import {stateSupervisor} from "@/components/supervisor/SupervisorConsts";
import cityData from "@/assets/json/pca-code.json";
import {cityProps} from "@/components/public/CityConsts";

const addRecord = () => {
    console.log(stateSupervisor.dialogForm)
}
</script>

<style scoped>

</style>