<template>
  <div class="grid-layout">
    <div class="card grid-item-1" @click="modal()">
      <div class="icon">
        <i class="fa fa-plus-square" style="font-size:48px;color:white"></i>
      </div>
      <p class="title">Novo Plano</p>
    </div>
    <div
      class="card grid-item-2"
      v-for="(planejamento, i) in planejamentos"
      :key="planejamento.id"
      @click="irParaPlanejamento(id_empresa, planejamento.id)"
    >
      <div class="icon">
        <i class="fa fa-cubes" style="font-size:48px;color:white"></i>
      </div>
      <p class="title">Plano {{ i + 1 }}</p>
      <p class="text">Duração {{ planejamento.deadline }}</p>
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
    id_empresa: "",
    token: "",
    planejamentos: []
  }),

  mounted() {
    this.token = localStorage.token;
    this.buscarPerfis();
  },
  methods: {
    async buscarPerfis() {
      let id = this.$route.params.empresa;
      this.id_empresa = id;
      await Axios.get(
        `http://127.0.0.1:8000/api/v1/companies/${id}/company-profile`,
        {
          headers: { Authorization: `Bearer ${this.token}` }
        }
      )
        .then(res => {
          this.planejamentos = res.data;
          console.log(this.planejamentos);
        })
        .catch(err => {
          console.log("error", "nao consegui buscar os perfis");
        });
    },
    irParaPlanejamento(empresa, planejamento) {
      //console.log(empresa, planejamento);
      this.$router.push({
        name: "planejamento",
        params: { empresa: empresa, planejamento: planejamento }
      });
      //console.log();
    }
  }
};
</script>

<style lang="scss" scoped>
body {
  display: inline;
  //width: 100%;
  background-color: #1d1d1d;
  margin: 10px;
  font-family: helvetica;
  align-self: center;
  align-items: center;
}

.grid-layout {
  position: relative;
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(25%, 1fr));
  grid-gap: 10px;
  grid-auto-rows: minmax(240px, auto);
  grid-auto-flow: dense;
  padding: 10px;
}

.grid-item {
  padding: 1rem;
  position: relative;
  font-size: 14px;
  font-weight: bold;
  text-transform: uppercase;
  color: #929796;
  background-color: #333;
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

.card {
  //width: 220px;
  //max-width: 240px;
  //min-width: 120px;
  //height: 220px;
  background-color: #292929;
  margin: 20px;
  border-radius: 10px;
  box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.24);
  border: 2px solid rgba(7, 7, 7, 0.12);
  font-size: 16px;
  transition: all 0.3s ease;
  //position: relative;
  display: inline-block;
  //justify-content: center;
  align-items: center;
  flex-direction: column;
  cursor: pointer;
  transition: all 0.3s ease;
  // overflow: hidden;
}

.icon {
  margin: 0 auto;
  width: 100%;
  height: 80px;
  max-width: 80px;
  background: linear-gradient(
    90deg,
    #7495c7 0%,
    #4d50e9 40%,
    rgba(0, 0, 0, 0.28) 60%
  );
  border-radius: 100%;
  display: flex;
  justify-content: center;
  align-items: center;
  color: white;
  transition: all 0.8s ease;
  background-position: 0px;
  background-size: 200px;
}

.material-icons.md-18 {
  font-size: 18px;
}
.material-icons.md-24 {
  font-size: 24px;
}
.material-icons.md-36 {
  font-size: 36px;
}
.material-icons.md-48 {
  font-size: 48px;
}

.card .title {
  width: 100%;
  margin: 0;
  text-align: center;
  margin-top: 30px;
  color: white;
  font-weight: 600;
  text-transform: uppercase;
  letter-spacing: 4px;
}

.card .text {
  width: 80%;
  margin: 0 auto;
  font-size: 13px;
  text-align: center;
  margin-top: 10px;
  color: white;
  font-weight: 200;
  letter-spacing: 1px;
  opacity: 0;
  max-height: 0;
  //transition: all 0.3s ease;
}

.card:hover .info {
  height: 70%;
}

.card:hover .text {
  transition: all 0.3s ease;
  opacity: 2;
  max-height: 40px;
}

.card:hover .icon {
  background-position: -120px;
  transition: all 0.3s ease;
}

.card:hover .icon i {
  background: linear-gradient(90deg, #7495c7, #4d50e9);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  opacity: 1;
  transition: all 0.3s ease;
}
</style>
