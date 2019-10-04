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
        <button @click="modal">Perfil e Planejamento</button>
      </li>
    </ul>
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
            .then(async () => {
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
            });
        }
      }
    },

    async novaEmpresa() {
      let vm = this;
      this.$swal
        .mixin({
          input: "text",
          confirmButtonText: "Próximo &rarr;",
          showCancelButton: true,
          progressSteps: ["1", "2", "3"]
        })
        .queue([
          {
            title: "Empresa",
            text: "Como sua empresa se chama?"
          },
          "CNPJ",
          {
            title: "Nome fantasia"
          }
        ])
        .then(result => {
          if (result.value) {
            this.FormEmpresa.nome = result.value[0];
            this.FormEmpresa.CNPJ = result.value[1];
            this.FormEmpresa.fantasia = result.value[2];
            this.$swal.fire({
              title: "Pronto!",
              html:
                "Dados da empresa: <pre><code>" +
                "<h3><b>Nome:</b> " +
                result.value[0] +
                "</h3>" +
                "<h3><b>CNPJ:</b> " +
                result.value[1] +
                "</h3>" +
                "<h3><b>Nome fantasia:</b> " +
                result.value[2] +
                "</h3>" +
                "</code></pre>",
              confirmButtonText: "Cadastrar!",
              showCancelButton: true,
              showLoaderOnConfirm: true,
              preConfirm: async result => {}
            });
          }
        });
    },
    teste() {
      this.$swal.showLoading();
    }
  }
};
</script>
<style lang="scss" scoped>
.tilesWrap {
  padding: 0;
  margin: 50px auto;
  list-style: none;
  text-align: center;
}
.tilesWrap li {
  display: inline-block;
  width: 20%;
  min-width: 200px;
  max-width: 230px;
  padding: 80px 20px 40px;
  position: relative;
  vertical-align: top;
  margin: 10px;
  font-family: "helvetica", san-serif;
  min-height: 25vh;
  background: #262a2b;
  border: 1px solid #252727;
  text-align: left;
}
.tilesWrap li h2 {
  font-size: 114px;
  margin: 0;
  position: absolute;
  opacity: 0.2;
  top: 50px;
  right: 10px;
  transition: all 0.3s ease-in-out;
}
.tilesWrap li h3 {
  font-size: 16px;
  color: #b7b7b7;
  margin-bottom: 5px;
}
.tilesWrap li p {
  font-size: 16px;
  line-height: 18px;
  color: #b7b7b7;
  margin-top: 5px;
}
.tilesWrap li button {
  background: transparent;
  border: 1px solid #b7b7b7;
  padding: 10px 20px;
  color: #b7b7b7;
  border-radius: 3px;
  position: relative;
  transition: all 0.3s ease-in-out;
  transform: translateY(-40px);
  opacity: 0;
  cursor: pointer;
  overflow: hidden;
}
.tilesWrap li button:before {
  content: "";
  position: absolute;
  height: 100%;
  width: 120%;
  background: #b7b7b7;
  top: 0;
  opacity: 0;
  left: -140px;
  border-radius: 0 20px 20px 0;
  z-index: -1;
  transition: all 0.3s ease-in-out;
  cursor: pointer;
}
.tilesWrap li:hover button {
  transform: translateY(5px);
  opacity: 1;
}
.tilesWrap li button:hover {
  color: #262a2b;
}
.tilesWrap li button:hover:before {
  left: 0;
  opacity: 1;
}
.tilesWrap li:hover h2 {
  top: 0px;
  opacity: 0.6;
}

.tilesWrap li:before {
  content: "";
  position: absolute;
  top: -2px;
  left: -2px;
  right: -2px;
  bottom: -2px;
  z-index: -1;
  background: #fff;
  transform: skew(2deg, 2deg);
}
.tilesWrap li:after {
  content: "";
  position: absolute;
  width: 40%;
  height: 100%;
  left: 0;
  top: 0;
  background: rgba(255, 255, 255, 0.02);
}
.tilesWrap li:nth-child(1):before {
  background: #c9ffbf;
  background: -webkit-linear-gradient(to right, #ffafbd, #c9ffbf);
  background: linear-gradient(to right, #ffafbd, #c9ffbf);
}
.tilesWrap li:nth-child(2):before {
  background: #f2709c;
  background: -webkit-linear-gradient(to right, #ff9472, #f2709c);
  background: linear-gradient(to right, #ff9472, #f2709c);
}
.tilesWrap li:nth-child(3):before {
  background: #c21500;
  background: -webkit-linear-gradient(to right, #ffc500, #c21500);
  background: white;
}
.tilesWrap li:nth-child(4):before {
  background: #fc354c;
  background: -webkit-linear-gradient(to right, #0abfbc, #fc354c);
  background: white;
}
</style>
