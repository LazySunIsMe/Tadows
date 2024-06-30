
import {reactive} from "vue";
import cityData from "@/assets/json/pca-code.json";

// 管理员侧边菜单
export const adminTitles = {
    '1': '首页',
    '2': '待处理监督信息',
    '3': '监督信息历史',
    '4': 'AQI实测数据',
    '5': 'AQI数据大屏',
    '6': '公告信息管理',
    '7': '人员管理审核'
};

// 工单的四个状态
export const orderStatus = [
    {
        value: 0,
        label: '已提交',
    },
    {
        value: 1,
        label: '已指派',
    },
    {
        value: 2,
        label: '已反馈',
    },
    {
        value: 3,
        label: '已取消',
    },
]

// AQI的六个评级
export const aqiLevels = [
    {
        value: 1,
        label: '优',
    },
    {
        value: 2,
        label: '良',
    },
    {
        value: 3,
        label: '轻度污染',
    },
    {
        value: 4,
        label: '中度污染',
    },
    {
        value: 5,
        label: '重度污染',
    },
    {
        value: 6,
        label: '严重污染',
    },
]

// 公告的两个类型
export const noticeType = [
    {
        value: 0,
        label: '通知',
    },
    {
        value: 1,
        label: '动态',
    },
]

// 公告的三个位置
export const noticePosition = [
    {
        value: 0,
        label: '下面',
    },
    {
        value: 1,
        label: '滚动条',
    },
    {
        value: 2,
        label: '横幅',
    },
]

// 搜索使用的对象
export const stateAdmin = reactive({
    recordSearchForm: {
        // member_name:"",
        address:"",
        description:"",
        occurrent_time:"",
        expect_resoluted_time:"",
        if_expedited:"",
    },
    orderSearchForm: {
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
        title_accurate:"",
        title_vague:"",
        type:"",
        if_important:"",
    },
    userSearchForm: {

    },
    dialogForm: {}
})

// 城区级联选择器的参数
export const cityProps = {
    expandTrigger: 'hover',
    value:'code',   // 指定选项的 值 为选项对象的某个属性值
    label:'name',   // 指定选项 标签 为选项对象的某个属性值
    children:'children',    //指定选项的 子选项 为选项对象的某个属性值
    emitPath:false
}

const codeToNameMapping = {};

cityData.forEach(province => {
    province.children.forEach( city => {
        city.children.forEach( area => {
            const fullName = `${province.name}-${city.name}-${area.name}`;
            codeToNameMapping[area.code] = { code: area.code, name: fullName }
        })
    })
})

// 将城区的code转换为对应的名字
export const getCodeName = (code) => {
    return codeToNameMapping[code] ? codeToNameMapping[code].name : '未知';
};