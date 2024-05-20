<script>
export default {
  data() {
    return {
      currentTime: ''
    };
  },
  mounted() {
    // 更新时间
    this.updateTime();
    // 每隔一秒更新时间
    setInterval(() => {
      this.updateTime();
    }, 1000);
  },
  methods: {
    // 获取当前时间并格式化
    updateTime() {
      const date = new Date();
      const year = date.getFullYear();
      const month = (date.getMonth() + 1).toString().padStart(2, '0');
      const day = date.getDate().toString().padStart(2, '0');
      const hours = date.getHours().toString().padStart(2, '0');
      const minutes = date.getMinutes().toString().padStart(2, '0');
      const seconds = date.getSeconds().toString().padStart(2, '0');
      this.currentTime = `${year}-${month}-${day} ${hours}:${minutes}:${seconds}`;
    }
  }
};
</script>


<template>
  <el-container class="bg">
    <!-- 抬头 -->
    <el-header style="padding: 0;">
      <div class="module-box">
        <div style="flex:0 1 25%">
          <dv-decoration-10 style="height:5px;" />
          <div style="display: flex; gap: 16px;">
            <router-link to="/home">
              <dv-button :bg="false">首页</dv-button>
            </router-link>
            <router-link to="/simulate">
              <dv-button :bg="false">配置优化</dv-button>
            </router-link>
            <router-link to="/help">
              <dv-button :bg="false">帮助</dv-button>
            </router-link>
            <router-link to="/about">
              <dv-button :bg="false">关于</dv-button>
            </router-link>
          </div>
        </div>

        <div style="flex:0 1 50%">
          <div class="d-flex">
            <dv-decoration8 style="height:50px;flex: 1;" />
            <div class="bt" style="flex: 1;">
              集鱼灯优化配置
              <dv-decoration6 style="width:300px;height:30px;" />
            </div>
            <dv-decoration8 :reverse="true" style="height:50px;flex: 1;" />
          </div>
        </div>

        <div style="flex:0 1 25%">
          <dv-decoration-10 style="height:5px; transform:rotate(180deg);" />
          <div style="display: flex; gap: 16px;">
            <dv-button :bg="false">退出</dv-button>
            <dv-button :bg="false">{{ currentTime }}</dv-button>
            <!-- <div class="time-container">
              <span>{{ currentTime }}</span>
            </div> -->
          </div>
        </div>
      </div>
    </el-header>

    <!-- 中间区域 -->
    <el-main style="padding: 0;">
      <router-view></router-view>
    </el-main>   
  </el-container>
</template>

<style scoped>
.bg {
  /* 设置容器充满整个视窗 */
  width: 100vw;
  height: 100vh;
  /* 使用背景图片，并设置背景样式 */
  background: url(../assets/img/background.jpg) no-repeat center center;
  /* 按照容器大小自动缩放背景图片 */
  background-size: cover;
  padding: 0 !important;
}
.bt {
    color: azure;
    text-align: center;
    font-weight: bold;
    font-size: 30px;
}
.d-flex {
    display: flex;
}
/* .time-container {
  position: fixed;
  top: 10px;
  right: 10px;
  color: azure;
  font-size: 16px;
} */
</style>