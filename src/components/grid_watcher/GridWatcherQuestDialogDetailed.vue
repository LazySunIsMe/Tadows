<template>
    <el-dialog v-model="dialogDetailedVisible" title="检测任务详情" width="600">
        <AQIForm/>

        <el-form-item label="网格员的回复">
            <el-input
                    v-model="stateGridWatcher.dialogForm.grid_watcher_reply"
                    type="textarea"
                    placeholder="输入您的回复"
                    :autosize="{ minRows: 6, maxRows: 6 }"
            />
        </el-form-item>

        <template #footer>
            <div v-if="stateGridWatcher.gridQuestSituation === '1'">
                <hr class="dividing-line">
                <el-button type="success" @click="">确认录入</el-button>
                <el-button type="primary" @click="">保存并退出</el-button>
                <el-button type="danger" @click="">取消填写</el-button>
            </div>
            <div v-if="stateGridWatcher.gridQuestSituation === '2'">
                <hr class="dividing-line">
                <el-button type="primary" @click="">确认更改</el-button>
                <el-button type="danger" @click="">取消更改</el-button>
            </div>
        </template>
    </el-dialog>
</template>

<script setup>
/**
 * @author Kardia_sfx
 * @date 07-03-2024 14:56
 */
import {stateGridWatcher} from "@/components/grid_watcher/GridWatcherConsts";
import {ref} from "vue";
import AQIForm from "@/components/public/AQIForm.vue";

const dialogDetailedVisible = ref(false)

const open = () => {
    console.log('Opening dialog with data:', stateGridWatcher.dialogForm)
    dialogDetailedVisible.value = true
}

const close = () => {
    dialogDetailedVisible.value = false
}

defineExpose({
    open,
    close,
})

</script>

<style scoped>

</style>