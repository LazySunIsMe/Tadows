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

export const stateAQI = {
    AQIForm: {
        aqi_id:"",
        grid_watcher_number:"",
        address:"",
        record_time:"",
        pm2d5:"",
        pm10:"",
        so2:"",
        no2:"",
        o3:"",
        co:"",
        work_order_id:"",
    },
}