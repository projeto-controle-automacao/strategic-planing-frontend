import Vue from 'vue';
import Router from 'vue-router';
import Login from './views/Login.vue';
import Home from './views/Home.vue';
import Empresas from './views/Empresas.vue';
import Conceitos from './views/Conceitos.vue';

import Inicio from './views/Inicio'
Vue.use(Router);

export default new Router({
  mode: 'history',
  base: process.env.BASE_URL,
  routes: [
    {
      path: '/',
      name: 'inicio',
      component: Inicio,
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
        {
          path: 'perfil-empresa/:empresa',
          name: 'perfil-empresa',
          component: Conceitos,
          props: true
        }

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
