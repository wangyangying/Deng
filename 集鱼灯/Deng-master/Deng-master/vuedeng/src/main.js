import './style.css'
import '@/assets/css/index.css'

import { createApp } from 'vue'
import ElementPlus from'element-plus'
import 'element-plus/dist/index.css'
import App from './App.vue'
import router from './router'
import DataVVue3 from '@kjgl77/datav-vue3'
import locale from 'element-plus/dist/locale/zh-cn.js'

const app = createApp(App);
app.use(router);
app.use(DataVVue3);
app.use(ElementPlus,{locale});
app.mount('#app')