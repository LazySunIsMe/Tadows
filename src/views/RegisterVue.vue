<template>
    <div class="register-container">
        <el-card class="register-card">
            <h2 class="register-title">用户注册</h2>
            <el-text class="el-form-item__label">在此进行注册，标注“*”的为必填项</el-text>
            <el-form :model="registerForm" :rules="rules" ref="registerFormRef" label-width="100px" status-icon>
                <el-form-item label="登录方式" prop="username" class="form-item">
                    <el-input
                            v-model="registerForm.username"
                            :prefix-icon="prefixIcon"
                            placeholder="手机号/邮箱"
                            clearable
                            @input="updatePrefixIcon"
                    ></el-input>
                    <el-button
                        class="button-item"
                        type="primary"
                        @click="sendVerificationCode"
                        :disabled="!isInputValid"
                    >
                        发送验证码
                    </el-button>
                </el-form-item>
                <el-form-item label="密码" prop="password" class="form-item">
                    <el-input
                            type="password"
                            v-model="registerForm.password"
                            prefix-icon="lock"
                            placeholder="密码"
                            clearable
                            show-password
                    ></el-input>
                </el-form-item>
                <el-form-item label="确认密码" prop="confirmPassword" class="form-item">
                    <el-input
                            type="password"
                            v-model="registerForm.confirmPassword"
                            prefix-icon="lock"
                            placeholder="确认密码"
                            clearable
                            show-password
                    ></el-input>
                </el-form-item>
                <el-form-item label="昵称" prop="nickname" class="form-item">
                    <el-input
                            v-model="registerForm.nickname"
                            prefix-icon="avatar"
                            placeholder="昵称，默认为登录方式"
                            clearable
                    ></el-input>
                </el-form-item>
                <el-form-item label="年龄" prop="age" class="form-item">
                    <el-input
                            v-model="registerForm.age"
                            prefix-icon="postcard"
                            placeholder="年龄"
                            clearable
                    ></el-input>
                </el-form-item>
                <el-form-item label="性别" prop="gender" class="form-item">
                    <el-radio-group v-model="registerForm.gender">
                        <el-radio value="1">男</el-radio>
                        <el-radio value="0">女</el-radio>
                    </el-radio-group>
                </el-form-item>
                <el-form-item class="button-item">
                    <el-button type="success" @click="handleRegister">注册</el-button>
                    <el-button type="info" @click="goToLogin">返回登录</el-button>
                </el-form-item>
            </el-form>
        </el-card>
    </div>
</template>

<script setup>
import {reactive, toRefs, ref, onMounted, onUnmounted} from "vue";
import { useRouter } from "vue-router";
import '@/assets/css/RegisterForm.css';

const router = useRouter()

const registerForm = reactive({
    username: "",
    password: "",
    confirmPassword: "",
    nickname: "",
    age: "",
    gender: ""
})

const registerFormRef = ref(null)

const isInputValid =  ref(false)

const prefixIcon = ref('user')

const rules = {
    username: [
        { required: true, message: "请输入手机号或邮箱", trigger: "blur" },
        {
            validator: (rule, value, callback) => {
                // const phoneRegex = /^1\d{10}$/;
                const phoneRegex = /^1[3,4,5,7,8][0-9]{9}$/;
                // const emailRegex = /^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/;
                const emailRegex = /^\b[\w.%+-]+@[\w.-]+\.[a-zA-Z]{2,6}\b$/
                if (phoneRegex.test(value) || emailRegex.test(value)) {
                    isInputValid.value = true;
                    callback();
                } else {
                    isInputValid.value = false;
                    callback(new Error("请输入正确的手机号或邮箱"));
                }
            },
            trigger: "blur"
        }
    ],
    password: [
        { required: true, message: "请输入密码", trigger: "blur" },
        {
            pattern: /^(?!\d+$)(?![a-zA-Z]+$)(?![^\da-zA-Z]+$).{8,16}$/,
            message: "密码为8-16位，且需包含字母和数字",
            trigger: "blur"
        }
    ],
    confirmPassword: [
        { required: true, message: "请再次输入密码", trigger: "blur" },
        {
            validator: (rule, value, callback) => {
                if (value === registerForm.password) {
                    callback();
                } else {
                    callback(new Error("两次输入密码不一致"));
                }
            },
            trigger: "blur"
        }
    ]
}

const updatePrefixIcon = (value) => {
    const phoneRegex = /^1\d{10}$/;
    const emailRegex = /^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/;

    if (phoneRegex.test(value)) {
        prefixIcon.value = 'iphone'; // 手机图标
    } else if (emailRegex.test(value)) {
        prefixIcon.value = 'message'; // 信封图标
    } else {
        prefixIcon.value = 'user'; // 默认图标
    }
}

const sendVerificationCode = () => {
    // 发送验证码逻辑
    console.log("发送验证码至:", registerForm.username);
};

const handleRegisterSubmit = event => {
    // 检查是否按下了回车键
    if (event.key === 'Enter' || event.code === 'Enter') {
        // 执行表单提交操作
        handleRegister();
    }
};
// 在组件加载后添加事件监听
onMounted(() => {
    window.addEventListener('keyup', handleRegisterSubmit);
});

// 在组件销毁前移除事件监听
onUnmounted(() => {
    window.removeEventListener('keyup', handleRegisterSubmit);
});

function handleRegister() {
    registerFormRef.value.validate((valid) => {
        if (valid) {
            alert("注册成功！");
        } else {
            console.log("error submit!!");
            return false;
        }
    });
}

function goToLogin() {
    router.push({ path: "/login" });
}

</script>

<style scoped>
/* 样式可以根据需要进行添加 */
</style>
