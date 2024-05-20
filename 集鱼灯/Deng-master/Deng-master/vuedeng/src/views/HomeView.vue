<script setup>
import { ref } from 'vue';
import axios from 'axios';

const imageSrc = ref('');

getImage();

async function getImage() {
  try {
    const response = await axios.get('http://localhost:5000/', { responseType: 'blob' });
    const blob = new Blob([response.data], { type: 'image/png' });
    imageSrc.value = URL.createObjectURL(blob);
  } catch (error) {
    console.error('Error fetching image:', error);
  }
}
</script>

<template>
    <div class="module-box">
      <!-- 左边 -->
      <div style="flex:0 1 25%">
        <dv-border-box1 style="width:100%;height: 300px">
          <div class="h1"> 左侧集鱼灯配置情况 </div>
        </dv-border-box1>

        <dv-border-box8 :dur="5" style="width:100%;height: 355px">
          <div class="h1">当前配置下的照度模型</div>
          <div class="outer-border">
            <img :src="imageSrc" alt="Image from Flask" height="270px">
          </div>
        </dv-border-box8>
      </div>
      <!-- 中间 -->
      <div style="flex:0 1 50%">
        <dv-border-box10 style="width:100%;height: 655px">
          <div class="module-box">
            <div style="flex:0 1 50%">
              <dv-border-box13 style="width:100%;height: 125px;margin: 10px;">
                <div class="h1"> 渔船基本情况 </div>
              </dv-border-box13>
            </div>
            <div style="flex:0 1 50%">
              <dv-border-box13 style="width:100%;height: 125px;margin: 10px;">
                <div class="h1"> 集鱼灯情况 </div>
              </dv-border-box13>
            </div>
          </div>
        </dv-border-box10>
      </div>
      <!-- 右边 -->
      <div style="flex:0 1 25%">
        <dv-border-box1 style="width:100%;height: 300px">
          <div class="h1"> 右侧集鱼灯配置情况 </div>
        </dv-border-box1>

        <dv-border-box8 :dur="5" style="width:100%;height: 355px">
          <div class="h1">其他（？？？）</div>
        </dv-border-box8>
      </div>
    </div>
</template>

<style scoped>
  .outer-border {
    border: 10px solid transparent;
  }
</style>