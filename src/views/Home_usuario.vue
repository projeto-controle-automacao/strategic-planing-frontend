<template>
  <div>
    <navbar/>
    <router-view/>
    <div>
      <h1>Essa é a pagina de usuario</h1>
    </div>
  </div>
</template>
<script>
import navbar from '../components/NavBar'
export default {
  components: {
    navbar
  }
}
</script>

