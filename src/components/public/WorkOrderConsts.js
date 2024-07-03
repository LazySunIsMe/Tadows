// 工单的四个状态
import {ref} from "vue";

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

export const orderState = ref({
    dialogForm: {},
})