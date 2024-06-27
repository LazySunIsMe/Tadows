<template>
    <el-dialog v-model="dialogDetailedVisible" title="监督信息详情" width="600">
        <div>
        <el-form :model="dialogForm">
            <!-- ID和姓名 -->
            <el-row :gutter="20">
                <el-col :span="12">
                    <el-form-item label="ID">
                        <el-input v-model="dialogForm.id" placeholder="请输入ID"></el-input>
                    </el-form-item>
                </el-col>
                <el-col :span="12">
                    <el-form-item label="姓名">
                        <el-input v-model="dialogForm.member_name" placeholder="请输入姓名"></el-input>
                    </el-form-item>
                </el-col>
            </el-row>

            <!-- 网格地址和监督信息类型 -->
            <el-row :gutter="20">
                <el-col :span="12">
                    <el-form-item label="网格地址">
                        <el-cascader
                            :options="cityData"
                            v-model="dialogForm.address"
                            :props="cityProps"
                            placeholder="请选择城市"
                        >
                        </el-cascader>
                    </el-form-item>
                </el-col>
                <el-col :span="12">
                    <el-form-item label="监督信息类型">
                        <el-select v-model="dialogForm.type" placeholder="请选择监督信息类型">
                            <el-option label="类型1" value="1"></el-option>
                            <el-option label="类型2" value="2"></el-option>
                        </el-select>
                    </el-form-item>
                </el-col>
            </el-row>

            <!-- 状况发生时间和期望反馈时间 -->
            <el-row :gutter="20">
                <el-col :span="12">
                    <el-form-item label="状况发生时间">
                        <el-date-picker
                                v-model="dialogForm.occurrent_time"
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
                                v-model="dialogForm.expect_resoluted_time"
                                type="datetime"
                                placeholder="选择日期时间"
                                style="width: 100%;"
                                format="YYYY/MM/DD HH:mm:ss"
                                value-format="YYYY-MM-DD HH:mm:ss"
                        ></el-date-picker>
                    </el-form-item>
                </el-col>
            </el-row>

            <!-- 内容描述 -->
            <el-form-item label="内容描述">
                <el-input
                        type="textarea"
                        v-model="dialogForm.description"
                        placeholder="请输入内容描述"
                        rows="6"
                ></el-input>
            </el-form-item>

            <!-- 附件预览 -->
            <el-form-item label="附件预览">
                <div class="attachment-preview">
                    <el-image
                            v-for="(file, index) in dialogForm.attachments"
                            :key="index"
                            :src="file.url"
                            :preview-src-list="previewList"
                            fit="contain"
                            class="attachment-image"
                    ></el-image>
                </div>
            </el-form-item>

            <!-- 按钮 -->
            <el-form-item>
                <el-button type="primary" @click="assign">指派</el-button>
                <el-button type="warning" @click="mark">标记</el-button>
                <el-button type="danger" @click="exit">退出</el-button>
            </el-form-item>
        </el-form>
        </div>
        <template #footer>
            <div class="dialog-footer">
                <el-button @click="close">Cancel</el-button>
                <el-button type="primary" @click="close">Confirm</el-button>
            </div>
        </template>
    </el-dialog>

    <AdminRecordDialogDistribute
        ref=dialogDistributeRef
    />
</template>

<script setup>
import {reactive, ref, toRefs} from "vue";
import AdminRecordDialogDistribute from "@/components/Admin/AdminRecordDialogDistribute.vue";
import cityData from '@/assets/json/pca-code.json'

/**
 * @author Kardia_sfx
 * @date 06-25-2024 11:26
 */

const dialogDetailedVisible = ref(false)
const dialogDistributeRef = ref(false)

const props = defineProps({
    dialogForm: Object
});

const state = reactive({
    dialogFormEmpty: {
        id:"",
        member_name:"",
        address: "",
        type:"",
        description: "",
        occurrent_time: "",
        expect_resoluted_time: "",
        if_expedited: "",
        attachments:[],
    },
})

// 采用toRefs将reactive状态解构出来
const { dialogFormEmpty } = toRefs(state)
const { dialogForm } = toRefs(props)

const cityProps = {
    expandTrigger: 'hover',
    value:'code',   // 指定选项的 值 为选项对象的某个属性值
    label:'name',   // 指定选项 标签 为选项对象的某个属性值
    children:'children',    //指定选项的 子选项 为选项对象的某个属性值
    emitPath:false
}

const open = () => {
    console.log('Opening dialog with data:', props.dialogForm);
    dialogDetailedVisible.value = true
}

const close = () => {
    dialogDetailedVisible.value = false
}

const distribute = () => {
    dialogDistributeRef.value.open()
}

defineExpose({
    open,
    close,
})

function exit() {
    // 退出逻辑
}

function assign() {
    distribute()
}

function mark() {

}

</script>

<style scoped>

</style>