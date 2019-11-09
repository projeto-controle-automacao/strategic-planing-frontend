<template>
  <div>
    <div class="wrapper">
      <div class="box">
        <div class="content">
              <p> {{ conceitos.missao }} </p>
        </div>
      </div>
      <div class="box">
        <div class="content">
              <p> {{ conceitos.visao }} </p>
        </div>
      </div>
      <div class="box">
        <div class="content">
              <p> {{ conceitos.valores }} </p>
        </div>
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
        horizonte: '',
        duracao: '',
        missao: '',
        visao: '',
        valores: '',
    },
    swot: [],
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
    },
  }
};
</script>

<style lang="scss" scoped>
@import url(https://fonts.googleapis.com/css?family=Electrolize);

// settings
$text-color: #ffb902;
$line-color: #ffb902;
$line-size: 7;

// general
body {
  font-family: "Electrolize", sans-serif;
  background: #070707;
  overflow: hidden;
}

// magic wrapper
.wrapper {
  // @include translateCenter;
  width: 100%;
  text-align: center;
  display: table;
}

//
//  Corners mixin (MAGIC BE HERE!)
//
@mixin line-corners(
  $line-color: cyan,
  $line-size: 7,
  $line-type: out,
  $line-distance: 20
) {
  position: absolute;
  width: 100%;

  transition-duration: 0.3s;

  // arrows
  &:before,
  &:after {
    content: "";

    position: absolute;

    width: $line-size + px;
    height: $line-size + px;

    border-color: $line-color;
    border-style: solid;

    transition-duration: 0.3s;
    transform: translateZ(0);
  }

  // top corners
  &.top {
    &:before {
      border-width: 1px 0 0 1px;
    }
    &:after {
      border-width: 1px 1px 0 0;
    }
  }

  // bottom corners
  &.bottom {
    &:before {
      border-width: 0 0 1px 1px;
    }
    &:after {
      border-width: 0 1px 1px 0;
    }
  }

  @if $line-type == out {
    &:before {
      left: 0;
    }
    &:after {
      right: 0;
    }
    &.top {
      top: 0;
    }
    &.bottom {
      bottom: $line-size + px;
    }
  }

  @if $line-type == in {
    &:before {
      left: $line-distance + px;
    }
    &:after {
      right: $line-distance + px;
    }
    &.top {
      top: $line-distance + px;
    }
    &.bottom {
      bottom: ($line-distance + $line-size) + px;
    }
  }
}

@mixin line-corners-hover($line-size: 7, $line-type: out, $line-distance: 20) {
  @if $line-type == out {
    &:before {
      left: 0;
    }
    &:after {
      right: 0;
    }
    &.top {
      top: 0;
    }
    &.bottom {
      bottom: $line-size + px;
    }
  }

  @if $line-type == in {
    &:before {
      left: $line-distance + px;
    }
    &:after {
      right: $line-distance + px;
    }
    &.top {
      top: $line-distance + px;
    }
    &.bottom {
      bottom: ($line-distance + $line-size) + px;
    }
  }
}

// style: borders out (edge)
@mixin line-corners-out($line-color: cyan, $line-size: 7) {
  .corners {
    @include line-corners($line-color, $line-size, out);
  }
  &:hover {
    .corners {
      @include line-corners-hover($line-size, in);
    }
  }
}

// style: borders in
@mixin line-corners-in($line-color: cyan, $line-size: 7) {
  .corners {
    @include line-corners($line-color, $line-size, in);
  }
  &:hover {
    .corners {
      @include line-corners-hover($line-size, out);
    }
  }
}
//
// @end: Corners mixin
//

//
// magic buttons
//
.bttn {
  display: inline-block;
  vertical-align: middle;
  position: relative;

  margin: 20px;

  // text
  span {
    display: block;
    padding: 30px;

    font-size: 30px;
    color: $text-color;
    text-transform: uppercase;

    transition: all 0.3s ease-out;
  }

  &:hover {
    cursor: pointer;
  }

  // include corners
  &.out {
    @include line-corners-out(cyan);
  }

  &.in {
    @include line-corners-in($line-color);
  }
}

.bttn {
  //opacity: 0;

  //will-change: transform, opacity;
  //animation: fadeIn 0.6s 0.5s forwards ease-out;

  // cyan theme
  &.cyan {
    $theme-color: cyan;
    span {
      color: $theme-color;
    }
    .corners {
      &:after,
      &:before {
        border-color: $theme-color;
      }
    }
  }
}

//
//  magic box
//

.box {
  display: inline-block;
  vertical-align: middle;
  position: relative;

  max-width: 20%;

  .content {
    margin: 20px;
    padding: 20px;

    //background: #131313;
    border: 1px dashed rgba(0, 255, 255, 0.5);

    color: cyan;
    font-size: 14px;
    line-height: 1.3;
  }

  // include corners
  @include line-corners-out(cyan);
}

//
//  Animations
//

@keyframes fadeIn {
  from {
    opacity: 0;
    transform: translateY(50%);
  }

  to {
    opacity: 1;
    transform: translateY(0%);
  }
}
</style>