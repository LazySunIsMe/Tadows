<template>
    <el-dialog :model-value="visible" v-model="dialogVisible" title="监督信息详情" width="600" @close="handleClose">
<!--        奇了个大怪啊，录个视频先-->
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
                        <el-input v-model="dialogForm.name" placeholder="请输入姓名"></el-input>
                    </el-form-item>
                </el-col>
            </el-row>

            <!-- 网格地址和监督信息类型 -->
            <el-row :gutter="20">
                <el-col :span="12">
                    <el-form-item label="网格地址">
                        <el-select v-model="dialogForm.address" placeholder="请选择网格地址">
                            <el-cascader
                                    size="large"
                                    :options="provinceAndCityData"
                                    :model="selectedOptionsDialog"
                                    :props="cityProps"
                                    placeholder="请选择城市"
                            >
                            </el-cascader>
                        </el-select>
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
        <template #footer>
            <div class="dialog-footer">
                <el-button @click="close">Cancel</el-button>
                <el-button type="primary" @click="close1">Confirm</el-button>
            </div>
        </template>
    </el-dialog>
</template>

<script setup>
import {reactive, ref, toRefs, watch} from "vue";
import { provinceAndCityData } from "element-china-area-data";

/**
 * @author Kardia_sfx
 * @date 06-25-2024 11:26
 */

const dialogVisible = ref(false)

const open1 = () => {
    dialogVisible.value = true
}

const close1 = () => {
    dialogVisible.value = false
}

// const visible = ref(false)
const props = defineProps({
    visible: Boolean,
})

const emit = defineEmits(['update:visible'])

const internalVisible = ref(props.visible)

watch(() => props.visible, (newVal) => {
    internalVisible.value = newVal;
})

const state = reactive({
    dialogForm: {
        address: "",
        description: "",
        occurrent_time: "",
        expect_resoluted_time: "",
        if_expedited: "",
    },
    selectedOptionsDialog: [],
})

const open = () => {
    console.log("对话框的open函数")
    internalVisible.value = true
    emit('update:visible',true)
}

const close = () => {
    console.log("close function")
    internalVisible.value = false
    emit('update:visible', false)
}

const handleClose = () => {
    emit('update:visible', false)
}

const cityProps = {
    expandTrigger: 'hover'
}

defineExpose({
    open,
    close,
    open1,
    close1,
})

function exit() {
    // 退出逻辑
}

function assign() {

}

function mark() {

}

// 采用toRefs将reactive状态解构出来
const { dialogForm, selectedOptionsDialog } = toRefs(state);

</script>

<style scoped>

</style>