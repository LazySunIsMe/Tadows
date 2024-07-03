
import {reactive} from "vue";

// 管理员侧边菜单
export const adminTitles = {
    '1': '首页',
    '2': '待处理监督信息',
    '3': '监督信息历史',
    '4': 'AQI实测数据',
    '5': 'AQI数据大屏',
    '6': '公告信息管理',
    '7': '人员管理审核',
}

//管理员路径
export const adminPaths = {
    '1': '/admin/home',
    '2': '/admin/quest',
    '3': '/admin/history',
    '4': '/admin/aqiRecord',
    '5': '/admin/home',
    '6': '/admin/notice',
    '7': '/admin/user',
}



// 用户的四种角色
export const userRole = [
    {
        value: 1,
        label: '决策者',
    },
    {
        value: 2,
        label: '公共监督员',
    },
    {
        value: 3,
        label: '网格员',
    },
    {
        value: 4,
        label: '系统管理员',
    },
]

// 管理员搜索使用的对象
export const stateAdmin = reactive({
    questSearchForm: {
        // member_name:"",
        address:"",
        description:"",
        occurrent_time:"",
        expect_resoluted_time:"",
        if_expedited:"",
    },
    historySearchForm: {
        member_name:"",
        address:"",
        occurrent_time:"",
        expect_resoluted_time:"",
        if_expedited:"",
        if_signed:"",
        if_checkSelf:false,
        grid_watcher_number:"",
        status:"",
    },
    aqiSearchForm: {
        record_time:"",
        address:"",
        aqi_value:"",
        aqi_level:"",
    },
    noticeSearchForm: {
        publish_time:"",
        title_vague:"",
        type:"",
        if_important:"",
    },
    userSearchForm: {
        user_nickname:"",
        if_active:"",
        user_role:"",
        user_work_number:"",
    },
    dialogForm: {}
})