<template>
  <div class="wrapper container">
    <div class="content row">
      <div class="card col" @click="modal()">
        <div class="icon">
          <i class="fa fa-plus-square" style="font-size:48px;color:white"></i>
        </div>
        <p class="title">Novo Plano</p>
      </div>
      <div
        class="card col"
        v-for="(planejamento, i) in planejamentos"
        :key="planejamento.id"
        @click="irParaPlanejamento(id_empresa, planejamento.id)"
      >
        <div class="icon">
          <i class="fa fa-cubes" style="font-size:48px;color:white"></i>
        </div>
        <p class="title"> Plano {{ i + 1 }}</p>
        <p class="text"> Duração {{ planejamento.deadline }}</p>
      </div>
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
    id_empresa: '',
    token: "",
    planejamentos: [],
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
      this.$router.push({ name: "planejamento", params: { empresa: empresa,  planejamento: planejamento} });
      //console.log();
    },
  }
};
</script>

<style lang="scss" scoped>
body {
  width: 100%;
  background-color: #1d1d1d;
  margin: 0;
  font-family: helvetica;
}

.about {
  @import url("https://fonts.googleapis.com/css?family=Rubik:300,400");
  background-color: #2c303a;
  width: 100%;
  // height: 50px;
  position: center;
  bottom: 0;
  color: #888888;
  display: initial;
  justify-content: center;
  align-items: center;
  font-family: "Rubik", sans-serif;
  text-transform: uppercase;
  font-size: 12px;
  letter-spacing: 1px;
  font-weight: 300;
  z-index: 3;
  border-bottom: solid 1px #131418;

  a {
    color: white;
    margin: 0 3px;
    padding: 2px 3px;
    text-decoration: none;
    position: relative;
    transition: all 0.3s ease;
    z-index: 1;
    display: flex;
    align-items: center;
    &:after {
      content: "";
      position: absolute;
      width: calc(100% - 6px);
      height: 1px;
      background-color: #46b7a7;
      bottom: 0;
      transition: all 0.3s ease;
    }
    &:before {
      content: "";
      position: absolute;
      width: 0;
      height: 0px;
      background-color: #b74646;
      right: 0;
      bottom: 0;
      transition: all 0.3s 0.3s ease;
      z-index: -1;
    }

    &:hover {
      &:after {
        width: 0;
        left: 0;
      }

      &:before {
        width: 100%;
        height: 100%;
        left: 0;
      }
    }
  }

  .one {
    width: 2px;
    height: 20px;
    background-color: #444857;
    margin: 0 10px 0 5px;
  }
  .two {
    width: 4px;
    height: 4px;
    border-radius: 100%;
    background-color: #444857;
    margin: 0 5px;
  }
}

.wrapper {
  width: 90vw;
  margin: 0 auto;
  height: 90vh;
  padding: 10px;
  background-color: #161616;
  display: block;
  justify-content: center;
  align-items: relative;
  position: relative;
  transition: all 0.3s ease;
}

@media screen and (max-width: 767px) {
  .wrapper {
    //height: 8000px;
    //display: block;
  }
}

.content {
  // max-width: 1024px;
  width: 100%;
  padding: 0 4%;
  padding-top: 200px;
  padding-bottom: 200px;
  margin: 0 auto;
  display: inline-flex;
  justify-content: center;
  align-items: stretch;
}

@media screen and (max-width: 767px) {
  .content {
    padding-top: 300px;
    flex-direction: column;
  }
}

.card {
  width: 220px;
  //max-width: 240px;
  //min-width: 120px;
  height: 220px;
  background-color: #292929;
  margin: 10px;
  border-radius: 10px;
  box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.24);
  border: 2px solid rgba(7, 7, 7, 0.12);
  font-size: 16px;
  transition: all 0.3s ease;
  position: relative;
  display: inline-block;
  justify-content: center;
  align-items: center;
  flex-direction: column;
  cursor: pointer;
  transition: all 0.3s ease;
  overflow: hidden;
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

// .card::-webkit-scrollbar {
//   display: none;
// }

.card:hover {
  // overflow-y: scroll;
  height: auto;
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
