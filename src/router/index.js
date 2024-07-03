import { createRouter, createWebHashHistory } from 'vue-router'
import HelloWorld from "@/components/HelloWorld.vue";
import AdminQuest from "@/views/admin/AdminQuest.vue";
import Admin from '@/components/admin/Admin.vue';
import LoginVue from "@/views/LoginVue.vue";
import RegisterVue from "@/views/RegisterVue.vue";
import AdminHistory from "@/views/admin/AdminHistory.vue";
import AdminAQIRecord from "@/views/admin/AdminAQIRecord.vue";
import AdminNotice from "@/views/admin/AdminNotice.vue";
import AdminUser from "@/views/admin/AdminUser.vue";
import Supervisor from "@/components/supervisor/Supervisor.vue";
import SupervisorAdd from "@/views/supervisor/SupervisorAdd.vue";
import SupervisorHistory from "@/views/supervisor/SupervisorHistory.vue";
import HomePage from "@/views/HomePage.vue";
import GridWatcher from "@/components/grid_watcher/GridWatcher.vue";
import {adminPaths} from "@/components/admin/AdminConsts";
import {supervisorPaths} from "@/components/supervisor/SupervisorConsts";
import {gridWatcherPaths} from "@/components/grid_watcher/GridWatcherConsts";
import GridWatcherQuest from "@/views/grid_watcher/GridWatcherQuest.vue";
import GridWatcherHistory from "@/views/grid_watcher/GridWatcherHistory.vue";

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
                path: adminPaths[1],
                name: 'AdminHomePage',
                component: HomePage
            },
            {
                path: adminPaths[2],
                name: 'AdminQuest',
                component: AdminQuest
            },
            {
                path: adminPaths[3],
                name: 'AdminHistory',
                component: AdminHistory
            },
            {
                path: adminPaths[4],
                name: 'AdminAQIRecord',
                component: AdminAQIRecord
            },
            {
                path: adminPaths[6],
                name: 'AdminNotice',
                component: AdminNotice
            },
            {
                path: adminPaths[7],
                name: 'AdminUser',
                component: AdminUser
            },
        ]
    },
    {
        path: '/supervisor',
        name: 'Supervisor',
        component: Supervisor,
        children: [
            {
                path: supervisorPaths[1],
                name: 'SupervisorHomePage',
                component: HomePage
            },
            {
                path: supervisorPaths[2],
                name: 'SupervisorAdd',
                component: SupervisorAdd
            },
            {
                path: supervisorPaths[3],
                name: 'SupervisorHistory',
                component: SupervisorHistory
            },
        ]
    },
    {
        path: '/gridWatcher',
        name: 'GridWatcher',
        component: GridWatcher,
        children: [
            {
                path: gridWatcherPaths[1],
                name: 'GridWatcherHome',
                component: HomePage
            },
            {
                path: gridWatcherPaths[2],
                name: 'GridWatcherQuest',
                component: GridWatcherQuest
            },
            {
                path: gridWatcherPaths[3],
                name: 'GridWatcherHistory',
                component: GridWatcherHistory
            },
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
]

const router = createRouter({
    history: createWebHashHistory(),
    routes
})

export default router