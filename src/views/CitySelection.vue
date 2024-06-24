<!--<template>-->
<!--    <div>-->
<!--        &lt;!&ndash; 引入Element UI Cascade组件 &ndash;&gt;-->
<!--        <el-cascader-->
<!--                filterable-->
<!--                placeholder="请选择"-->
<!--                ref="addPoint"-->
<!--                :props="cityProps"-->
<!--                :options="cityOptions"-->
<!--                clearable-->
<!--                @active-item-change="handleActiveItemChange"-->
<!--                @change="handleChange"-->
<!--                v-model="selectedOptions"-->
<!--        ></el-cascader>-->
<!--    </div>-->
<!--</template>-->

<!--<script>-->
<!--import axios from 'axios';-->

<!--export default {-->
<!--    data() {-->
<!--        return {-->
<!--            selectedArea: [],-->
<!--            provinceList: [],-->
<!--            CITY: [],-->
<!--            XIAN: [],-->

<!--            /*获取数据的url key需要自己到高德地图申请*/-->
<!--            url: 'https://restapi.amap.com/v3/config/district?keywords=&subdistrict=3&extensions=base&key=0f8bb52d9250be5c4b4d191ec6840ecc',-->
<!--            /*选项列表*/-->
<!--            cityOptions: [],-->
<!--            /*选项列表格式*/-->
<!--            cityProps: {-->
<!--                value: 'name',-->
<!--                label: 'name',-->
<!--                children: 'districts',-->
<!--            },-->
<!--            selectedOptions: null, //选中的数据-->
<!--        };-->
<!--    },-->
<!--    methods: {-->

<!--        /* 获取省市区选项 */-->
<!--        getCity() {-->
<!--            axios.get(this.url, null).then((res) => {-->
<!--                console.log(res)-->
<!--                this.cityOptions = this.getTreeData(-->
<!--                    res.data.districts[0].districts-->
<!--                )-->
<!--            })-->
<!--        },-->
<!--        /* 递归处理末尾项district为0的空项 */-->
<!--        getTreeData(data) {-->
<!--            // 循环遍历返回的数据-->
<!--            for (let i = 0; i < data.length; i++) {-->
<!--                if (data[i].districts.length < 1) {-->
<!--                    // districts若为空数组，则将districts设为undefined-->
<!--                    data[i].districts = undefined-->
<!--                } else {-->
<!--                    // districts若不为空数组，则继续 递归调用 本方法-->
<!--                    this.getTreeData(data[i].districts)-->
<!--                }-->
<!--            }-->
<!--            return data-->
<!--        },-->

<!--        handleActiveItemChange(selected){-->
<!--            console.log(selected,"handleActiveItemChange-&#45;&#45;&#45;&#45;")-->
<!--        },-->

<!--        handleChange(selected){-->
<!--            console.log(selected,"handleChange-&#45;&#45;&#45;&#45;")-->
<!--        }-->
<!--    },-->
<!--    created() {-->
<!--        this.getCity();-->
<!--    },-->
<!--};-->
<!--</script>-->

<template>
    <div id="app">
        <el-cascader
            size="large"
            :options="provinceAndCityData"
            v-model="selectedOptions">
        </el-cascader>
    </div>
</template>

<script>
import { provinceAndCityData } from 'element-china-area-data'
export default {
    setup () {
        return {
            provinceAndCityData,
            selectedOptions: []
        }
    },
}
</script>
