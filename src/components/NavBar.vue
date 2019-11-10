<template>
  <nav>
  <ul>
    <!-- <li>
      <a @click="toHome">Inicio</a>
    </li> -->
    <li>
      <a @click="toEmpresas">Empresas</a>
    </li>
    <li>
      <a @click="toServicos">Serviços</a>
    </li>
    <li>
      <a @click="toLogin">Sair</a>
    </li>
  </ul>
</nav>
</template>

<script>
export default {
  name: 'navbar',

  methods: {
    // toHome() {
    //   this.$router.push({ name: 'home_usuario' });
    // },
    toEmpresas() {
      this.$router.push({ name: 'empresas' });
    },
    toLogin() {
      this.$router.push({ name: 'inicio' });
    },
    toServicos() {
      this.$router.push({ name: 'home_usuario' });
    },
  },
};
</script>

<style scoped>
nav {
  max-width: 960px;
  mask-image: linear-gradient(90deg, rgba(81, 160, 235, 0) 0%, #5963b9 25%, #3d4a85 75%, rgba(36, 20, 187, 0) 100%);
  margin: 0 auto;
  /* padding: 20px 0; */
}

nav ul {
  text-align: center;
  background: linear-gradient(90deg, rgba(255, 255, 255, 0) 0%, rgba(255, 255, 255, 0.2) 25%, rgba(255, 255, 255, 0.2) 75%, rgba(255, 255, 255, 0) 100%);
  box-shadow: 0 0 25px rgba(0, 0, 0, 0.1), inset 0 0 1px rgba(255, 255, 255, 0.6);
}

nav ul li {
  display: inline-block;
}

nav ul li a {
  padding: 18px;
  font-family: "Open Sans";
  text-transform:uppercase;
  color: #d8d8d8;
  font-size: 18px;
  text-decoration: none;
  display: block;
}

nav ul li a:hover {
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1), inset 0 0 1px rgba(255, 255, 255, 0.6);
  background: rgba(255, 255, 255, 0.1);
  color: rgba(50, 255, 255, 0.9);
}

a{
  cursor: pointer;
}

</style>