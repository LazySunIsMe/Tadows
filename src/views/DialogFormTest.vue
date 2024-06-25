<template>
    <div>
        <!-- 其他页面内容 -->

        <el-button type="primary" @click="dialogVisible = true">打开对话框</el-button>

        <!-- 使用 DialogForm.vue 组件 -->
        <dialog-form
                :dialogVisible="dialogVisible"
                @submit="handleFormSubmit"
        ></dialog-form>
    </div>
</template>

<script>
import DialogForm from './DialogForm.vue'; // 导入对话框组件

export default {
    components: {
        DialogForm // 注册对话框组件
    },
    data() {
        return {
            dialogVisible: false
        };
    },
    methods: {
        handleFormSubmit(formData) {
            // 处理表单提交事件，接收子组件传递的数据
            console.log('提交的表单数据：', formData);
            // 可以在这里处理数据，比如发送到后端或者其他逻辑
            this.dialogVisible = false; // 关闭对话框
        }
    }
};
</script>

<style scoped>
/* 可以在这里定义页面的样式 */
</style>
