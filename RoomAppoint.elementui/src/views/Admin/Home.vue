<template>
    <div class="home-container">
        <el-card class="box-card margin-top-lg">
            <div slot="header" class="clearfix">
                <span>数据统计</span>
            </div>
            <!-- 加载状态提示 -->
            <div v-if="!DataCollect" class="loading-tip">加载中...</div>
            <div class="board-list" v-else>
                <div class="board-item" v-for="(item, index) in boardItems" :key="index">
                    <div class="tit">{{ item.title }}</div>
                    <div class="num">{{ DataCollect[item.key] }}</div>
                </div>
            </div>
        </el-card>

        <el-card class="box-card margin-top-lg">
            <div slot="header" class="clearfix">
                <span>今日每个自习室早中晚的使用率(%)</span>
            </div>
            <!-- 图表容器，添加加载提示 -->
            <div v-show="chartLoading" class="loading-tip">图表加载中...</div>
            <div id="echartDiv" class="echart" v-show="!chartLoading"></div>

            <!-- <div v-if="chartLoading" class="loading-tip">图表加载中...</div>
            <div class="echart" id="echartDiv" :style="{ width: '100%', height: '500px' }" v-else></div> -->
        </el-card>

        <el-card class="box-card margin-top-lg">
            <div slot="header" class="clearfix">
                <span>欢迎您的使用</span>
            </div>
            <el-row :gutter="10">
                <el-col :span="12">
                    <el-calendar></el-calendar>
                </el-col>
                <el-col :span="12">
                    <el-descriptions title="系统介绍" direction="horizontal" :column="1" border>
                        <el-descriptions-item label="系统名称">基于SpringBoot+Vue的自习室管理系统设计与实现</el-descriptions-item>
                        <el-descriptions-item label="后端技术">SpringBoot3.3</el-descriptions-item>
                        <el-descriptions-item label="前端">Vue3</el-descriptions-item>
                        <el-descriptions-item label="数据库">Mysql</el-descriptions-item>
                        
                    </el-descriptions>
                </el-col>
            </el-row>
        </el-card>
    </div>
</template>

<script>
import * as echarts from "echarts";

export default {
    name: 'Home',
    data() {
        return {
            DataCollect: null, // 统计数据
            chartLoading: true, // 图表加载状态
            // 数据统计项配置（便于循环渲染，避免硬编码）
            boardItems: [
                { title: '自习室个数', key: 'RoomCount' },
                { title: '总座位数', key: 'SeatCount' },
                { title: '总预约人次', key: 'AppointCount' },
                { title: '待使用次数', key: 'WaitAppointCount' },
                { title: '逾期人次', key: 'OverdueAppointCount' },
                { title: '总剩余积分', key: 'TotalIntegral' }
            ]
        };
    },
    mounted() {
        // 调用数据请求方法
        this.GetAppointRoomUseRate();
        this.GetDataCollect();
        // 监听窗口大小变化，确保图表自适应
        window.addEventListener("resize", this.handleChartResize);
    },
    beforeDestroy() {
        // 销毁时移除事件监听，防止内存泄漏
        window.removeEventListener("resize", this.handleChartResize);
        // 销毁ECharts实例
        if (this.myChart) {
            this.myChart.dispose();
        }
    },
    methods: {
        // 处理图表自适应
        handleChartResize() {
            if (this.myChart) {
                this.myChart.resize();
            }
        },
        // 统计早中晚每个自习室的使用率&空闲率
        async GetAppointRoomUseRate() {
            try {
                // 发起请求，添加异常捕获
                const response = await this.$Post('/AppointRecord/GetAppointRoomUseRate', {});
    const { Data } = response || {};

    if (!Array.isArray(Data) || !Data.length) {
      this.$message.warning('暂无自习室使用率数据');
      return;
    }
    
    // ✅ 先让 DOM 出现
    this.chartLoading = false;


    this.$nextTick(() => {
      const dom = document.getElementById('echartDiv');
      if (!dom) return;
      
      const labelOption = {
        show: true,
        position: 'insideBottom',
        formatter: '{c}',
        fontSize: 12
      };


      this.myChart?.dispose();
      this.myChart = echarts.init(dom);


                // 图表配置项
                this.myChart.setOption({
                    tooltip: {
                        trigger: 'axis',
                        axisPointer: {
                            type: 'shadow'
                        }
                    },
                    legend: {
                        data: ['上午', '下午', '夜晚']
                    },
                    toolbox: {
                        show: true,
                        orient: 'vertical',
                        left: 'right',
                        top: 'center',
                        feature: {
                            mark: { show: true },
                            dataView: { show: true, readOnly: false },
                            magicType: { show: true, type: ['line', 'bar', 'stack'] },
                            restore: { show: true },
                            saveAsImage: { show: true }
                        }
                    },
                    xAxis: [
                        {
                            type: 'category',
                            axisTick: { show: false },
                            data: Data.map(x => x.Room?.Name || '未知自习室') // 可选链操作，防止Room为null报错
                        }
                    ],
                    yAxis: [
                        {
                            type: 'value',
                            axisLabel: {
                                formatter: '{value} %' // y轴标签添加百分比单位
                            }
                        }
                    ],
                    series: [
                        {
                            name: '上午',
                            type: 'bar',
                            barGap: 0,
                            label: labelOption,
                            emphasis: {
                                focus: 'series'
                            },
                            data: Data.map(x => x.AmUseRate || 0) // 兜底处理，防止数据为null
                        },
                        {
                            name: '下午',
                            type: 'bar',
                            label: labelOption,
                            emphasis: {
                                focus: 'series'
                            },
                            data: Data.map(x => x.PmUseRate || 0)
                        },
                        {
                            name: '夜晚',
                            type: 'bar',
                            label: labelOption,
                            emphasis: {
                                focus: 'series'
                            },
                            data: Data.map(x => x.NmUseRate || 0)
                        }
                    ]
                });
            });
                // 渲染图表
                
                
            } catch (e) {
                console.error('获取自习室使用率失败：', e);
                // this.$message.error('获取图表数据失败，请稍后重试');
                
            }finally {
                this.chartLoading = false;
            }
        },
        // 统计各类数据到看板
        async GetDataCollect() {
            try {
                const response = await this.$Post('/AppointRecord/GetDataCollect', {});
                const { Data } = response || {};
                this.DataCollect = Data || {}; // 兜底处理，防止数据为null
            } catch (error) {
                console.error('获取统计数据失败：', error);
                this.$message.error('获取统计数据失败，请稍后重试');
                this.DataCollect = {}; // 兜底，避免页面显示异常
            }
        }
    }
};
</script>

<style scoped>
.home-container {
    padding: 0 10px;
}

.margin-top-lg {
    margin-top: 20px !important;
}

/* 数据统计看板样式优化 */
.board-list {
    display: flex;
    flex-wrap: wrap; /* 自动换行，避免超出容器 */
    gap: 20px; /* 替换margin-right，更优雅的间距 */
    padding: 10px 0;
}

.board-list .board-item {
    text-align: center;
    padding: 20px;
    border-radius: 10px;
    color: white;
    width: 180px;
    flex-shrink: 0; /* 防止项被压缩 */
}

/* 为每个统计项设置背景色 */
.board-list .board-item:nth-child(1) {
    background-color: rgb(160, 230, 230);
}

.board-list .board-item:nth-child(2) {
    background-color: rgb(220, 170, 228);
}

.board-list .board-item:nth-child(3) {
    background-color: rgb(241, 208, 145);
}

.board-list .board-item:nth-child(4) {
    background-color: rgb(145, 231, 198);
}

.board-list .board-item:nth-child(5) {
    background-color: rgb(133, 145, 216);
}

.board-list .board-item:nth-child(6) {
    background-color: rgb(227, 134, 162);
}

.board-list .board-item .tit {
    font-size: 14px;
}

.board-list .board-item .num {
    margin-top: 10px;
    font-weight: bolder;
    font-size: 20px;
}

/* 加载提示样式 */
.loading-tip {
    text-align: center;
    padding: 20px;
    color: #666;
    font-size: 14px;
}

/* 图表容器样式 */
.echart {
    width: 100%;
    height: 500px;
}

/* 修复a标签样式继承问题 */
a {
    color: inherit;
    text-decoration: none;
}

a:hover {
    text-decoration: underline;
}
</style>