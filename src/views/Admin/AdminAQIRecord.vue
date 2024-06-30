<template>
    <el-container>
        <el-aside class="el-aside-inside">
            <h4>AQI数据查询</h4>
            <el-form  :model="stateAdmin.aqiSearchForm" label-width="auto">
                <el-form-item label="数据记录时间">
<!--                    <el-date-picker-->
<!--                            v-model="stateAdmin.aqiSearchForm.record_time"-->
<!--                            type="datetime"-->
<!--                            placeholder="日期时间"-->
<!--                            format="YYYY/MM/DD HH:mm:ss"-->
<!--                            value-format="YYYY-MM-DD HH:mm:ss "-->
<!--                    />-->
<!--                    date_time_range类型返回长度为2的日期时间数组-->
                    <el-date-picker
                            v-model="stateAdmin.aqiSearchForm.record_time"
                            type="datetimerange"
                            range-separator="To"
                            start-placeholder="Start date"
                            end-placeholder="End date"
                            format="YYYY/MM/DD HH:mm:ss"
                            value-format="YYYY-MM-DD HH:mm:ss "
                    />
                </el-form-item>
                <el-form-item label="网格地址">
                    <el-cascader
                            :options="cityData"
                            v-model="stateAdmin.aqiSearchForm.address"
                            :props="cityProps"
                            placeholder="请选择城市"
                    ></el-cascader>
                </el-form-item>
                <el-form-item label="AQI数值">
<!--                    <el-input v-model="stateAdmin.aqiSearchForm.aqi_value" placeholder="小黑子树枝666"/>-->
                    <el-input v-model="stateAdmin.aqiSearchForm.aqi_value" placeholder="输入AQI数值"/>
                </el-form-item>
                <el-form-item label="空气质量等级">
                    <el-select v-model="stateAdmin.aqiSearchForm.aqi_level" placeholder="请选择等级">
                        <el-option
                                v-for="item in aqiLevels"
                                :key="item.value"
                                :label="item.label"
                                :value="item.value"
                        />
                    </el-select>
                </el-form-item>
            </el-form>
            <el-button type="primary" @click="doSelect">筛选</el-button>
            <el-button type="warning" @click="reset">回原</el-button>
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
 * @date 06-30-2024 12:21
 */
import {aqiLevels, cityProps, stateAdmin} from "@/components/Admin/AdminConsts";
import cityData from "@/assets/json/pca-code.json";

const doSelect = () => {
    console.log(stateAdmin.aqiSearchForm)
}

const reset = () => {
    stateAdmin.aqiSearchForm = {
        record_time:"",
        address:"",
        aqi_value:"",
        aqi_level:"",
    };
};
</script>

<style scoped>

</style>