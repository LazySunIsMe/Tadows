import { createApp } from 'vue'
import App from './App.vue'
import ElementPlus from 'element-plus'
import 'element-plus/theme-chalk/index.css'
import router from './router'
import * as ElIconModules from '@element-plus/icons'

const app = createApp(App)



//使用路由守卫实现登录的权限验证
router.beforeEach(function(to,from,next){
    // let doctor = sessionStorage.getItem('doctor');
    //除了登录、注册之外，都需要判断是否登录
    // if(!(to.path==='/'||to.path==='/login')){
    //     if(doctor==null){
    //         router.push('/login');
    //     }
    // }
    next();
});

for(let iconName in ElIconModules) {
    app.component(iconName, ElIconModules[iconName]);
}

app.use(router).use(ElementPlus).mount('#app')


