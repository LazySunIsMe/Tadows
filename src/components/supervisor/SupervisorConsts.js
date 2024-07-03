
import {reactive} from "vue";

// 监督员侧边菜单
export const supervisorTitles = {
    '1': '首页',
    '2': '新增监督信息',
    '3': '监督历史记录',
}

// 监督者路径
export const supervisorPaths = {
    '1': '/supervisor/home',
    '2': '/supervisor/add',
    '3': '/supervisor/history',
}

// 监督者搜索使用的对象
export const stateSupervisor = reactive({
    orderSearchForm: {
        occurent_time:"",
        expect_resoluted_time:"",
        description:"",
        status:"",
    },
    dialogForm:{},
})