<template>
  <mdb-footer color="green" class="font-small pt-3" dark>
    <mdb-container class="text-center">
      <mdb-row>
        <mdb-col sm="12" class="footer-notice">
          Made with ♥ by <strong>Dennis Kribl</strong>
        </mdb-col>
        <mdb-col sm="12" class="footer-notice">
          <a href="https://github.com/denniskribl/qrwi.fi"><mdb-icon fab icon="github" class="plug"/></a>
          <a href="https://twitter.com/denniskrb_"><mdb-icon fab icon="twitter" class="plug"/></a>
          <a href="https://www.linkedin.com/in/dennis-kribl-721339162/"><mdb-icon fab icon="linkedin" class="plug"/></a>
        </mdb-col>
      </mdb-row>
    </mdb-container>
  </mdb-footer>
</template>

<script lang="ts">
import Vue from 'vue';
import Component from 'vue-class-component';
import {
  mdbFooter, mdbContainer, mdbRow, mdbCol, mdbIcon,
} from 'mdbvue';

@Component({
  name: 'Footer',
  components: {
    mdbFooter,
    mdbContainer,
    mdbRow,
    mdbCol,
    mdbIcon,
  },
})

export default class Footer extends Vue {}

</script>

<style scoped>
  .plug {
    margin-left: 15px;
    margin-right: 15px;
  }
  .footer-notice {
    margin-bottom: .8rem;
  }
</style>
