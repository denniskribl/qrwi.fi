<template>
  <mdb-container>
    <div class="main text-center animated fadeInRight slow">
      <h2>Let your family and friends connect to your wifi <br>
        <b>the easy way</b></h2>
    </div>
  </mdb-container>
</template>

<script lang="ts">
import Vue from 'vue';
import Component from 'vue-class-component';
import { mdbContainer } from 'mdbvue';

@Component({
  name: 'Intro',
  components: {
    mdbContainer,
  },
})

export default class Intro extends Vue {}

</script>


<style scoped>

  h2 {
    font-weight: lighter;
    color: #545454;
    font-size: 3rem;
  }

  .main {
    margin: 12rem 2rem 20rem;
    text-align: center;
  }

  @media (min-width: 768px) {
    .main {
      margin-top: 15rem;
      margin-bottom: 10rem;
    }
  }

  @media (min-width: 992px) {
    .main {
      margin-top: 24rem;
      margin-bottom: 28rem;
    }
  }
</style>
