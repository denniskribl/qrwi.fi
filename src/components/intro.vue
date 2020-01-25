<template>
  <mdb-container>
    <div class="main text-center animated fadeInRight slow">
      <h2>Let your family and friends connect to your wifi <br>
        <b>the easy way</b></h2><br>
        <div class="get-started-div text-center animated pulse delay-2s">
            <mdb-icon fas icon="angle-down" class="angle-down"/>
              <b><a class="get-started" href="#generate">GET STARTED</a></b>
            <mdb-icon fas icon="angle-down" class="angle-down"/>
        </div>
    </div>
  </mdb-container>
</template>

<script lang="ts">
import Vue from 'vue';
import Component from 'vue-class-component';
import { mdbContainer, mdbIcon } from 'mdbvue';

@Component({
  name: 'Intro',
  components: {
    mdbContainer,
    mdbIcon,
  },
})

export default class Intro extends Vue {}

</script>


<style scoped>
  .get-started-div {
    margin-top: 1rem;
  }

  .get-started {
    font-size: 1.5rem;
    color: #545454;
  }

  i {
    color: #545454;
  }

  .angle-down {
    margin-right: 13px;
    margin-left: 13px;
  }

  h2 {
    font-weight: lighter;
    color: #545454;
    font-size: 3rem;
  }

  .main {
    margin: 10rem 2rem 20rem;
    text-align: center;
  }

  @media (min-width: 768px) {
    .main {
      margin-top: 12rem;
      margin-bottom: 10rem;
    }
  }

  @media (min-width: 992px) {
    .main {
      margin-top: 22rem;
      margin-bottom: 28rem;
    }
  }
</style>
