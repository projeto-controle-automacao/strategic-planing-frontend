<template>
  <div class="grid-layout">
    <div class="card grid-item-1" @click="modal()">
      <div class="icon">
        <i class="fa fa-plus-square" style="font-size:48px;color:balck"></i>
      </div>
      <p class="title">Nova Empresa</p>
    </div>
    <div
      class="card grid-item-2"
      v-for="(empresa, i) in empresas"
      :key="empresa.id"
      @click="irParaPerfil(empresa.id)"
    >
      <div class="icon">
        <i class="fa fa-gear" style="font-size:48px;color:black"></i>
      </div>
      <p class="title">{{ empresa.company_name }}</p>
      <p class="text">{{empresa.fancy_name}}</p>
      <p class="text">CNPJ: {{empresa.CNPJ}}</p>
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
        confirmButtonColor: "#4d50e9",
        cancelButtonColor: "#a84141",
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
              confirmButtonColor: "#4d50e9",
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
  min-width: 120px;
  //height: 220px;
  background-color: rgb(150, 165, 175);
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
  color: black;
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
  color: black;
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
  color: black;
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
  background: linear-gradient(90deg, black, #4d50e9);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  opacity: 1;
  transition: all 0.3s ease;
}
</style>