<template>
  <div>
    <mdb-navbar dark color="green darken-1" position="top">
      <mdb-navbar-brand href="https://qrwi.fi">
        <img width="65%" height="65%" src="@/assets/qrwi.fi-white-200x98.png">
      </mdb-navbar-brand>
      <mdb-navbar-toggler>
        <mdb-navbar-nav right>
          <mdb-nav-item href="#generate">QR-Code</mdb-nav-item>
          <mdb-nav-item href="#about">About</mdb-nav-item>
          <mdb-nav-item href="#privacy">Privacy</mdb-nav-item>
        </mdb-navbar-nav>
      </mdb-navbar-toggler>
    </mdb-navbar>
  </div>
</template>

<script lang="ts">
import Vue from 'vue';
import Component from 'vue-class-component';
import {
  mdbNavbar, mdbNavItem, mdbNavbarNav, mdbNavbarToggler, mdbNavbarBrand,
} from 'mdbvue';

@Component({
  name: 'Navbar',
  components: {
    mdbNavbar,
    mdbNavItem,
    mdbNavbarNav,
    mdbNavbarToggler,
    mdbNavbarBrand,
  },
})

export default class Navbar extends Vue {}
</script>
