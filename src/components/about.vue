<template>
  <!-- eslint-disable max-len -->
  <mdb-container>
    <div class="about">
      <h2 class="text-center anchor" id="about">About</h2>
      <hr class="my-4 rgba-white-light">
      <div class="row d-flex justify-content-center">
        <div class="justify-content-center col-md-6 about-text">
          <form>
            <p>
              Welcome to qrwi.fi<br><br>
              This website lets you generate a qr code which can be used to access your wifi by rendering the
              authentication data into it.<br><br>
              Just fill in the form and point your smartphone's camera to the generated qr code. You should get a
              notification stating to join the wifi network.<br><br>
              This is especially handy when introducing new guests to your home and having a qr code ready to easily
              join your wifi network.<br><br>
              A cool idea also might be to download, print and tape the qr code somewhere. Or you know if you really
              feel fancy, frame it and hang it somewhere <br>
            </p>
          </form>
        </div>
      </div>
    </div>
  </mdb-container>
</template>

<script lang="ts">
import Vue from 'vue';
import Component from 'vue-class-component';
import { mdbContainer } from 'mdbvue';

@Component({
  name: 'About',
  components: {
    mdbContainer,
  },
})

export default class About extends Vue {}

</script>

<style scoped>
  .about-text {
    font-size: 1.2rem;
    margin-top: 2rem;
    margin-bottom: 24rem;
    max-width: 730px;
  }

  h2 {
    font-size: 2.5rem;
    font-weight: lighter;
    color: #545454;
  }
</style>
