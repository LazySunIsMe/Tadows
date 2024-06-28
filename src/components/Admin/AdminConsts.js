
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
export const statusOptions = [
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
    }
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