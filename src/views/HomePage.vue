<template>
    <el-container>
        <el-carousel :interval="6000" height="500px" motion-blur style="width: 40%">
            <el-carousel-item v-for="item in imgUrls" :key="item.id">
<!--                <h3 class="small justify-center">{{ item }}</h3>-->
                <img class="el-carousel-image" :src="item.idView"  alt="notice_image">
            </el-carousel-item>
        </el-carousel>
    </el-container>
    <el-container>

    </el-container>
</template>

<script setup>
/**
 * @author Kardia_sfx
 * @date 07-02-2024 15:25
 */
import {reactive, toRefs} from "vue";

const state = reactive({
    imgUrls: {},
})

const { imgUrls } = toRefs(state)


state.imgUrls = reactive([
    {id:'0',idView:require('../assets/pics/image-20240330eden.png')},
    {id:'1',idView:require('../assets/pics/20240330224921_1.jpg')},
    {id:'2',idView:require('../assets/pics/20240330225259_1.jpg')},
])

</script>

<style scoped>

.el-carousel-image {
    object-fit: scale-down;
    width: 100%;
    height: 100%;
}

</style>