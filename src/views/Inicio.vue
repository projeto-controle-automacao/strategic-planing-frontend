<template>
  <div>
    <div class="conteiner">
      <div class="flip">
        <div class="front" :style="{ backgroundImage: 'url(' + require('@/assets/bg1.png') + ')' }">
          <h1 class="text-shadow">PLANEJAMENTO ESTRATÉGICO</h1>
        </div>
        <div class="back">
          <h2>Planejamento estratégico</h2>
          <p>Tenha sua empresa na palma da mão. Com a nossa ferramenta de planejamento estratégico, saiba onde concentrar forças e fazer sua empresa crescer</p>
          <button @click="acessarPlanejamento" class="brk-btn">Acessar plataforma</button>
        </div>
      </div>

      <!-- <div class="flip">
        <div class="front" :style="{ backgroundImage: 'url(' + require('@/assets/bg2.jpg') + ')' }">
          <h1 class="text-shadow">Controle de Agronegócio</h1>
        </div>
        <div class="back">
          <h2>Angular</h2>
          <p>Tenha sua produção na palma da mão. Com a nossa ferramenta de planejamento de agronegócio, saiba onde concentrar forças e fazer sua produção crescer</p>
        </div>
      </div> -->
    </div>
  </div>
</template>

<script>
export default {
  methods: {
    acessarPlanejamento() {
      this.$router.push({ name: "login" });
    }
  }
};
</script>

<style lang="scss">
@import url("https://fonts.googleapis.com/css?family=Roboto+Mono");

* {
  box-sizing: border-box;
  font-weight: normal;
}

body {
  color: #555;
  background: rgb(212, 209, 209);
  text-align: center;
  font-family: "Roboto Mono";
  padding: 1em;
}

h1 {
  color: black;
  font-size: 2.5em;
}

.row {
  display: flex;
  flex-direction: row;
  flex-wrap: wrap;
  width: 100%;
  justify-content: center;
  align-items: center;
}
// base
.flip {
  position: relative;
  > .front,
  > .back {
    display: block;
    transition-timing-function: cubic-bezier(0.175, 0.885, 0.32, 1.275);
    transition-duration: 0.5s;
    transition-property: transform, opacity;
  }
  > .front {
    transform: rotateY(0deg);
  }
  > .back {
    position: absolute;
    opacity: 0;
    top: 0px;
    left: 0px;
    width: 100%;
    height: 100%;
    transform: rotateY(-180deg);
  }
  &:hover {
    > .front {
      transform: rotateY(180deg);
    }
    > .back {
      opacity: 1;
      transform: rotateY(0deg);
    }
  }
  &.flip-vertical {
    > .back {
      transform: rotateX(-180deg);
    }
    &:hover {
      > .front {
        transform: rotateX(180deg);
      }
      > .back {
        transform: rotateX(0deg);
      }
    }
  }
  button {
    margin-top: 45px;
    cursor: pointer;
  }
}

// custom
.flip {
  position: relative;
  display: inline-block;
  margin-right: 10px;
  margin-bottom: 1em;
  width: 600px;
  > .front,
  > .back {
    display: block;
    color:  black;
    width: inherit;
    background-size: cover !important;
    background-position: center !important;
    height: 320px;
    padding: 1em 2em;
    background: rgb(150, 165, 175);
    border-radius: 10px;
    p {
      font-size: 1.18rem;
      line-height: 160%;
      color: black;
    }
  }
}

.text-shadow {
  text-shadow: 1px 1px rgba(0, 0, 0, 0.04), 2px 2px rgba(0, 0, 0, 0.04),
    3px 3px rgba(0, 0, 0, 0.04), 4px 4px rgba(0, 0, 0, 0.04),
    0.125rem 0.125rem rgba(0, 0, 0, 0.04), 6px 6px rgba(0, 0, 0, 0.04),
    7px 7px rgba(0, 0, 0, 0.04), 8px 8px rgba(0, 0, 0, 0.04),
    9px 9px rgba(0, 0, 0, 0.04), 0.3125rem 0.3125rem rgba(0, 0, 0, 0.04),
    11px 11px rgba(0, 0, 0, 0.04), 12px 12px rgba(0, 0, 0, 0.04),
    13px 13px rgba(0, 0, 0, 0.04), 14px 14px rgba(0, 0, 0, 0.04),
    0.625rem 0.625rem rgba(0, 0, 0, 0.04), 16px 16px rgba(0, 0, 0, 0.04),
    17px 17px rgba(0, 0, 0, 0.04), 18px 18px rgba(0, 0, 0, 0.04),
    19px 19px rgba(0, 0, 0, 0.04), 1.25rem 1.25rem rgba(0, 0, 0, 0.04);
}

.brk-btn {
  position: relative;
  background: none;
  color: rgb(47, 64, 161);
  text-transform: uppercase;
  text-decoration: none;
  border: 0.2em solid rgb(47, 64, 161);
  padding: 0.5em 1em;
  &::before {
    content: "";
    display: block;
    position: absolute;
    width: 10%;
    background: rgb(150, 165, 175);
    height: 0.3em;
    right: 20%;
    top: -0.21em;
    transform: skewX(-45deg);
    -webkit-transition: all 0.45s cubic-bezier(0.86, 0, 0.7, 1);
    transition: all 0.45s cubic-bezier(0.86, 0, 0.07, 1);
  }
  &::after {
    content: "";
    display: block;
    position: absolute;
    width: 10%;
    background: rgb(150, 165, 175);
    height: 0.3em;
    left: 20%;
    bottom: -0.25em;
    transform: skewX(45deg);
    -webkit-transition: all 0.45s cubic-bezier(0.86, 0, 0.07, 1);
    transition: all 0.45s cubic-bezier(0.86, 0, 0.07, 1);
  }
  &:hover {
    &::before {
      right: 80%;
    }
    &::after {
      left: 80%;
    }
  }
}
</style>
