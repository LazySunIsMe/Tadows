<template>
    <el-dialog
            :visible="dialogVisible"
            @update:visible="dialogVisible = $event"
            title="对话框标题"
            width="30%"
            @close="handleClose"
    >
        <el-form ref="form" :model="formData" label-width="80px">
            <el-form-item label="输入框1">
                <el-input v-model="formData.input1"></el-input>
            </el-form-item>
            <!-- 其他表单项 -->
        </el-form>
        <span slot="footer" class="dialog-footer">
      <el-button @click="dialogVisible = false">取 消</el-button>
      <el-button type="primary" @click="handleSubmit">确 定</el-button>
    </span>
    </el-dialog>
</template>

<script>
import { ref } from 'vue';

export default {
    emits: ['submit'], // 定义自定义事件
    props: {
        dialogVisible: Boolean // 接收父组件传递的对话框显示状态
    },
    setup(props, { emit }) {
        const formData = ref({
            input1: ''
            // 其他表单数据
        });

        function handleClose() {
            // 处理对话框关闭时的逻辑
        }

        function handleSubmit() {
            // 处理表单提交的逻辑，可以通过 formData.value 获取表单数据
            emit('submit', formData.value); // 触发 submit 事件，将数据传递给父组件
            handleClose(); // 关闭对话框
        }

        return {
            formData,
            handleClose,
            handleSubmit
        };
    }
};
</script>

<style scoped>
/* 可以在这里定义对话框的样式 */
</style>
