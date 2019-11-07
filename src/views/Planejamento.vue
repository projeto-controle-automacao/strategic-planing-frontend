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
      <div>
        <h2 @click="selecionar('visao')">Visao</h2>
      </div>
      <div class="mahi_holder">
        <div class="container">
          <div v-if="selecionado=='visao'">
            <input type="text" name v-model="visao" />

            <div class="row col-12">
              <div class="col-3">
                <label class="typo__label">Campo1</label>
                <multiselect
                  v-model="value1"
                  :options="campo1"
                  :searchable="true"
                  :close-on-select="true"
                  :show-labels="false"
                  placeholder="Selecione"
                ></multiselect>
              </div>
              <div class="col-3">
                <label class="typo__label">Campo2</label>
                <multiselect
                  v-model="value2"
                  :options="campo2"
                  :searchable="true"
                  :close-on-select="true"
                  :show-labels="false"
                  placeholder="Selecione"
                ></multiselect>
              </div>
              <div class="col-3">
                <label class="typo__label">Campo3</label>
                <multiselect
                  v-model="value3"
                  :options="campo3"
                  :searchable="true"
                  :close-on-select="true"
                  :show-labels="false"
                  placeholder="Selecione"
                ></multiselect>
              </div>
              <div class="col-3">
                <label class="typo__label">Campo4</label>
                <multiselect
                  v-model="value4"
                  :options="campo4"
                  :searchable="true"
                  :close-on-select="true"
                  :show-labels="false"
                  placeholder="Selecione"
                ></multiselect>
              </div>
            </div>
            <div class="row">
              <div class="col-3">
                <label class="typo__label">Campo5</label>
                <multiselect
                  v-model="value5"
                  :options="campo5"
                  :searchable="true"
                  :close-on-select="true"
                  :show-labels="false"
                  placeholder="Selecione"
                ></multiselect>
              </div>
              <div class="col-3">
                <label class="typo__label">Campo6</label>
                <multiselect
                  v-model="value6"
                  :options="campo6"
                  :searchable="true"
                  :close-on-select="true"
                  :show-labels="false"
                  placeholder="Selecione"
                ></multiselect>
              </div>
              <div class="col-3">
                <label class="typo__label">Campo7</label>
                <multiselect
                  v-model="value7"
                  :options="campo7"
                  :searchable="true"
                  :close-on-select="true"
                  :show-labels="false"
                  placeholder="Selecione"
                ></multiselect>
              </div>
              <div class="col-3">
                <label class="typo__label">Campo8</label>
                <multiselect
                  v-model="value8"
                  :options="campo8"
                  :searchable="true"
                  :close-on-select="true"
                  :show-labels="false"
                  placeholder="Selecione"
                ></multiselect>
              </div>
            </div>
            <div class="row">
              <div class="col-3">
                <label class="typo__label">Campo9</label>
                <multiselect
                  v-model="value9"
                  :options="campo9"
                  :searchable="true"
                  :close-on-select="true"
                  :show-labels="false"
                  placeholder="Selecione"
                ></multiselect>
              </div>
              <div class="col-3">
                <label class="typo__label">Campo10</label>
                <multiselect
                  v-model="value10"
                  :options="campo10"
                  :searchable="true"
                  :close-on-select="true"
                  :show-labels="false"
                  placeholder="Selecione"
                ></multiselect>
              </div>
              <div class="col-3">
                <label class="typo__label">Campo11</label>
                <multiselect
                  v-model="value11"
                  :options="campo11"
                  :searchable="true"
                  :close-on-select="true"
                  :show-labels="false"
                  placeholder="Selecione"
                ></multiselect>
              </div>
              <div class="col-3">
                <label class="typo__label">Campo12</label>
                <multiselect
                  v-model="value12"
                  :options="campo12"
                  :searchable="true"
                  :close-on-select="true"
                  :show-labels="false"
                  placeholder="Selecione"
                ></multiselect>
              </div>
            </div>
            <div class="row">
              <div class="col-3">
                <label class="typo__label">Campo13</label>
                <multiselect
                  v-model="value13"
                  :options="campo13"
                  :searchable="true"
                  :close-on-select="true"
                  :show-labels="false"
                  placeholder="Selecione"
                ></multiselect>
              </div>
            </div>
          </div>
        </div>
      </div>
      <h2 @click="selecionar('missao')">Missao</h2>
      <div class="container" v-if="selecionado == 'missao'">
        <div class="row bg_1">
          <div class="col-3">
            <input class="effect-1" type="text" placeholder="Placeholder Text" />
            <span class="focus-border"></span>
          </div>
          <div class="col-3">
            <input class="effect-2" type="text" placeholder="Placeholder Text" />
            <span class="focus-border"></span>
          </div>
          <div class="col-3">
            <input class="effect-3" type="text" placeholder="Placeholder Text" />
            <span class="focus-border"></span>
          </div>
          <div class="col-3">
            <input class="effect-4" type="text" placeholder="Placeholder Text" />
            <span class="focus-border"></span>
          </div>
          <div class="col-3">
            <input class="effect-5" type="text" placeholder="Placeholder Text" />
            <span class="focus-border"></span>
          </div>
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
    selecionado: "",
    campo1: [],
    value1: "",
    campo2: [],
    value2: "",
    campo3: [],
    value3: "",
    campo4: [],
    value4: "",
    campo5: [],
    value5: "",
    campo6: [],
    value6: "",
    campo7: [],
    value7: "",
    campo8: [],
    value8: "",
    campo9: [],
    value9: "",
    campo10: [],
    value10: "",
    campo11: [],
    value11: "",
    campo12: [],
    value12: "",
    campo13: [],
    value13: ""
  }),
  mounted() {
    this.token = localStorage.token;
    this.buscarEmpresa();
    this.buscarFrases();
  },
  computed: {
    visao() {
      return (
        this.checaNull(this.value1) +
        this.checaNull(this.value2) +
        this.checaNull(this.value3) +
        this.checaNull(this.value4) +
        this.checaNull(this.value5) +
        this.checaNull(this.value6) +
        this.checaNull(this.value7) +
        this.checaNull(this.value8) +
        this.checaNull(this.value8) +
        this.checaNull(this.value9) +
        this.checaNull(this.value10) +
        this.checaNull(this.value11) +
        this.checaNull(this.value12) +
        this.checaNull(this.value13)
      );
    }
  },
  watch:{
    "this.value1"(){
      // if(this.value1 == null){
      //   this.value1 = ""
      // }
      console.log(this.value1);
    }
  },
  methods: {
    checaNull(val){
      if(!val){
        val = ""
      }else {
        val += " "
      }
      return val;
    },
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
    buscarFrases() {
      Axios.get(`http://127.0.0.1:8000/api/v1/getByPillar/2`, {
        headers: { Authorization: `Bearer ${this.token}` }
      })
        .then(res => {
          res.data.forEach(element => {
            if (element.field_id == 1) {
              this.campo1.push(element.expression);
            }
            if (element.field_id == 2) {
              this.campo2.push(element.expression);
            }
            if (element.field_id == 3) {
              this.campo3.push(element.expression);
            }
            if (element.field_id == 4) {
              this.campo4.push(element.expression);
            }
            if (element.field_id == 5) {
              this.campo5.push(element.expression);
            }
            if (element.field_id == 6) {
              this.campo6.push(element.expression);
            }
            if (element.field_id == 7) {
              this.campo7.push(element.expression);
            }
            if (element.field_id == 8) {
              this.campo8.push(element.expression);
            }
            if (element.field_id == 9) {
              this.campo9.push(element.expression);
            }
            if (element.field_id == 10) {
              this.campo10.push(element.expression);
            }
            if (element.field_id == 11) {
              this.campo11.push(element.expression);
            }
            if (element.field_id == 12) {
              this.campo12.push(element.expression);
            }
            if (element.field_id == 13) {
              this.campo13.push(element.expression);
            }
          });
        })
        .catch(err => {
          console.log("error", "nao consegui buscar as empresas");
        });
    },
    selecionar(campo) {
      this.selecionado = campo;
    }
  }
};
</script>

<style scoped>
/*
=====
LEVEL 1. RESET STYLES
=====
*/

.field {
  --uiFieldPlaceholderColor: var(--fieldPlaceholderColor, #767676);
}

.field__input {
  background-color: transparent;
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
  --fieldBorderColor: #d1c4e9;
  --fieldBorderColorActive: #673ab7;
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

  display: grid;
  grid-gap: 20px;
  align-items: flex-end;
  order: 1;
}

@media (min-width: 481px) {
  .page {
    grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
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
  background-color: #4caf50;
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
  background-color: #4caf50;
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
  background-color: #4caf50;
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
</style>
