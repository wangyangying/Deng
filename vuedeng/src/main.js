import { createApp } from 'vue'
import App from './App.vue'
import router from './router'
import DataV, { setClassNamePrefix } from '@dataview/datav-vue3';

const app = createApp(App);
app.use(router);
app.mount('#app')
app.use(DataV, { classNamePrefix: 'dv-' });