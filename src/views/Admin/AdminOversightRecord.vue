<template lang="html">
        <el-container>
            <el-aside class="el-aside-inside">
                <h4>监督记录查询</h4>
                <el-form  :model="recordForm" label-width="auto">
                    <el-form-item label="监督员">
                        <el-input v-model="recordForm.member_name" placeholder="监督员姓名"/>
                    </el-form-item>
                    <el-form-item label="网格地址">
                        <el-cascader
                            :options="cityData"
                            v-model="recordForm.address"
                            :props="cityProps"
                            placeholder="请选择城市"
                        >
                        </el-cascader>
                    </el-form-item>
                    <el-form-item label="监督信息内容">
                        <el-input v-model="recordForm.description" placeholder="监督记录描述"/>
                    </el-form-item>
                    <el-form-item label="记录提交时间">
                        <el-date-picker
                            v-model="recordForm.occurrent_time"
                            type="datetime"
                            placeholder="日期时间"
                            format="YYYY/MM/DD HH:mm:ss"
                            value-format="YYYY-MM-DD HH:mm:ss "
                        />
                    </el-form-item>
                    <el-form-item label="期待反馈时间">
                        <el-date-picker
                            v-model="recordForm.expect_resoluted_time"
                            type="datetime"
                            placeholder="日期时间"
                            format="YYYY/MM/DD HH:mm:ss"
                            value-format="YYYY-MM-DD HH:mm:ss"
                        />
                    </el-form-item>
                    <el-form-item label="加急">
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
                    <el-table :data="mainTableElement" border stripe style="width: 100%">
                        <el-table-column prop="member_name" label="监督员姓名" />
                        <el-table-column prop="address" label="网格地址">
                            <template #default="scope">
                                <span>{{ getCodeName(scope.row.address) }}</span>
                            </template>
                        </el-table-column>
                        <el-table-column prop="description" show-overflow-tooltip label="记录描述" />
                        <el-table-column prop="occurrent_time" label="记录提交时间" />
                        <el-table-column prop="expect_resoluted_time" label="期望解决时间" />
                        <el-table-column prop="if_expedited" label="加急" width="80">
                            <template #default="scope">
                                <span>{{ scope.row.if_expedited === 1 ? "是" : "否" }}</span>
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
import { reactive, ref, toRefs} from "vue";
import cityData from '@/assets/json/pca-code.json'
import AdminRecordDialogDetailed from "@/components/Admin/AdminRecordDialogDetailed.vue";
import AdminRecordDialogDistribute from "@/components/Admin/AdminRecordDialogDistribute.vue";

const dialogDetailedRef = ref(false)
const dialogDistributeRef = ref(false)

const state = reactive({
    recordForm: {
        member_name:"",
        address:"",
        description:"",
        occurrent_time:"",
        expect_resoluted_time:"",
        if_expedited:"",
    },
    mainTableElement: {},
    dialogForm:{}
})

const { recordForm, mainTableElement, dialogForm } = toRefs(state);

const cityProps = {
    expandTrigger: 'hover',
    value:'code',   // 指定选项的 值 为选项对象的某个属性值
    label:'name',   // 指定选项 标签 为选项对象的某个属性值
    children:'children',    //指定选项的 子选项 为选项对象的某个属性值
    emitPath:false
}

state.mainTableElement = ref([
    {id:'1', member_name:'牛二', address:'210103', description: '任务1描述超级长超级长超级长的描述超级长真的很长', occurrent_time:'2024/06/26 20:04:55', expect_resoluted_time:'2024/07/26 20:04:55', if_expedited: 1 },
    {id:'2', member_name:'张三', address:['21','2101','210103'], description: '任务2描述', occurrent_time:'2024/06/25 20:04:55', expect_resoluted_time:'2024/08/25 20:04:55', if_expedited: 0 },
    {id:'3', member_name:'李四', address:'210202', description: '任务3描述', occurrent_time:'2024/06/24 20:04:55', expect_resoluted_time:'2024/07/24 20:04:55', if_expedited: 0 },
    {id:'4', member_name:'牛二', address:'210203', description: '任务4描述', occurrent_time:'2024/06/25 20:04:55', expect_resoluted_time:'2024/07/25 20:04:55', if_expedited: 0 },
    {id:'5', member_name:'牛二', description: '任务5描述', occurrent_time:'2024/06/23 20:04:55', expect_resoluted_time:'2024/08/23 20:04:55', if_expedited: 1 },
])

const codeToNameMapping = {};

cityData.forEach(province => {
    province.children.forEach( city => {
        city.children.forEach( area => {
            const fullName = `${province.name}-${city.name}-${area.name}`;
            codeToNameMapping[area.code] = { code: area.code, name: fullName }
        })
    })
})

const getCodeName = (code) => {
    return codeToNameMapping[code] ? codeToNameMapping[code].name : '未知';
};

const reset = () => {
    state.recordForm = {
        member_name:"",
        address: "",
        description: "",
        occurrent_time: "",
        expect_resoluted_time: "",
        if_expedited: "",
    };
};

function doSelect() {
    console.log(state.recordForm)
}

const checkDetail = (row) => {
    state.dialogForm = { ...row }
    console.log("selected row:", state.dialogForm)
    dialogDetailedRef.value.open()
}

const distribute = () => {
    dialogDistributeRef.value.open()
}

</script>

<style scoped>

.el-aside-inside {
    width: 300px;
    border-right: 1px solid #000000; /* 设置右边框为灰色，可以根据需要调整颜色和宽度 */
    padding-right: 15px; /* 可选：增加右边距以增强分隔感 */
}

.el-main-inside {
    background-color: #FF8800;
}

</style>