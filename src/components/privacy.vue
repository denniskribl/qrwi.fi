<template>
  <!-- eslint-disable max-len -->
  <mdb-container>
    <div class="privacy">
      <h2 class="text-center anchor" id="privacy">Privacy</h2>
      <hr class="my-4 rgba-white-light">
      <div class="row d-flex justify-content-center">
        <div class="justify-content-center col-md-6 privacy-text">
          <form>
            <p>
              Worried about your privacy? <br>
              You should be! <br><br>
              Always be aware of where you put your sensitive information in. <br><br>
              Here is some information to help you decide whether to use or not to use qrwi.fi:<br> <br>
              This website is 100% <strong>client side rendered</strong><br>
              This means that everything is done <strong>locally in your browser</strong> and <strong>no server</strong> is involved<br>
              so your credentials are <strong>never</strong> sent anywhere.<br><br>
              Not quite convinced yet?<br><br>
              Check out the source code of qrwi.fi. <br>
              It is completely free and open to the whole world:<br>
              <i class="psst">you can also submit issues or contribute there</i><br><br>
              <a href="https://github.com/denniskribl/qrwi.fi">
                <b>https://github.com/denniskribl/qrwi.fi</b>
              </a>
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
  name: 'privacy',
  components: {
    mdbContainer,
  },
})

export default class Privacy extends Vue {}

</script>

<style scoped>
  .privacy-text {
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

  .anchor {
    padding-top: 130px;
  }

  .psst {
    font-size: 1rem;
  }
</style>
