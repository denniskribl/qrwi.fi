<template>
  <mdb-footer color="green" class="font-small pt-3" dark>
    <mdb-container class="text-center">
      <mdb-row>
        <mdb-col sm="12" class="footer-notice">
          Made with ♥ by <a href="https://twitter.com/denniskrb_"><strong>Dennis Kribl</strong></a>
        </mdb-col>
      </mdb-row>
    </mdb-container>
  </mdb-footer>
</template>

<script lang="ts">
import {
  mdbFooter, mdbContainer, mdbRow, mdbCol,
} from 'mdbvue';

export default {
  name: 'FooterPage',
  components: {
    mdbFooter,
    mdbContainer,
    mdbRow,
    mdbCol,
  },
};
</script>

<style scoped>
  .footer-notice {
    margin-bottom: .8rem;
  }
</style>
