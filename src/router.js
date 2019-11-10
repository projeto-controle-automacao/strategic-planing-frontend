import Vue from 'vue';
import Router from 'vue-router';
import Inicio from './views/Inicio'
import Login from './views/Login.vue';
import Home_usuario from './views/Home_usuario.vue';
import Empresas from './views/Empresas.vue';
import Perfil_empresa from './views/Perfil_empresa.vue';
import Planejamento from './views/Planejamento.vue';
import Conceitos_criacao from './views/Conceitos_criacao.vue';
import Conceitos_edicao from './views/Conceitos_edicao.vue';


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
      path: '/home_usuario',
      name: 'home_usuario',
      component: Home_usuario,
      children: [
        {
          path: 'empresas',
          name: 'empresas',
          component: Empresas,
        },
        {
          path: 'perfil-empresa/:empresa',
          name: 'perfil-empresa',
          component: Perfil_empresa,
          props: true,
        },
        {
          path: 'empresa/:empresa/planejamento/:planejamento',
          name: 'planejamento',
          component: Planejamento,
          props: true,
        },
        {
          path: 'conceitos_criacao/:empresa',
          name: 'conceitos_criacao',
          component: Conceitos_criacao,
          props: true,
        },
        {
          path: 'conceitos_edicao/:empresa/planejamento/:planejamento',
          name: 'conceitos_edicao',
          component: Conceitos_edicao,
          props: true,
        },
      ],
    },
  ],
});
