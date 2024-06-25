<template lang="html">
    <Admin>
        <el-main>
            <el-container>
                <el-aside class="el-aside-inside">
                    <h4>监督记录查询</h4>
                    <el-form  :model="recordForm" label-width="auto">
                        <el-form-item label="网格地址">
                            <el-cascader
                                size="large"
                                :options="provinceAndCityData"
                                :model="selectedOptions"
                                :props="cityProps"
                                placeholder="请选择城市"
                            >
                            </el-cascader>
                        </el-form-item>
                        <el-form-item label="监督信息内容">
                            <el-input v-model="recordForm.description" placeholder="监督信息"/>
                        </el-form-item>
                        <el-form-item label="记录提交时间">
                            <el-date-picker
                                v-model="recordForm.occurrent_time"
                                type="date"
                                placeholder="日期"
                                format="YYYY/MM/DD"
                                value-format="YYYY-MM-DD"
                            />
                        </el-form-item>
                        <el-form-item label="期待反馈时间">
                            <el-date-picker
                                v-model="recordForm.expect_resoluted_time"
                                type="date"
                                placeholder="日期"
                                format="YYYY/MM/DD"
                                value-format="YYYY-MM-DD"
                            />
                        </el-form-item>
                        <el-form-item label="是否加急">
                            <el-radio-group v-model="recordForm.if_expedited">
                                <el-radio value="1">是</el-radio>
                                <el-radio value="0">否</el-radio>
                            </el-radio-group>
                        </el-form-item>
                    </el-form>
                    <el-button type="primary" @click="doSelect">筛选</el-button>
                    <el-button type="warning" @click="reset">回原</el-button>
                </el-aside>
                <el-main class="el-main-inside">
                    <el-scrollbar>
                        <el-button plain @click="recordDetailDialog = true">
                            打开，打开，一定要打开
                        </el-button>
<!--                               <el-table :data="mainTableElement" stripe>-->
<!--                                   <el-table-column prop="" label="" width=""/>-->
<!--                               </el-table>-->
                    </el-scrollbar>
                </el-main>
            </el-container>
        </el-main>
    </Admin>

    <el-dialog v-model="recordDetailDialog" ref="recordDetailDialogRef" title="监督信息详情" width="600">
        <el-form :model="recordForm">
            <!-- ID和姓名 -->
            <el-row :gutter="20">
                <el-col :span="12">
                    <el-form-item label="ID">
                        <el-input v-model="recordForm.id" placeholder="请输入ID"></el-input>
                    </el-form-item>
                </el-col>
                <el-col :span="12">
                    <el-form-item label="姓名">
                        <el-input v-model="recordForm.name" placeholder="请输入姓名"></el-input>
                    </el-form-item>
                </el-col>
            </el-row>

            <!-- 网格地址和监督信息类型 -->
            <el-row :gutter="20">
                <el-col :span="12">
                    <el-form-item label="网格地址">
                        <el-select v-model="recordForm.address" placeholder="请选择网格地址">
                            <el-option label="地址1" value="1"></el-option>
                            <el-option label="地址2" value="2"></el-option>
                        </el-select>
                    </el-form-item>
                </el-col>
                <el-col :span="12">
                    <el-form-item label="监督信息类型">
                        <el-select v-model="recordForm.type" placeholder="请选择监督信息类型">
                            <el-option label="类型1" value="1"></el-option>
                            <el-option label="类型2" value="2"></el-option>
                        </el-select>
                    </el-form-item>
                </el-col>
            </el-row>

            <!-- 状况发生时间和期望反馈时间 -->
            <el-row :gutter="20">
                <el-col :span="12">
                    <el-form-item label="状况发生时间">
                        <el-date-picker
                            v-model="recordForm.occurrent_time"
                            type="datetime"
                            placeholder="选择日期时间"
                            style="width: 100%;"
                        ></el-date-picker>
                    </el-form-item>
                </el-col>
                <el-col :span="12">
                    <el-form-item label="期望反馈时间">
                        <el-date-picker
                            v-model="recordForm.expect_resoluted_time"
                            type="datetime"
                            placeholder="选择日期时间"
                            style="width: 100%;"
                        ></el-date-picker>
                    </el-form-item>
                </el-col>
            </el-row>

            <!-- 内容描述 -->
            <el-form-item label="内容描述">
                <el-input
                    type="textarea"
                    v-model="recordForm.description"
                    placeholder="请输入内容描述"
                    rows="6"
                ></el-input>
            </el-form-item>

            <!-- 附件预览 -->
            <el-form-item label="附件预览">
                <div class="attachment-preview">
                    <el-image
                        v-for="(file, index) in recordForm.attachments"
                        :key="index"
                        :src="file.url"
                        :preview-src-list="previewList"
                        fit="contain"
                        class="attachment-image"
                    ></el-image>
                </div>
            </el-form-item>

            <!-- 按钮 -->
            <el-form-item>
                <el-button type="primary" @click="assign">指派</el-button>
                <el-button type="warning" @click="mark">标记</el-button>
                <el-button type="danger" @click="exit">退出</el-button>
            </el-form-item>
        </el-form>
        <template #footer>
            <div class="dialog-footer">
                <el-button @click="recordDetailDialog = false">Cancel</el-button>
                <el-button type="primary" @click="recordDetailDialog = false">
                    Confirm
                </el-button>
            </div>
        </template>
    </el-dialog>
</template>

<script>
import { reactive, ref, toRefs } from "vue";
import { provinceAndCityData } from 'element-china-area-data'
import laoshuyao from '@/assets/QQ20240614142245.jpg';
import {Clock, DataBoard, DataLine, Document, Edit, House, Setting, User, WindPower} from "@element-plus/icons";
import Admin from '@/components/Admin.vue';

export default {
    name: "AdminWorkOrder",
    components: {Admin, WindPower, Edit, DataLine, DataBoard, Clock, Document, House, Setting, User},
    setup() {
        const state = reactive({
            recordDetailDialog: ref(false),
            recordForm: {
                address:"",
                description:"",
                occurrent_time:"",
                expect_resoluted_time:"",
                if_expedited:"",
            },
            selectedOptions: [],
            mainTableElement: {}
        })

        const cityProps = {
            expandTrigger: 'hover'
        }

        function doSelect() {

        }

        function reset() {
            state.recordForm = {
                address:"",
                description:"",
                occurrent_time:"",
                expect_resoluted_time:"",
                if_expedited:"",
            }
        }

        return {
            ...toRefs(state),
            doSelect,
            reset,
            provinceAndCityData,
            cityProps,
            laoshuyao
        }
    }
}
</script>

<style scoped>

.el-aside-inside {
    width: 260px;
    border-right: 1px solid #000000; /* 设置右边框为灰色，可以根据需要调整颜色和宽度 */
    padding-right: 15px; /* 可选：增加右边距以增强分隔感 */
}

.el-main-inside {
    background-color: #FF8800;
}

</style>