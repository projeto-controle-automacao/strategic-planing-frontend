<template>
  <div>
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
@import "~vue-multiselect/dist/vue-multiselect.min.css";
@import url("https://fonts.googleapis.com/css?family=Raleway:400,200");
body {
  font-family: Helvetica, san-serif;
  background: -webkit-linear-gradient(
    90deg,
    #00aaee 10%,
    #dd2476 90%
  ); /* Chrome 10+, Saf5.1+ */
  background: -moz-linear-gradient(
    90deg,
    #00aaee 10%,
    #dd2476 90%
  ); /* FF3.6+ */
  background: -ms-linear-gradient(90deg, #00aaee 10%, #dd2476 90%); /* IE10 */
  background: -o-linear-gradient(
    90deg,
    #00aaee 10%,
    #dd2476 90%
  ); /* Opera 11.10+ */
  background: linear-gradient(90deg, #00aaee 10%, #dd2476 90%); /* W3C */
}
.transition {
  transition: 0.3s cubic-bezier(0.3, 0, 0, 1.3);
}
.card {
  background-color: #fff;
  bottom: 0;
  box-shadow: 0px 0px 10px 2px rgba(0, 0, 0, 0.3);
  -webkit-box-shadow: 0px 0px 10px 2px rgba(0, 0, 0, 0.3);
  -moz-box-shadow: 0px 0px 10px 2px rgba(0, 0, 0, 0.3);
  height: 300px;
  left: 0;
  margin: auto;
  overflow: hidden;
  position: relative;
  right: 0;
  top: 0;
  width: 300px;
}
.card:hover {
  height: 450px;
  width: 300px;
}
.card:hover .cta-container {
  display: inline;
  margin-top: 380px;
}
.card:hover .card_circle {
  background-size: cover;
  border-radius: 0;
  margin-top: -130px;
}
.card:hover h2 {
  background: #3487f7;
  color: #fff;
  margin-top: 100px;
  padding: 5px;
}
.card:hover h2 small {
  color: #fff;
}
.card:hover p {
  margin-top: 300px;
}
.card_circle {
  background: url("http://lorempixel.com/400/200") no-repeat center bottom;
  background-color: #3487f7;
  background-size: cover;
  border-radius: 50%;
  height: 400px;
  margin-left: -75px;
  margin-top: -270px;
  position: absolute;
  width: 450px;
}
h2 {
  color: #3487f7;
  font-family: "Raleway", sans-serif;
  font-size: 24px;
  font-weight: 200;
  margin-top: 150px;
  position: absolute;
  text-align: center;
  width: 100%;
  z-index: 9999;
}
p {
  color: rgba(0, 0, 0, 0.6);
  font-family: "Raleway", sans-serif;
  font-size: 100%;
  font-weight: normal;
  margin-top: 200px;
  position: absolute;
  text-align: center;
  z-index: 9999;
}
.cta-container {
  display: none;
  margin-top: 320px;
  position: absolute;
  text-align: center;
  width: 100%;
  z-index: 9999;
}
.cta {
  -moz-border-radius: 2px;
  -moz-transition: 0.2s ease-out;
  -ms-transition: 0.2s ease-out;
  -o-transition: 0.2s ease-out;
  -webkit-border-radius: 2px;
  -webkit-transition: 0.2s ease-out;
  background-clip: padding-box;
  border: 2px solid #3487f7;
  border-radius: 2px;
  color: #3487f7;
  display: inline-block;
  font-family: "Raleway", sans-serif;
  font-size: 17px;
  font-weight: 400;
  height: 36px;
  letter-spacing: 0.5px;
  line-height: 36px;
  margin-bottom: 15px;
  padding: 0 2rem;
  text-decoration: none;
  text-transform: uppercase;
  transition: 0.2s ease-out;
}
.cta:hover {
  background-color: #3487f7;
  box-shadow: 0 8px 17px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
  color: #fff;
  -moz-box-shadow: 0 8px 17px 0 rgba(0, 0, 0, 0.2),
    0 6px 20px 0 rgba(0, 0, 0, 0.19);
  -webkit-box-shadow: 0 8px 17px 0 rgba(0, 0, 0, 0.2),
    0 6px 20px 0 rgba(0, 0, 0, 0.19);
}
</style>
