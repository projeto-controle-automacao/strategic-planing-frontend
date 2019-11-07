<template>
  <!-- <div>
    <h1>Minhas empresas</h1>
    <button @click="modal">Nova empresa</button>
    <ul class="tilesWrap">
      <li v-for="(empresa, i) in empresas" :key="empresa.id">
        <h2>0{{ i + 1 }}</h2>
        <h3>Razão social: {{ empresa.company_name }}</h3>
        <p>Nome fantasia: {{empresa.fancy_name}}</p>
        <p></p>
        <p>CNPJ: {{empresa.CNPJ}}</p>
        <button @click="irParaPerfil(empresa.id)">Perfil e Planejamento</button>
      </li>
    </ul>
  </div>-->

  <div class="wrapper container">
    <div class="content row">
      <div class="card col">
        <div class="icon">
          <i class="fas fa-edi" style="font-size:48px;"></i>
        </div>
      </div>
      <div class="card col" v-for="(empresa, i) in empresas" :key="empresa.id">
        <p class="title">{{ empresa.company_name }}</p>
        <p class="text">Nome fantasia: {{empresa.fancy_name}}</p>
        <p class="text">CNPJ: {{empresa.CNPJ}}</p>
      </div>
    </div>
  </div>
  <!-- <div>
    <div class="card transition" v-for="(empresa, i) in empresas" :key="empresa.id">
      <h2 class="transition">Awesome Headline</h2>
      <p>Aenean lacinia bibendum nulla sed consectetur. Donec ullamcorper nulla non metus auctor fringilla.</p>
      <div class="cta-container transition">
        <a href="#" @click="modal" class="cta">Call to action</a>
      </div>
      <div class="card_circle transition"></div>
    </div>
  </div> -->
</template>

<script>
import Axios from "axios";
export default {
  components: {
    Axios
  },
  data: () => ({
    token: "",
    empresas: [],
    FormEmpresa: {
      nome: "",
      CNPJ: "",
      fantasia: ""
    }
  }),

  mounted() {
    this.token = localStorage.token;
    this.buscarEmpresas();
  },
  methods: {
    buscarEmpresas() {
      Axios.get("http://127.0.0.1:8000/api/v1/companies", {
        headers: { Authorization: `Bearer ${this.token}` }
      })
        .then(res => {
          //console.log(res.data);
          //console.log(...res.data);
          //this.empresas.push({...res.data})
          this.empresas = res.data;
        })
        .catch(err => {
          console.log("error", "nao consegui buscar as empresas");
        });
    },
    irParaPerfil(id) {
      this.$router.push({ name: "perfil-empresa", params: { empresa: id } });

      console.log(id);
    },

    async modal() {
      const { value: formValues } = await this.$swal.fire({
        background: "#222",
        confirmButtonColor: "green",
        title: "Cadastro de Empresa",
        confirmButtonText: "Cadastrar",
        showCancelButton: true,
        html:
          '<input id="swal-input1" class="swal2-input" placeholder="Empresa" >' +
          '<input id="swal-input2" class="swal2-input" placeholder="CNPJ">' +
          '<input id="swal-input3" class="swal2-input" placeholder="Nome fantasia">',

        focusConfirm: false,
        preConfirm: () => {
          return [
            document.getElementById("swal-input1").value,
            document.getElementById("swal-input2").value,
            document.getElementById("swal-input3").value
          ];
        }
      });
      if (formValues) {
        if (!formValues[0]) {
          this.$swal.fire({
            background: "#222",
            html:
              "<h2>Nome da empresa obrigatório</h2> <pre><code>" +
              "</code></pre>"
          });
        } else {
          this.$swal
            .fire({
              focusConfirm: false,

              background: "#222",
              confirmButtonColor: "green",
              confirmButtonText: "Confirmar!",
              showCancelButton: true,
              html:
                "<h3>Dados da empresa</h3> <pre><code>" +
                "<h3><b>Nome:</b> " +
                formValues[0] +
                "</h3>" +
                "<h3><b>CNPJ:</b> " +
                formValues[1] +
                "</h3>" +
                "<h3><b>Nome fantasia:</b> " +
                formValues[2] +
                "</h3>" +
                "</code></pre>"
            })
            .then(async res => {
              if (!res.dismiss) {
                await Axios.post(
                  "http://127.0.0.1:8000/api/v1/companies",
                  {
                    company_name: formValues[0],
                    CNPJ: formValues[1],
                    fancy_name: formValues[2]
                  },
                  {
                    headers: { Authorization: `Bearer ${this.token}` }
                  }
                )
                  .then(response => {
                    this.empresas.push({ ...response.data[0] });
                    this.$notify({
                      group: "foo",
                      title: "Sucesso",
                      text: "Empresa cadastrada",
                      type: "success"
                    });
                  })
                  .catch(err => {
                    this.$notify({
                      group: "foo",
                      title: "Erro ao cadastrar empresa!",
                      type: "error"
                    });
                  });
              }
            });
        }
      }
    }
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
  position: absolute;
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
    margin: 0 5px;
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
      background-color: #46b7a7;
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
  width: 100%;
  margin: 0 auto;
  // height: 400px;
  background-color: #161616;
  display: flex;
  justify-content: center;
  align-items: relative;
  position: relative;
  transition: all 0.3s ease;
}

@media screen and (max-width: 767px) {
  .wrapper {
    //height: 8000px;
  }
}

.content {
  // max-width: 1024px;
  width: 100%;
  padding: 0 4%;
  padding-top: 250px;
  padding-bottom: 250px;
  margin: 0 auto;
  display: flex;
  justify-content: center;
  align-items: center;
}

@media screen and (max-width: 767px) {
  .content {
    padding-top: 300px;
    flex-direction: column;
  }
}

.card {
  width: 100px;
  max-width: 300px;
  min-width: 200px;
  height: 200px;
  background-color: #292929;
  margin: 10px;
  border-radius: 10px;
  box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.24);
  border: 2px solid rgba(7, 7, 7, 0.12);
  font-size: 16px;
  transition: all 0.3s ease;
  position: relative;
  display: inline;
  justify-content: center;
  align-items: center;
  flex-direction: column;
  cursor: pointer;
  transition: all 0.3s ease;
}

.icon {
  margin: 0 auto;
  width: 100%;
  height: 80px;
  max-width: 80px;
  background: linear-gradient(
    90deg,
    #ff7e7e 0%,
    #ff4848 40%,
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
  margin-top: 20px;
  color: white;
  font-weight: 200;
  letter-spacing: 2px;
  opacity: 0;
  max-height: 0;
  transition: all 0.3s ease;
}

.card:hover {
  height: 210px;
}

.card:hover .info {
  height: 90%;
}

.card:hover .text {
  transition: all 0.3s ease;
  opacity: 1;
  max-height: 40px;
}

.card:hover .icon {
  background-position: -120px;
  transition: all 0.3s ease;
}

.card:hover .icon i {
  background: linear-gradient(90deg, #ff7e7e, #ff4848);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  opacity: 1;
  transition: all 0.3s ease;
}
</style>
