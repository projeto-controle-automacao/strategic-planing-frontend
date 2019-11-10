<template>
  <div>
    <div class="grid-layout">
      <div class="card grid-item-1">
        <p class="title">Missão</p>
        <p class="text">{{ conceitos.missao }}</p>
      </div>
      <div class="card grid-item-1">
        <p class="title">Visão</p>
        <p class="text">{{ conceitos.visao }}</p>
      </div>
      <div class="card grid-item-1">
        <p class="title">Valores</p>
        <p class="text">{{ conceitos.valores }}</p>
      </div>
    </div>
  </div>
</template>>

<script>
import Axios from "axios";
export default {
  components: {
    Axios
  },
  data: () => ({
    token: "",
    conceitos: {
      horizonte: "",
      duracao: "",
      missao: "",
      visao: "",
      valores: ""
    },
    swot: []
  }),

  mounted() {
    this.token = localStorage.token;
    this.buscarPerfis();
  },
  methods: {
    async buscarPerfis() {
      console.log(this.$route.params);
      let id_empresa = this.$route.params.empresa;
      let id_planejamento = this.$route.params.planejamento;
      console.log(id_empresa, id_planejamento);
      await Axios.get(
        `http://127.0.0.1:8000/api/v1/companies/${id_empresa}/company-profile/${id_planejamento}`,
        {
          headers: { Authorization: `Bearer ${this.token}` }
        }
      )
        .then(res => {
          console.log(res.data.perfil);
          this.conceitos.duracao = res.data.perfil.deadline;
          this.conceitos.missao = res.data.perfil.mission;
          this.conceitos.visao = res.data.perfil.vision;
          this.conceitos.valores = res.data.perfil.values;
          //console.log(this.conceitos);
        })
        .catch(err => {
          console.log("error", "nao consegui buscar o planejamento");
        });
    },

    irParaConceitos(id) {
      this.$router.push({ name: "conceitos", params: { planejamentos: id } });

      console.log(id);
    }
  }
};
</script>

<style lang="scss" scoped>
// organização containers
@import url("https://fonts.googleapis.com/css?family=Cabin:400,700&subset=latin-ext");
///// Variables
$body-bgc: rgb(35, 111, 197);
$card-bgc: #616161;
$card-color: rgb(255, 255, 255);
* {
  margin: 10px;
  //padding: 0;
  box-sizing: border-box;
}

body {
  background-color: $body-bgc;
  padding: 1rem;
}

.grid-layout {
  position: relative;
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(auto, auto));
  grid-gap: 10px;
  grid-auto-rows: minmax(200px, auto);
  grid-auto-flow: dense;
  padding: 10px;
}

.grid-item {
  padding: 1rem;
  display: flexbox;
  //position: relative;
  font-size: 14px;
  font-weight: bold;
  text-transform: uppercase;
  color: #929796;
  background-color: rgb(151, 140, 140);
  border-radius: 5px;
  &:nth-child(odd) {
    background-color: #424242;
  }
}

.span-2 {
  grid-column-end: span 2;
  grid-row-end: span 2;
}

.span-3 {
  grid-column-end: span 3;
  grid-row-end: span 4;
}

/// estilo dos cards
.card {
  //max-width: 500px;
  background-color: #1d1c1c;
  min-width: 500px;
  height: auto;
  margin: 20px;
  border-radius: 10px;
  box-shadow: 0px 2px 10px rgba(31, 30, 30, 0.24);
  border: 2px solid rgba(65, 61, 61, 0.12);
  display: flexbox;
  justify-content: center;
  align-items: center;
  flex-direction: column;
}

.card h1 {
  color: rgb(35, 111, 197);
  size: auto;
}

.card .title {
  width: 100%;
  margin: 0;
  text-align: center;
  margin-top: 30px;
  color: rgb(35, 111, 197);
  font-weight: 600;
  text-transform: uppercase;
  letter-spacing: 4px;
}

.card .text {
  margin: 0 auto;
  font-size: 14px;
  text-align: center;
  margin-top: 10px;
  color: white;
  font-weight: 200;
  letter-spacing: 1px;
  max-height: auto;
}
</style>