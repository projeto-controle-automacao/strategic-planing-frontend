<template>
  <div
    class="login-wrap"
    :style="{ backgroundImage: 'url(' + require('@/assets/login.jpg') +  ')' }"
  >
    <div class="login-html">
      <input id="tab-1" type="radio" name="tab" class="sign-in" checked />
      <label for="tab-1" class="tab">Entrar</label>
      <input id="tab-2" type="radio" name="tab" class="sign-up" />
      <label for="tab-2" class="tab">CADASTRAR</label>
      <div class="login-form">
        <div class="sign-in-htm">
          <div class="group">
            <label for="email" class="label">Email</label>
            <input type="email" class="input" v-model="formulario.email" />
          </div>
          <div class="group">
            <label for="pass" class="label">Senha</label>
            <input type="password" class="input" data-type="password" v-model="formulario.senha" />
          </div>
          <div class="group btn-pad">
            <input @click="login" type="submit" class="button cursor" value="Entrar" />
          </div>
          <div class="hr"></div>
          <div class="foot-lnk">
            <a href="#forgot">Esqueceu a senha?</a>
          </div>
        </div>
        <div class="sign-up-htm">
          <div class="group">
            <label for="user" class="label">Nome</label>
            <input type="text" class="input" v-model="formulario.nameCadastro" />
          </div>
          <div class="group">
            <label for="pass" class="label">Senha</label>
            <input
              type="password"
              class="input"
              data-type="password"
              v-model="formulario.senhaCadastro"
            />
          </div>
          <div class="group">
            <label for="pass" class="label">Repita a senha</label>
            <input type="password" class="input" data-type="password" />
          </div>
          <div class="group">
            <label for="pass" class="label">Email</label>
            <input type="text" class="input" v-model="formulario.emailCadastro" />
          </div>
          <div class="group btn-pad">
            <input @click="cadastrar" type="submit" class="button cursor" value="Cadastrar" />
          </div>
          <div class="hr"></div>
          <div class="foot-lnk">
            <label for="tab-1">Já possui conta?</label>
          </div>
        </div>
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
    formulario: {
      email: "",
      senha: "",

      nameCadastro: "",
      emailCadastro: "",
      senhaCadastro: ""
    }
  }),
  methods: {
    login() {
      Axios.post("http://127.0.0.1:8000/api/v1/login", {
        email: this.formulario.email,
        password: this.formulario.senha
      })
        .then(res => {
          localStorage.setItem("token", res.data.token);
          this.$router.push({ name: "home_usuario" });
        })
        .catch(err => {
          this.$notify({
            group: "foo",
            title: "Erro no login",
            text: "Verifique email e senha",
            type: "error"
          });
        });
    },

    cadastrar() {
      Axios.post("http://127.0.0.1:8000/api/v1/users", {
        name: this.formulario.nameCadastro,
        email: this.formulario.emailCadastro,
        password: this.formulario.senhaCadastro
      })
        .then(res => {
          (this.formulario.nameCadastro = ""),
            (this.formulario.emailCadastro = ""),
            (this.formulario.senhaCadastro = ""),
                     this.$notify({
            group: "foo",
            title: "Sucesso!",
            text: "Usuário Cadastrado",
            type: "success"
          });
        })
        .catch(err => {
          this.$notify({
            group: "foo",
            title: "Erro no cadastro",
            text: "Não foi possível cadastrar o usuário",
            type: "error"
          });
        });
    }
  }
};
</script>

<style lang="scss" scoped>
*,
:after,
:before {
  box-sizing: border-box;
}
.clearfix:after,
.clearfix:before {
  content: "";
  display: table;
}
.clearfix:after {
  clear: both;
  display: block;
}
a {
  color: inherit;
  text-decoration: none;
}
.login-wrap {
  width: 100%;
  margin: auto;
  max-width: 525px;
  min-height: 670px;
  position: relative;
  box-shadow: 0 12px 15px 0 rgba(0, 0, 0, 0.24),
    0 17px 50px 0 rgba(0, 0, 0, 0.19);
  color: #8a8a8a;
  font: 600 16px/18px "Open Sans", sans-serif;
}
.login-html {
  width: 100%;
  height: 100%;
  position: absolute;
  padding: 90px 70px 50px 70px;
  background: rgba(0, 0, 0, 0.7);
}
.login-html .sign-in-htm,
.login-html .sign-up-htm {
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  position: absolute;
  transform: rotateY(180deg);
  backface-visibility: hidden;
  transition: all 0.4s linear;
}
.login-html .sign-in,
.login-html .sign-up,
.login-form .group .check {
  display: none;
}
.login-html .tab,
.login-form .group .label,
.login-form .group .button {
  text-transform: uppercase;
}
.login-html .tab {
  font-size: 22px;
  margin-right: 15px;
  padding-bottom: 5px;
  margin: 0 15px 10px 0;
  display: inline-block;
  border-bottom: 2px solid transparent;
}
.login-html .sign-in:checked + .tab,
.login-html .sign-up:checked + .tab {
  color: #fff;
  border-color: rgb(47, 64, 161);
}
.login-form {
  min-height: 345px;
  position: relative;
  perspective: 1000px;
  transform-style: preserve-3d;
}
.login-form .group {
  margin-bottom: 15px;
}
.login-form .group .label,
.login-form .group .input,
.login-form .group .button {
  width: 100%;
  color: #000;
  font-size: 16px;
  display: block;
}
.login-form .group .input,
.login-form .group .button {
  border: none;
  padding: 15px 20px;
  border-radius: 25px;
  background: rgba(255, 255, 255, 0.6);
}
.login-form .group input[data-type="password"] {
  text-security: circle;
  -webkit-text-security: circle;
}
.login-form .group .label {
  color: #fff;
  font-size: 16px;
}
.login-form .group .button {
  background: rgb(47, 64, 161);
}
.login-form .group label .icon {
  width: 15px;
  height: 15px;
  border-radius: 2px;
  position: relative;
  display: inline-block;
  background: rgba(255, 255, 255, 0.1);
}
.login-form .group label .icon:before,
.login-form .group label .icon:after {
  content: "";
  width: 10px;
  height: 2px;
  background: #fff;
  position: absolute;
  transition: all 0.2s ease-in-out 0s;
}
.login-form .group label .icon:before {
  left: 3px;
  width: 5px;
  bottom: 6px;
  transform: scale(0) rotate(0);
}
.login-form .group label .icon:after {
  top: 6px;
  right: 0;
  transform: scale(0) rotate(0);
}
.login-form .group .check:checked + label {
  color: #fff;
}
.login-form .group .check:checked + label .icon {
  background: #1161ee;
}
.login-form .group .check:checked + label .icon:before {
  transform: scale(1) rotate(45deg);
}
.login-form .group .check:checked + label .icon:after {
  transform: scale(1) rotate(-45deg);
}
.login-html
  .sign-in:checked
  + .tab
  + .sign-up
  + .tab
  + .login-form
  .sign-in-htm {
  transform: rotate(0);
}
.login-html .sign-up:checked + .tab + .login-form .sign-up-htm {
  transform: rotate(0);
}
.hr {
  height: 2px;
  margin: 60px 0 50px 0;
  background: rgba(255, 255, 255, 0.2);
}
.foot-lnk {
  text-align: center;
  color: #ddd;
}
.btn-pad {
  padding-top: 20px;
}
.cursor {
  cursor: pointer;
}
</style>
