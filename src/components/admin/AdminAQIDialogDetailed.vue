<template>
    <el-dialog v-model="dialogDetailedVisible" title="网格AQI详情" width="600">
        <AQIForm/>

        <div style="text-align: left">经过计算，此区域的AQI为{{  }}</div>

        <template #footer>
            <hr class="dividing-line">
            <el-button type="primary" @click="history">查看详细历史数据</el-button>
            <el-button type="danger" @click="">删除</el-button>
            <el-button type="warning" @click="">重测</el-button>
        </template>

    </el-dialog>

    <AdminAQIDialogHistory
        ref=dialogHistoryRef
    />
</template>

<script setup>
import {ref} from "vue";
import AdminAQIDialogHistory from "@/components/admin/AdminAQIDialogHistory.vue";
import {stateAdmin} from "@/components/admin/AdminConsts";
import AQIForm from "@/components/public/AQIForm.vue";

/**
 * @author Kardia_sfx
 * @date 07-01-2024 11:50
 */

const dialogDetailedVisible = ref(false)
const dialogHistoryRef = ref(false)

const open = () => {
    console.log('Opening dialog with data:', stateAdmin.dialogForm);
    dialogDetailedVisible.value = true
}

const close = () => {
    dialogDetailedVisible.value = false
}

const history = () => {
    dialogHistoryRef.value.open()
}

defineExpose({
    open,
    close,
})

</script>

<style scoped>

</style>