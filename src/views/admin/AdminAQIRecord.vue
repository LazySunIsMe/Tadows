<template>
    <el-container>
        <el-aside class="el-aside-inside">
            <h4>AQI数据查询</h4>
            <el-form  :model="stateAdmin.aqiSearchForm" label-width="auto">
                <el-form-item label="记录时间">
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
                            range-separator="到"
                            start-placeholder="开始时间"
                            end-placeholder="结束时间"
                            format="YYYY/MM/DD HH:mm:ss"
                            value-format="YYYY-MM-DD HH:mm:ss "/>
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
            <el-button type="warning" @click="checkDetail">checkDetail</el-button>
        </el-aside>
        <el-main class="el-main-inside">
            <el-scrollbar>

            </el-scrollbar>
        </el-main>
    </el-container>

    <AdminAQIDialogDetailed
        ref=dialogDetailedRef
    />
</template>

<script setup>
/**
 * @author Kardia_sfx
 * @date 06-30-2024 12:21
 */
import {stateAdmin} from "@/components/admin/AdminConsts";
import {cityProps} from "@/components/public/CityConsts";
import cityData from "@/assets/json/pca-code.json";
import AdminAQIDialogDetailed from "@/components/admin/AdminAQIDialogDetailed.vue";
import {ref} from "vue";
import {aqiLevels} from "@/components/public/AQIConsts";

const dialogDetailedRef = ref(false)

const checkDetail = () => {
    // row
    // stateAdmin.dialogForm = { ...row }
    // console.log("selected row:", stateAdmin.dialogForm)
    dialogDetailedRef.value.open()
}

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