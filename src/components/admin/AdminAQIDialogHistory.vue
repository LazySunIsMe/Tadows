<template>
    <el-dialog v-model="dialogHistoryVisible" title="网格AQI历史数据" width="650">
        <el-form :model="stateAdmin.dialogForm">
            <el-row :gutter="20">
                <el-col :span="12">
                    <el-form-item label="网格地址">
                        <el-cascader
                            :options="cityData"
                            v-model="stateAdmin.dialogForm.address"
                            :props="cityProps"
                            placeholder="请选择城市"/>
                    </el-form-item>
                </el-col>
                <el-col :span="10">
                    <el-form-item label="记录时间">
                        <el-date-picker
                            v-model="stateAdmin.dialogForm.record_time"
                            type="datetimerange"
                            range-separator="到"
                            start-placeholder="开始时间"
                            end-placeholder="结束时间"
                            format="YYYY/MM/DD HH:mm:ss"
                            value-format="YYYY-MM-DD HH:mm:ss "/>
                    </el-form-item>
                </el-col>
            </el-row>
        </el-form>
        <el-scrollbar>
<!--            <el-table :data="dialogElement" stripe style="width: 100%">-->

<!--            </el-table>-->
            <hr class="dividing-line">
            表格占位
            <hr class="dividing-line">
        </el-scrollbar>
        <hr class="dividing-line">
        图表占位（echarts）
        <hr class="dividing-line">
    </el-dialog>
</template>

<script setup>
import {reactive, ref, toRefs} from "vue";
import {stateAdmin} from "@/components/admin/AdminConsts";
import {cityProps} from "@/components/public/CityConsts";
import cityData from "@/assets/json/pca-code.json";

/**
 * @author Kardia_sfx
 * @date 07-01-2024 11:50
 */

const dialogHistoryVisible = ref(false)

const state = reactive({
    dialogElement: {},
})

const { dialogElement } = toRefs(state)

const open = () => {
    console.log('Opening dialog with data:', stateAdmin.dialogForm);
    dialogHistoryVisible.value = true
}

const close = () => {
    dialogHistoryVisible.value = false
}

defineExpose({
    open,
    close,
})

</script>

<style scoped>

</style>