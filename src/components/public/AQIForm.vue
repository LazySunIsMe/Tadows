<template>
    <el-form :model="stateAQI.AQIForm">
        <el-row :gutter="20">
            <el-col :span="12">
                <el-form-item label="监督记录ID">
                    <el-input placeholder="记录id" v-model="stateAQI.AQIForm.aqi_id"></el-input>
                </el-form-item>
            </el-col>
            <el-col :span="12">
                <el-form-item label="网格地址">
                    <el-cascader
                            :options="cityData"
                            v-model="stateAQI.AQIForm.address"
                            :props="cityProps"
                            placeholder="请选择城市"
                    ></el-cascader>
                </el-form-item>
            </el-col>
        </el-row>
        <hr class="dividing-line">
        <el-form-item>
            <el-input v-model="stateAQI.AQIForm.pm2d5" placeholder="PM2.5">
                <template #prepend>PM2.5</template>
                <template #append>μg/m³</template>
            </el-input>
        </el-form-item>
        <el-form-item>
            <el-input v-model="stateAQI.AQIForm.pm10" placeholder="PM10">
                <template #prepend>PM10&nbsp;</template>
                <template #append>μg/m³</template>
            </el-input>
        </el-form-item>
        <el-form-item>
            <el-input v-model="stateAQI.AQIForm.so2" placeholder="SO₂">
                <template #prepend>SO₂&emsp;</template>
                <template #append>μg/m³</template>
            </el-input>
        </el-form-item>
        <el-form-item>
            <el-input v-model="stateAQI.AQIForm.no2" placeholder="NO₂">
                <template #prepend>NO₂&emsp;</template>
                <template #append>μg/m³</template>
            </el-input>
        </el-form-item>
        <el-form-item>
            <el-input v-model="stateAQI.AQIForm.o3" placeholder="O₃">
                <template #prepend>O₃&emsp;&nbsp;&nbsp;</template>
                <template #append>μg/m³</template>
            </el-input>
        </el-form-item>
        <el-form-item>
            <el-input v-model="stateAQI.AQIForm.co" placeholder="CO">
                <template #prepend>CO&emsp;&nbsp;</template>
                <template #append>mg/m³</template>
            </el-input>
        </el-form-item>
    </el-form>
</template>

<script setup>
/**
 * @author Kardia_sfx
 * @date 07-03-2024 15:18
 */

import {stateAQI} from "@/components/public/AQIConsts";
import cityData from "@/assets/json/pca-code.json";
import {cityProps} from "@/components/public/CityConsts";
</script>

<style scoped>

</style>