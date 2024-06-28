<template>
    <el-container>
        <el-aside class="el-aside-inside">
            <h4>工单查询</h4>
            <el-form  :model="stateAdmin.orderSearchForm" label-width="auto">
                <el-form-item label="监督员">
                    <el-input v-model="stateAdmin.orderSearchForm.member_name" placeholder="监督员姓名"/>
                </el-form-item>
                <el-form-item label="网格员">
                    <el-input v-model="stateAdmin.orderSearchForm.grid_watcher_number" placeholder="网格员工号"/>
                </el-form-item>
                <el-form-item label="网格地址">
                    <el-cascader
                            :options="cityData"
                            v-model="stateAdmin.orderSearchForm.address"
                            :props="cityProps"
                            placeholder="请选择城市"
                    >
                    </el-cascader>
                </el-form-item>
                <el-form-item label="记录提交时间">
                    <el-date-picker
                            v-model="stateAdmin.orderSearchForm.occurrent_time"
                            type="datetime"
                            placeholder="日期时间"
                            format="YYYY/MM/DD HH:mm:ss"
                            value-format="YYYY-MM-DD HH:mm:ss "
                    />
                </el-form-item>
                <el-form-item label="期待反馈时间">
                    <el-date-picker
                            v-model="stateAdmin.orderSearchForm.expect_resoluted_time"
                            type="datetime"
                            placeholder="日期时间"
                            format="YYYY/MM/DD HH:mm:ss"
                            value-format="YYYY-MM-DD HH:mm:ss"
                    />
                </el-form-item>
                <el-form-item label="状态">
                    <el-select v-model="stateAdmin.orderSearchForm.status" placeholder="请选择状态" style="width: 240px">
                        <el-option
                                v-for="item in statusOptions"
                                :key="item.value"
                                :label="item.label"
                                :value="item.value"
                        />
                    </el-select>
                </el-form-item>
                <el-form-item label="加急">
                    <el-radio-group v-model="stateAdmin.orderSearchForm.if_expedited">
                        <el-radio value="1">是</el-radio>
                        <el-radio value="0">否</el-radio>
                    </el-radio-group>
                </el-form-item>
                <el-form-item label="标记">
                    <el-radio-group v-model="stateAdmin.orderSearchForm.if_signed">
                        <el-radio value="1">是</el-radio>
                        <el-radio value="0">否</el-radio>
                    </el-radio-group>
                </el-form-item>
                <el-form-item label="仅查看我处理的">
                    <el-checkbox v-model="stateAdmin.orderSearchForm.if_checkSelf" />
                </el-form-item>

            </el-form>
            <el-button type="primary" @click="doSelect">筛选</el-button>
            <el-button type="warning" @click="reset">回原</el-button>
        </el-aside>
        <el-main class="el-main-inside">
            <el-scrollbar>
                <el-table :data="mainTableElement" border stripe style="width: 100%">
                    <el-table-column prop="member_name" label="监督员姓名" />
                    <el-table-column prop="grid_watcher_number" label="网格员工号" />
                    <el-table-column prop="address" label="网格地址">
                        <template #default="scope">
                            <span>{{ getCodeName(scope.row.address) }}</span>
                        </template>
                    </el-table-column>
                    <el-table-column prop="occurrent_time" label="记录提交时间" />
                    <el-table-column prop="expect_resoluted_time" label="期望解决时间" />
                    <el-table-column prop="status" label="状态" >
                        <template #default="scope">
                            <!-- 自定义显示内容 -->
                            <span>{{ getStatusLabel(scope.row.status) }}</span>
                        </template>
                    </el-table-column>
                    <el-table-column prop="if_expedited" label="加急" >
                        <template #default="scope">
                            <span>{{ scope.row.if_expedited === 1 ? "是" : "否" }}</span>
                        </template>
                    </el-table-column>
                    <el-table-column prop="if_expedited" label="标记" >
                        <template #default="scope">
                            <span>{{ scope.row.if_signed === 1 ? "是" : "否" }}</span>
                        </template>
                    </el-table-column>
                    <el-table-column fixed="right" label="操作">
                        <template #default="scope">
                            <el-button link type="primary" size="small" @click="checkDetail(scope.row)">
                                查看详情
                            </el-button>
                            <el-button link type="primary" size="small" @click="distribute">
                                指派
                            </el-button>
                        </template>
                    </el-table-column>
                </el-table>
            </el-scrollbar>
        </el-main>
    </el-container>

    <AdminRecordDialogDetailed
        ref=dialogDetailedRef
        :dialogForm="dialogForm"
    />

    <AdminRecordDialogDistribute
        ref=dialogDistributeRef
    />
</template>

<script setup>
/**
 * @author Kardia_sfx
 * @date 06-27-2024 10:07
 */
import {reactive, ref, toRefs} from "vue";
import AdminRecordDialogDistribute from "@/components/Admin/AdminRecordDialogDistribute.vue";
import AdminRecordDialogDetailed from "@/components/Admin/AdminRecordDialogDetailed.vue";
import cityData from '@/assets/json/pca-code.json'
import {cityProps,getCodeName,stateAdmin,statusOptions} from "@/components/Admin/AdminConsts";

const dialogDetailedRef = ref(false)
const dialogDistributeRef = ref(false)

const state = reactive({
    mainTableElement: {},
    dialogForm:{}
})

const { mainTableElement, dialogForm } = toRefs(state);

state.mainTableElement = ([
    {
        id:'1',
        member_name:'牛二',
        address:'210102',
        occurrent_time:'2024/06/26 20:04:55',
        expect_resoluted_time:'2024/07/26 20:04:55',
        if_expedited: 1,
        if_signed:0,
        if_checkSelf:0,
        grid_watcher_number:114514,
        status:0,
    },
    {
        id:'2',
        member_name:'张三',
        address:'210103',
        occurrent_time:'2024/06/25 20:04:55',
        expect_resoluted_time:'2024/08/25 20:04:55',
        if_expedited: 0,
        if_signed:1,
        if_checkSelf:0,
        grid_watcher_number:114514,
        status:0,
    },
    {
        id:'3',
        member_name:'李四',
        address:'210204',
        occurrent_time:'2024/06/24 20:04:55',
        expect_resoluted_time:'2024/07/24 20:04:55',
        if_expedited: 0,
        if_signed:0,
        if_checkSelf:1,
        grid_watcher_number:114514,
        status:2,
    },
    {
        id:'4',
        member_name:'牛二',
        address:'210205',
        occurrent_time:'2024/06/25 20:04:55',
        expect_resoluted_time:'2024/07/25 20:04:55',
        if_expedited: 0,
        if_signed:1,
        if_checkSelf:1,
        grid_watcher_number:114514,
        status:3,
    },
    {
        id:'5',
        member_name:'牛二',
        address:'210306',
        occurrent_time:'2024/06/23 20:04:55',
        expect_resoluted_time:'2024/08/23 20:04:55',
        if_expedited: 1,
        if_signed:0,
        if_checkSelf:0,
        grid_watcher_number:114514,
        status:1,
    },
])

const checkDetail = (row) => {
    state.dialogForm = { ...row }
    console.log(state.dialogForm)
    dialogDetailedRef.value.open()
}

const distribute = () => {
    dialogDistributeRef.value.open()
}

const getStatusLabel = (value) => {
    // 检查传入的 value
    // console.log('Value:', value);
    // 检查 statusOptions 的值
    // console.log('status:', statusOptions);

    // 根据 value 返回对应的状态文字
    const status = statusOptions.find(item => item.value === value);
    // console.log(status);
    return status ? status.label : '';
}

const doSelect = () => {
    console.log(stateAdmin.orderSearchForm)
}

const reset = () => {
    stateAdmin.orderSearchForm = {
        member_name:"",
        address:"",
        occurrent_time:"",
        expect_resoluted_time:"",
        if_expedited:"",
        if_signed:"",
        if_checkSelf:"",
        grid_watcher_number:"",
        status:"",
    }
}

</script>