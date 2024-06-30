<template>
    <el-dialog v-model="dialogDetailedVisible" title="监督信息详情" width="600">
        <el-form :model="stateAdmin.dialogForm">
            <!-- ID和姓名 -->
            <el-row :gutter="20">
                <el-col :span="12">
                    <el-form-item label="监督记录ID">
                        <el-input v-model="stateAdmin.dialogForm.id" placeholder="请输入ID"></el-input>
                    </el-form-item>
                </el-col>
                <el-col :span="12">
                    <el-form-item label="监督员姓名">
                        <el-input v-model="stateAdmin.dialogForm.member_name" placeholder="请输入姓名"></el-input>
                    </el-form-item>
                </el-col>
            </el-row>

            <!-- 网格地址和监督信息类型 -->
            <el-row :gutter="20">
                <el-col :span="12">
                    <el-form-item label="网格地址">
                        <el-cascader
                            :options="cityData"
                            v-model="stateAdmin.dialogForm.address"
                            :props="cityProps"
                            placeholder="请选择城市"
                        >
                        </el-cascader>
                    </el-form-item>
                </el-col>
                <el-col :span="12">
                    <el-form-item label="监督信息类型">
                        <el-select v-model="stateAdmin.dialogForm.type" placeholder="请选择监督信息类型">
                            <el-option label="监督请求" value="0"></el-option>
                            <el-option label="质询" value="1"></el-option>
                        </el-select>
                    </el-form-item>
                </el-col>
            </el-row>

            <!-- 状况发生时间和期望反馈时间 -->
            <el-row :gutter="20">
                <el-col :span="12">
                    <el-form-item label="状况发生时间">
                        <el-date-picker
                                v-model="stateAdmin.dialogForm.occurrent_time"
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
                                v-model="stateAdmin.dialogForm.expect_resoluted_time"
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
                        v-model="stateAdmin.dialogForm.description"
                        placeholder="请输入内容描述"
                        rows="6"
                ></el-input>
            </el-form-item>

            <!-- 附件预览 -->
            <el-form-item label="附件预览">
                <div class="attachment-preview">
                    <el-image
                            v-for="(file, index) in stateAdmin.dialogForm.attachments"
                            :key="index"
                            :src="file.url"
                            :preview-src-list="previewList"
                            fit="contain"
                            class="attachment-image"
                    ></el-image>
                </div>
            </el-form-item>
        </el-form>

        <div v-if="stateAdmin.dialogForm.status === 1 || stateAdmin.dialogForm.status === 2">
            <hr style="border-top: 1px solid #ccc; margin: 10px 0;">
            <DialogWorkFlow/>
        </div>

        <hr style="border-top: 1px solid #ccc; margin: 10px 0;">
        <template #footer>
            <div v-if="stateAdmin.dialogForm.status === 0 || _.isUndefined(stateAdmin.dialogForm.status)" class="dialog-footer">
                <el-button type="primary" @click="assign">指派</el-button>
                <el-button type="warning" @click="mark">标记</el-button>
                <el-button type="danger" @click="exit">退出</el-button>
            </div>
            <div v-if="stateAdmin.dialogForm.status === 1 || stateAdmin.dialogForm.status === 2" class="dialog-footer">
                <el-button type="primary" @click="assign">指派</el-button>
                <el-button type="warning" @click="mark">实测AQI数据详情</el-button>
                <el-button type="danger" @click="exit">退出</el-button>
            </div>
        </template>
    </el-dialog>

    <AdminRecordDialogDistribute
        ref=dialogDistributeRef
    />
</template>

<script setup>
import {ref} from "vue";
import AdminRecordDialogDistribute from "@/components/Admin/AdminRecordDialogDistribute.vue";
import cityData from '@/assets/json/pca-code.json'
import {cityProps, stateAdmin} from "@/components/Admin/AdminConsts";
import DialogWorkFlow from "@/components/DialogWorkFlow.vue";
import _ from "lodash";

/**
 * @author Kardia_sfx
 * @date 06-25-2024 11:26
 */

const dialogDetailedVisible = ref(false)
const dialogDistributeRef = ref(false)

const open = () => {
    console.log('Opening dialog with data:', stateAdmin.dialogForm);
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
    dialogDetailedVisible.value = false
}

function assign() {
    distribute()
}

function mark() {

}

</script>

<style scoped>

</style>