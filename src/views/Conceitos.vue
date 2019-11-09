<template>
  <div>
    <h1>Planejamento</h1>
    <div class="page">
      <label class="field a-field a-field_a1">
        <input
          class="field__input a-field__input"
          v-model="form.planejamento"
          placeholder="Explique motivo do planejamento"
          required
        />
        <span class="a-field__label-wrap">
          <span class="a-field__label">Planejamento</span>
        </span>
      </label>
      <label class="field a-field a-field_a1">
        <input
          class="field__input a-field__input"
          v-model="form.duracao"
          placeholder="Em meses"
          number
          required
        />
        <span class="a-field__label-wrap">
          <span class="a-field__label">Duração</span>
        </span>
      </label>
    </div>
    <div>
      <div class="mahi_holder">
        <div class="container">
          Consolidação da Visão
          <input type="text" name v-model="visao" />
          Consolidação da Missão
          <input type="text" name v-model="missao" />
          Consolidação dos valores
          <input type="text" name :v-model="valores" />
          <div>
            <h2 @click="selecionar('visao')">Visão</h2>
          </div>
          <div v-if="selecionado=='visao'">
            <div class="row">
              <div class="col-6" v-for="(campo, i) in campos1" :key="i">
                <label class="effect-1">Campo {{i+1}}</label>
                <multiselect
                  v-model="valores1[i]"
                  :options="campos1[i]"
                  :searchable="true"
                  :close-on-select="true"
                  :show-labels="false"
                  placeholder="Selecione"
                ></multiselect>
              </div>
            </div>
            <button class="btn btn-success" @click="selecionar('')">Confirmar</button>
          </div>
        </div>
        <div>
          <h2 @click="selecionar('missao')">Missão</h2>
        </div>
        <div v-if="selecionado=='missao'">
          <div class="row">
            <div class="col-6" v-for="(campo, i) in campos2" :key="i">
              <label class="effect-1">Campo {{i+1}}</label>
              <multiselect
                v-model="valores2[i]"
                :options="campos2[i]"
                :searchable="true"
                :close-on-select="true"
                :show-labels="false"
                placeholder="Selecione"
              ></multiselect>
            </div>
          </div>
          <button class="btn btn-success" @click="selecionar('')">Confirmar</button>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import Axios from "axios";
import Multiselect from "vue-multiselect";

export default {
  components: {
    Axios,
    Multiselect
  },
  data: () => ({
    token: "",
    form: {
      planejamento: "",
      duracao: ""
    },
    campos1: [],
    valores1: [],
    campos2: [],
    valores2: [],
    selecionado: "",
    valores: "",
  }),
  async mounted() {
    this.token = localStorage.token;
    await this.buscarEmpresa();
    await this.buscarFrasesVisao();
    await this.buscarFraseMissao();
  },
  computed: {
    visao() {
      return this.valores1.join(" ");
    },
    missao() {
      return this.valores2.join(" ");
    }
  },
  methods: {
    buscarEmpresa() {
      let id = this.$route.params.empresa;
      Axios.get(
        `http://127.0.0.1:8000/api/v1/companies/${id}/company-profile`,
        {
          headers: { Authorization: `Bearer ${this.token}` }
        }
      )
        .then(res => {
          console.log(res);
          //this.empresas = res.data;
        })
        .catch(err => {
          console.log("error", "nao consegui buscar as empresas");
        });
    },
    onInput(val) {
      val = "";
    },
    async buscarFrasesVisao() {
      await Axios.get(`http://127.0.0.1:8000/api/v1/getByPillar/2`, {
        headers: { Authorization: `Bearer ${this.token}` }
      })
        .then(res => {
          let ant = res.data[0].field_id;
          let aux = [];
          let atu;
          // console.log(res.data);
          res.data.forEach(element => {
            atu = element.field_id;
            if (atu === ant) {
              aux.push(element.expression);
            } else {
              this.campos1.push(aux);
              aux = [];
              aux.push(element.expression);
            }
            ant = atu;
          });
          this.campos1.push(aux);
          // console.log(this.campos1);
        })
        .catch(err => {
          console.log("error", "nao consegui buscar as empresa");
        });
    },
    async buscarFraseMissao() {
      await Axios.get(`http://127.0.0.1:8000/api/v1/getByPillar/1`, {
        headers: { Authorization: `Bearer ${this.token}` }
      })
        .then(res => {
          let ant = res.data[0].field_id;
          let aux = [];
          let atu;
          // console.log(res.data);
          res.data.forEach(element => {
            atu = element.field_id;
            if (atu === ant) {
              aux.push(element.expression);
            } else {
              this.campos2.push(aux);
              aux = [];
              aux.push(element.expression);
            }
            ant = atu;
          });
          this.campos2.push(aux);
          // console.log(this.campos1);
        })
        .catch(err => {
          console.log("error", "nao consegui buscar as empresa");
        });
    },
    selecionar(campo) {
      if(this.selecionado === campo){
        this.selecionado = "";
      } else {
        this.selecionado = campo;
      }
    }
  }
};
</script>

<style scoped>
@import "~vue-multiselect/dist/vue-multiselect.min.css";

/*
=====
LEVEL 1. RESET STYLES
=====
*/
@import "~vue-multiselect/dist/vue-multiselect.min.css";

.field {
  --uiFieldPlaceholderColor: var(--fieldPlaceholderColor, #767676);
}

.field__input {
  background-color: #5555;
  border-radius: 0;
  border: none;

  -webkit-appearance: none;
  -moz-appearance: none;

  font-family: inherit;
  font-size: 1em;
}

.field__input:focus::-webkit-input-placeholder {
  color: var(--uiFieldPlaceholderColor);
}

.field__input:focus::-moz-placeholder {
  color: var(--uiFieldPlaceholderColor);
  opacity: 1;
}

/*
=====
LEVEL 2. CORE STYLES
=====
*/

.a-field {
  display: inline-block;
}

.a-field__input {
  display: block;
  box-sizing: border-box;
  width: 100%;
}

.a-field__input:focus {
  outline: none;
}

/*
=====
LEVEL 3. PRESENTATION STYLES
=====
*/

/* a-field */

.a-field {
  --uiFieldHeight: var(--fieldHeight, 40px);
  --uiFieldBorderWidth: var(--fieldBorderWidth, 2px);
  --uiFieldBorderColor: var(--fieldBorderColor);

  --uiFieldFontSize: var(--fieldFontSize, 1em);
  --uiFieldHintFontSize: var(--fieldHintFontSize, 1em);

  --uiFieldPaddingRight: var(--fieldPaddingRight, 15px);
  --uiFieldPaddingBottom: var(--fieldPaddingBottom, 15px);
  --uiFieldPaddingLeft: var(--fieldPaddingLeft, 15px);

  position: relative;
  box-sizing: border-box;
  font-size: var(--uiFieldFontSize);
  padding-top: 1em;
}

.a-field__input {
  height: var(--uiFieldHeight);
  padding: 0 var(--uiFieldPaddingRight) 0 var(--uiFieldPaddingLeft);
  border-bottom: var(--uiFieldBorderWidth) solid var(--uiFieldBorderColor);
}

.a-field__input::-webkit-input-placeholder {
  opacity: 0;
  transition: opacity 0.2s ease-out;
}

.a-field__input::-moz-placeholder {
  opacity: 0;
  transition: opacity 0.2s ease-out;
}

.a-field__input:not(:placeholder-shown) ~ .a-field__label-wrap .a-field__label {
  opacity: 0;
  bottom: var(--uiFieldPaddingBottom);
}

.a-field__input:focus::-webkit-input-placeholder {
  opacity: 1;
  transition-delay: 0.2s;
}

.a-field__input:focus::-moz-placeholder {
  opacity: 1;
  transition-delay: 0.2s;
}

.a-field__label-wrap {
  box-sizing: border-box;
  width: 100%;
  height: var(--uiFieldHeight);

  pointer-events: none;
  cursor: text;

  position: absolute;
  bottom: 0;
  left: 0;
}

.a-field__label {
  position: absolute;
  left: var(--uiFieldPaddingLeft);
  bottom: calc(50% - 0.5em);

  line-height: 1;
  font-size: var(--uiFieldHintFontSize);

  pointer-events: none;
  transition: bottom 0.2s cubic-bezier(0.9, -0.15, 0.1, 1.15),
    opacity 0.2s ease-out;
  will-change: bottom, opacity;
}

.a-field__input:focus ~ .a-field__label-wrap .a-field__label {
  opacity: 1;
  bottom: var(--uiFieldHeight);
}

/* a-field_a1 */

.a-field_a1 .a-field__input {
  transition: border-color 0.2s ease-out;
  will-change: border-color;
}

.a-field_a1 .a-field__input:focus {
  border-color: var(--fieldBorderColorActive);
}

/* a-field_a2 */

.a-field_a2 .a-field__label-wrap::after {
  content: "";
  box-sizing: border-box;
  width: 0;
  height: var(--uiFieldBorderWidth);
  background-color: var(--fieldBorderColorActive);

  position: absolute;
  bottom: 0;
  left: 0;

  will-change: width;
  transition: width 0.285s ease-out;
}

.a-field_a2 .a-field__input:focus ~ .a-field__label-wrap::after {
  width: 100%;
}

/* a-field_a3 */

.a-field_a3 {
  padding-top: 1.5em;
}

.a-field_a3 .a-field__label-wrap::after {
  content: "";
  box-sizing: border-box;
  width: 100%;
  height: 0;

  opacity: 0;
  border: var(--uiFieldBorderWidth) solid var(--fieldBorderColorActive);

  position: absolute;
  bottom: 0;
  left: 0;

  will-change: opacity, height;
  transition: height 0.2s ease-out, opacity 0.2s ease-out;
}

.a-field_a3 .a-field__input:focus ~ .a-field__label-wrap::after {
  height: 100%;
  opacity: 1;
}

.a-field_a3 .a-field__input:focus ~ .a-field__label-wrap .a-field__label {
  bottom: calc(var(--uiFieldHeight) + 0.5em);
}

/*
=====
LEVEL 4. SETTINGS
=====
*/

.field {
  --fieldBorderColor: #7495c7;
  --fieldBorderColorActive: #4d50e9;
}

/*
=====
DEMO
=====
*/

body {
  font-family: -apple-system, BlinkMacSystemFont, Segoe UI, Roboto, Open Sans,
    Ubuntu, Fira Sans, Helvetica Neue, sans-serif;
  margin: 0;

  min-height: 100vh;
  display: flex;
  flex-direction: column;
}

.page {
  box-sizing: border-box;
  width: 100%;
  max-width: 1000px;
  margin: auto;
  padding: 15px;
  position: center;
  display: grid;
  grid-gap: 20px;
  align-items: flex-end;
  order: 1;
}

@media (min-width: 481px) {
  .page {
    grid-template-columns: repeat(auto-fill, minmax(350px, 1fr));
  }
}

/* INPUTS */

:focus {
  outline: none;
}

/* necessary to give position: relative to parent. */
input[type="text"] {
  font: 15px/24px "Muli", sans-serif;
  color: #333;
  width: 100%;
  box-sizing: border-box;
  letter-spacing: 1px;
}

:focus {
  outline: none;
}

.col-3 {
  float: left;
  width: 27.33%;
  margin: 40px 3%;
  position: relative;
} /* necessary to give position: relative to parent. */
input[type="text"] {
  font: 15px/24px "Lato", Arial, sans-serif;
  color: #333;
  width: 100%;
  box-sizing: border-box;
  letter-spacing: 1px;
}

.col-6 {
  float: left;
  width: 40.33%;
  margin: 40px 3%;
  position: relative;
} /* necessary to give position: relative to parent. */
input[type="text"] {
  font: 15px/24px "Lato", Arial, sans-serif;
  color: #333;
  width: 100%;
  box-sizing: border-box;
  letter-spacing: 1px;
}

.effect-1,
.effect-2,
.effect-3 {
  border: 0;
  padding: 7px 0;
  border-bottom: 1px solid #ccc;
}

.effect-1 ~ .focus-border {
  position: absolute;
  bottom: 0;
  left: 0;
  width: 0;
  height: 2px;
  background-color: #64b366;
  transition: 0.4s;
}
.effect-1:focus ~ .focus-border {
  width: 100%;
  transition: 0.4s;
}

.effect-2 ~ .focus-border {
  position: absolute;
  bottom: 0;
  left: 50%;
  width: 0;
  height: 2px;
  background-color: #64b366;
  transition: 0.4s;
}
.effect-2:focus ~ .focus-border {
  width: 100%;
  transition: 0.4s;
  left: 0;
}

.effect-3 ~ .focus-border {
  position: absolute;
  bottom: 0;
  left: 0;
  width: 100%;
  height: 2px;
  z-index: 99;
}
.effect-3 ~ .focus-border:before,
.effect-3 ~ .focus-border:after {
  content: "";
  position: absolute;
  bottom: 0;
  left: 0;
  width: 0;
  height: 100%;
  background-color: #64b366;
  transition: 0.4s;
}
.effect-3 ~ .focus-border:after {
  left: auto;
  right: 0;
}
.effect-3:focus ~ .focus-border:before,
.effect-3:focus ~ .focus-border:after {
  width: 50%;
  transition: 0.4s;
}
input {
  background-color: #5555;
  color: #ccc !important;
}
</style>
