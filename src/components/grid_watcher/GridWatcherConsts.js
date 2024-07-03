
import {reactive} from "vue";

// 网格员侧边菜单
export const gridWatcherTitles = {
    '1': '首页',
    '2': '待处理检测任务',
    '3': '任务历史记录',
}

// 网格员路径
export const gridWatcherPaths = {
    '1': '/gridWatcher/home',
    '2': '/gridWatcher/quest',
    '3': '/gridWatcher/history',
}

//网格员搜索使用的对象
export const stateGridWatcher = reactive({
    questSearchForm: {
        manager_work_number: "",
        appointment_time: "",
        expect_resoluted_time: "",
        if_expedited:"",
    },
    historySearchForm: {
        manager_work_number: "",
        appointment_time: "",
        completion_time: "",
    },
    dialogForm: {},
    gridQuestSituation:"",
})