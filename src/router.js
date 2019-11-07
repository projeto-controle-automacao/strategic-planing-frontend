import Vue from 'vue';
import Router from 'vue-router';
import Login from './views/Login.vue';
import Home from './views/Home.vue';
import Empresas from './views/Empresas.vue';

import PlatformSelection from './views/PlatformSelection'
Vue.use(Router);

export default new Router({
  mode: 'history',
  base: process.env.BASE_URL,
  routes: [
    {
      path: '/',
      name: 'seletor-plataforma',
      component: PlatformSelection,
    },
    {
      path: '/login',
      name: 'login',
      component: Login,
    },
    {
      path: '/home',
      name: 'home',
      component: Home,
      children: [
        {
          path: 'empresas',
          name: 'empresas',
          component: Empresas
        },

        // {
        //   // UserPosts will be rendered inside User's <router-view>
        //   // when /user/:id/posts is matched
        //   path: 'posts',
        //   component: UserPosts
        // }
      ]
    },
  ],
});
