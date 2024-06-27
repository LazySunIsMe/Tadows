import { createRouter, createWebHashHistory } from 'vue-router'
import HelloWorld from "@/components/HelloWorld.vue";
import AdminOversightRecord from "@/views/Admin/AdminOversightRecord.vue";
import Admin from '@/components/Admin/Admin.vue';
import LoginVue from "@/views/LoginVue.vue";
import RegisterVue from "@/views/RegisterVue.vue";
import CitySelection from "@/views/CitySelection.vue";
import AdminWorkOrder from "@/views/Admin/AdminWorkOrder.vue";

const routes = [
    {
        path: '/',
        name: 'home',
        component: HelloWorld
    },
    {
        path: '/admin',
        name: 'Admin',
        component: Admin,
        children: [
            {
                path: '/admin/oversightRecord',
                name: 'AdminOversightRecord',
                component: AdminOversightRecord
            },
            {
                path: '/admin/workOrder',
                name: 'AdminWorkOrder',
                component: AdminWorkOrder
            }
        ]
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
    },
]

const router = createRouter({
    history: createWebHashHistory(),
    routes
})

export default router