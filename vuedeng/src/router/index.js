import { createRouter, createWebHistory } from 'vue-router';

//导入组件
import LayoutVue from '@/views/Layout.vue'
import HomeVue from '@/views/HomeView.vue';
import SimulateVue from '@/views/SimulateView.vue';
import HelpVue from '@/views/HelpView.vue';
import AboutVue from '@/views/AboutView.vue';


//定义路由关系
const routes = [
    {
        path: '/', 
        component: LayoutVue,
        redirect:'/home', 
        children: [
            { path: '/home', component: HomeVue },
            { path: '/simulate', component: SimulateVue },
            { path: '/help', component: HelpVue },
            { path: '/about', component: AboutVue }
        ]
    }
]

//创建路由器
const router = createRouter({
  history: createWebHistory(),
  routes
});

//导出路由
export default router
