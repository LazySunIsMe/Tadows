import { createRouter, createWebHashHistory } from 'vue-router'
import HelloWorld from "@/components/HelloWorld.vue";
import AdminWorkOrder from "@/views/AdminWorkOrder.vue";
import LoginVue from "@/views/LoginVue.vue";
import RegisterVue from "@/views/RegisterVue.vue";
import CitySelection from "@/views/CitySelection.vue";

const routes = [
    {
        path: '/',
        name: 'home',
        component: HelloWorld
    },
    {
        path: '/adminWorkOrder',
        name: 'AdminWorkOrder',
        component: AdminWorkOrder
    },
    {
        path: '/login',
        name: 'LoginVue',
        component: LoginVue
    },
    {
        path: '/register',
        name: 'RegisterVue',
        component: RegisterVue
    },
    {
        path: '/citySelection',
        name: 'CitySelection',
        component: CitySelection
    }
]

const router = createRouter({
    history: createWebHashHistory(),
    routes
})

export default router