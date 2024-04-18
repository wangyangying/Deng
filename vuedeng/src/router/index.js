import { createRouter, createWebHistory } from 'vue-router';

//导入组件
import HomeVue from '@/views/HomeView.vue';

//定义路由关系
const routes = [
  // {
  //   path: '/',
  //   name: 'home',
  //   component: HomeView
  // },
  {
    path:'/',
    name: 'home',
    component: HomeVue
  }
]

//创建路由器
const router = createRouter({
  history: createWebHistory(),
  routes
});

//导出路由
export default router
