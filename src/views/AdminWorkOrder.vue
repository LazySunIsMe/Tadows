<template lang="html">
    <Admin>
        <el-container>
            <el-aside class="el-aside-inside">
                <h4>监督记录查询</h4>
                <el-form  :model="recordForm" label-width="auto">
                    <el-form-item label="网格地址">
                        <el-cascader
                            size="large"
                            :options="provinceAndCityData"
                            :model="selectedOptionsAside"
                            :props="cityProps"
                            placeholder="请选择城市"
                        >
                        </el-cascader>
                    </el-form-item>
                    <el-form-item label="监督信息内容">
                        <el-input v-model="recordForm.description" placeholder="监督信息"/>
                    </el-form-item>
                    <el-form-item label="记录提交时间">
                        <el-date-picker
                            v-model="recordForm.occurrent_time"
                            type="date"
                            placeholder="日期"
                            format="YYYY/MM/DD"
                            value-format="YYYY-MM-DD"
                        />
                    </el-form-item>
                    <el-form-item label="期待反馈时间">
                        <el-date-picker
                            v-model="recordForm.expect_resoluted_time"
                            type="date"
                            placeholder="日期"
                            format="YYYY/MM/DD"
                            value-format="YYYY-MM-DD"
                        />
                    </el-form-item>
                    <el-form-item label="是否加急">
                        <el-radio-group v-model="recordForm.if_expedited">
                            <el-radio value="1">是</el-radio>
                            <el-radio value="0">否</el-radio>
                        </el-radio-group>
                    </el-form-item>
                </el-form>
                <el-button type="primary" @click="doSelect">筛选</el-button>
                <el-button type="warning" @click="reset">回原</el-button>
            </el-aside>
            <el-main class="el-main-inside">
                <el-scrollbar>
                    <el-button plain @click="checkDetail">
                        打开，打开，一定要打开
                    </el-button>
                    <el-button plain @click="checkDetail2">
                        打开，打开，一定要打开2
                    </el-button>
<!--                              <el-table :data="mainTableElement" stripe>-->
<!--                                  <el-table-column prop="" label="" width=""/>-->
<!--                              </el-table>-->
                </el-scrollbar>
            </el-main>
        </el-container>
    </Admin>

    <AdminRecordDialog
        v-model:visible="visible"
        ref="recordDialogRef"
        @close="closeDialog(false)"
    />
</template>

<script setup>
import { reactive, ref } from "vue";
import { provinceAndCityData } from 'element-china-area-data'
import laoshuyao from '@/assets/QQ20240614142245.jpg';
import {Clock, DataBoard, DataLine, Document, Edit, House, Setting, User, WindPower} from "@element-plus/icons";
import Admin from '@/components/Admin/Admin.vue';
import AdminRecordDialog from "@/components/Admin/AdminRecordDialog.vue";

const recordDialogRef = ref(null)
const visible = ref(false)
let recordForm = reactive({
    address:"",
    description:"",
    occurrent_time:"",
    expect_resoluted_time:"",
    if_expedited:"",
})
const selectedOptionsAside = ref([])
const mainTableElement = ref({})

const cityProps = {
    expandTrigger: 'hover'
}

function doSelect() {

}

const checkDetail = () => {
    recordDialogRef.value.open()
}

function checkDetail2() {
    visible.value = true;
}

const closeDialog = (val) => {
    visible.value = val;
}

const reset = () => {
    recordForm = {
        address: "",
        description: "",
        occurrent_time: "",
        expect_resoluted_time: "",
        if_expedited: "",
    };
};

</script>

<style scoped>

.el-aside-inside {
    width: 260px;
    border-right: 1px solid #000000; /* 设置右边框为灰色，可以根据需要调整颜色和宽度 */
    padding-right: 15px; /* 可选：增加右边距以增强分隔感 */
}

.el-main-inside {
    background-color: #FF8800;
}

</style>