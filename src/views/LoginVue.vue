<template>
    <div class="login-container">
        <el-card class="login-card">
            <h2 class="login-title">用户登录</h2>
            <el-form :model="loginForm" :rules="rules" ref="loginFormRef" label-width="80px">
                <el-form-item label="用户名" prop="username" class="form-item">
                    <el-input
                        v-model="loginForm.username"
                        prefix-icon="user"
                        placeholder="手机号/邮箱"
                        clearable
                    ></el-input>
                </el-form-item>
                <el-form-item label="密&emsp;码" prop="password" class="form-item">
                    <el-input
                        type="password"
                        v-model="loginForm.password"
                        prefix-icon="lock"
                        placeholder="密码"
                        clearable
                        show-password
                    ></el-input>
                </el-form-item>
                <el-form-item class="button-item">
                    <el-button type="success" @click="handleLogin">登录</el-button>
                    <el-button type="primary" @click="goToRegister">注册</el-button>
                </el-form-item>
            </el-form>
        </el-card>
    </div>
</template>

<script setup>
import {reactive, ref, onMounted, onUnmounted} from "vue";
import { useRouter } from "vue-router";
import '@/assets/css/LoginForm.css';

const router = useRouter();

const loginForm = reactive({
        username: '',
        password: ''
});

const loginFormRef = ref(null);

const rules = {
    username: [
        { required:true, message: '请输入用户名', trigger: 'blur' },
        {
            validator: (rule, value, callback) => {
                const phoneRegex = /^1\d{10}$/;
                const emailRegex = /^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/;
                if (phoneRegex.test(value) || emailRegex.test(value)) {
                    callback();
                } else {
                    callback(new Error('请输入正确的手机号或邮箱'));
                }
            },
            trigger: 'blur'
        }
    ],
    password: [
        { required:true, message: '请输入密码', trigger: 'blur' }
    ]
}

const handleLoginSubmit = event => {
    // 检查是否按下了回车键
    if (event.key === 'Enter' || event.code === 'Enter') {
        // 执行表单提交操作
        handleLogin();
    }
};
// 在组件加载后添加事件监听
onMounted(() => {
    window.addEventListener('keyup', handleLoginSubmit);
});

// 在组件销毁前移除事件监听
onUnmounted(() => {
    window.removeEventListener('keyup', handleLoginSubmit);
});

function handleLogin()  {
    loginFormRef.value.validate((valid) => {
        if (valid) {
            alert('登录成功！');
        } else {
            console.log('error submit!!');
            return false;
        }
    });
}

function goToRegister() {
    router.push({path:"/register"});
}

</script>

<style scoped>

</style>