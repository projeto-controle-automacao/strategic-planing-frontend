<template>
  <div class="container">
    <div class="blockquote-wrapper row" v-for="perfil in perfis" :key="perfil.id">
      
        <div class="blockquote col">
          <h1>{{ perfil.mission }}</h1>
          <h4>Missão</h4>
        </div>
        <div class="blockquote col">
          <h1>{{ perfil.vision }}</h1>
          <h4>Visão</h4>
        </div>
        <div class="blockquote col">
          <h1>{{ perfil.values }}</h1>
          <h4>Valores</h4>
        </div>

      <button @click="EditarConceitos(perfil.id)"> Editar </button>
    </div>
  </div>
</template>

<script>
import Axios from "axios";
export default {
  components: {
    Axios
  },
  data: () => ({
    token: "",
    conceitos: [],
    perfis: []
  }),

  mounted() {
    this.token = localStorage.token;
    this.buscarPerfis();
  },
  methods: {
    async buscarPerfis() {
      let id = this.$route.params.empresa;
      await Axios.get(
        `http://127.0.0.1:8000/api/v1/companies/${id}/company-profile`,
        {
          headers: { Authorization: `Bearer ${this.token}` }
        }
      )
        .then(res => {
          this.perfis = res.data;
          console.log(this.perfis);
        })
        .catch(err => {
          console.log("error", "nao consegui buscar os perfis");
        });
    },
    EditarConceitos() {
      let id = this.$route.params.empresa;
      this.$router.push({ name: "conceitos", params: { empresa: id } });
    }
  }
};
</script>
<style lang="scss" scoped>
body {
  background-color: #292a2b;
}

/* center the blockquote in the page */
.blockquote-wrapper {
  display: inline-grid;
  //height: 100vh;
  padding: 0 10px;
  flex-direction: column;
  align-items: stretch;
}

/* Blockquote main style */
.blockquote {
  position: relative;
  font-family: "Barlow Condensed", sans-serif;
  max-width: 310px;
  margin: 40px auto;
  flex-direction: column;
  // align-self: center;
}

/* Blockquote header */
.blockquote h1 {
  font-family: "Abril Fatface", cursive;
  position: relative; /* for pseudos */
  color: #e74848;
  font-size: 2.8rem;
  font-weight: normal;
  line-height: 1;
  margin: 0;
  border: 2px solid #fff;
  border: solid 2px;
  border-radius: 20px;
  padding: 25px;
}

/* Blockquote right double quotes */
.blockquote h1:after {
  content: "";
  position: absolute;
  border: 2px solid #e74848;
  border-radius: 0 50px 0 0;
  width: 60px;
  height: 60px;
  bottom: -62px;
  left: 50px;
  border-bottom: none;
  border-left: none;
  z-index: 3;
}

.blockquote h1:before {
  content: "";
  position: absolute;
  width: 80px;
  border: 6px solid #292a2b;
  bottom: -3px;
  left: 50px;
  z-index: 2;
}

/* increase header size after 600px */
@media all and (min-width: 600px) {
  .blockquote h1 {
    font-size: 3rem;
    line-height: 1.2;
  }
}

/* Blockquote subheader */
.blockquote h4 {
  position: relative;
  color: #ffffff;
  float: left;
  font-size: 1.3rem;
  font-weight: 400;
  line-height: 1.2;
  margin: 0;
  padding-top: 15px;
  z-index: 1;
  margin-left: 150px;
  padding-left: 12px;
}

.blockquote h4:first-letter {
  margin-left: -12px;
}
</style>
