<script setup>

</script>

<template>
    <div class="module-box">
        <!-- 左边 -->
        <div style="flex:0 1 25%">
            <dv-button @click="console.log('click')" border="Border5" color="#4c8045">渔船参数设定</dv-button>
            <dv-button @click="console.log('click')" border="Border5" color="#4c8045">集鱼灯参数设定</dv-button>
            <dv-button @click="console.log('click')" border="Border5" color="#4c8045">水下指定点计算</dv-button>
            <dv-button @click="console.log('click')" border="Border5" color="#4c8045">水下横向纵向单根线照度计算</dv-button>
            <dv-border-box8 :dur="5" style="width:100%;height: 355px">
                <div class="h1">其他（？？？）</div>
            </dv-border-box8>
        </div>
      <!-- 右侧展示预测结果 -->
        <div style="flex:0 1 75%">
            <dv-border-box10 style="width:100%;height: 655px">
                <div class="h1"> dv-border-box-1 </div>
            </dv-border-box10>
        </div>
    </div>
</template>

<style scoped>
</style>