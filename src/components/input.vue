<template>
  <!-- eslint-disable max-len -->
  <mdb-container class="qr-input">
    <div>
      <h2 class="text-center anchor" id="generate">Get your code</h2>
      <hr class="my-4 rgba-white-light">
    </div>
    <div class="row d-flex justify-content-center">
      <form class="qr-forms" v-animate-on-scroll="'fadeInLeft'">
        <div class="grey-text custom-form-inputs justify-content-center col-md-6">
          <div class="custom-input-1">
            <label class="qr-label">1. Type in your SSID</label>
            <mdb-input class="custom-input" v-model.lazy="ssid" label="SSID" icon="wifi" size="lg" outline/>
          </div>
          <div class="custom-input-2">
            <div>
              <label class="qr-label">2. Type in your passphrase</label>
            </div>
            <mdb-input v-model.lazy="password" label="WIFI Password"
                       small="The password is only processed locally on your computer and never sent anywhere"
                       type="password" icon="lock" size="lg" outline/>
          </div>
          <mdb-collapse :toggleTag="['a']" :togglers="1" :toggleClass="['']" :toggleText="['› Advanced options']"
                        class="more-options-toggle">
            <div class="more-options">
              <div class="more-options-encryption">
                <label>Encryption type:</label><br>
                <div class="custom-control radio-inline custom-radio custom-control-inline">
                  <input v-model="encryptionType" v-bind:value="'WPA'" checked="checked" type="radio" name="radioInline"
                         class="custom-control-input" id="defaultInline1">
                  <label class="custom-control-label" for="defaultInline1">WPA</label>
                </div>
                <div class="custom-control radio-inline custom-radio custom-control-inline">
                  <input v-model="encryptionType" v-bind:value="'WEP'" type="radio" name="radioInline"
                         class="custom-control-input" id="defaultInline2">
                  <label class="custom-control-label" for="defaultInline2">WEP</label>
                </div>
              </div>
              <div class="more-options-ssid-hidden">
                <label>SSID:</label><br>
                <div class="custom-control custom-checkbox custom-control-inline">
                  <input v-model="isSSIDHidden" type="checkbox" class="custom-control-input" id="ssidHiddenCheckbox">
                  <label class="custom-control-label" for="ssidHiddenCheckbox">Hidden?</label>
                </div>
                <div class="more-options-qr-code-size">
                  <label class="text-grey">QR Code Size:</label>
                  <vue-slider
                    id="qrCodeSizeSlider"
                    :tooltip="'none'"
                    :adsorb="true"
                    contained="true"
                    :marks="false"
                    :included="true"
                    :data="qrCodeSize"
                    v-model="qrCodeSizeSelected"/>
                  <label for="qrCodeSizeSlider" class="text-grey">{{qrCodeSizeSelected.charAt(0).toUpperCase() +
                    qrCodeSizeSelected.slice(1)}}</label>
                </div>
              </div>
            </div>
          </mdb-collapse>
        </div>
        <div class="text-center">
          <mdb-btn type="button" outline="success" @click.native="openModal">
            <mdb-icon far icon="paper-plane" class="ml-1"/>
            Generate
          </mdb-btn>
        </div>
      </form>
    </div>
    <mdb-modal size="lg" :show="showModal" @close="closeModal">
      <mdb-modal-header>
        <mdb-modal-title tag="h4" bold>Generated QR Code</mdb-modal-title>
      </mdb-modal-header>
      <mdb-modal-body>
        <div class="text-center mt-4">
          <qriously
            ref="qr-code"
            v-if=isModalActiveHelper
            :value="this.buildQRString()"
            :size="this.namedQRCodeSizeToNumber()"/>
        </div>
      </mdb-modal-body>
      <mdb-modal-footer center>
        <a
          download="qrwi-fi.png"
          :href="qrCode"
          @click="saveCode('qr-code')"
          class="btn btn-success btn-outline-success">
          <mdb-icon icon="save"/>
          Download
        </a>
      </mdb-modal-footer>
    </mdb-modal>
  </mdb-container>
</template>

<script lang="ts">
import Vue from 'vue';
import Component from 'vue-class-component';
import {
  mdbInput,
  mdbBtn,
  mdbContainer,
  mdbIcon,
  mdbModal,
  mdbModalHeader,
  mdbModalTitle,
  mdbModalBody,
  mdbModalFooter,
  mdbCollapse,
  animateOnScroll,
} from 'mdbvue';

@Component({
  name: 'Input',
  components: {
    mdbInput,
    mdbIcon,
    mdbBtn,
    mdbContainer,
    mdbModal,
    mdbModalHeader,
    mdbModalTitle,
    mdbModalBody,
    mdbModalFooter,
    mdbCollapse,
  },
  directives: {
    animateOnScroll,
  },
})

export default class Input extends Vue {
  ssid: string = '';

  isSSIDHidden: boolean = false;

  password: string = '';

  encryptionType: string = 'WPA';

  qrCode: string = '';

  qrCodeSize: Array<string> = ['small', 'medium', 'large'];

  qrCodeSizeSelected: string = 'small';

  showModal: boolean = false;

  isModalActiveHelper: boolean = false;

  // eslint-disable-next-line max-len
  buildQRString(): string {
    // as in https://github.com/zxing/zxing/wiki/Barcode-Contents#wi-fi-network-config-android-ios-11
    return `WIFI:S:${Input.escapeSpecialChars(this.ssid)};T:${this.encryptionType};P:${Input.escapeSpecialChars(this.password)};${this.isSSIDHidden ? 'H:true' : ''};`;
  }

  saveCode(ref: string): void {
    const component = (this as any).$refs[ref];
    const canvas = component.$refs.qrcode;
    this.qrCode = canvas.toDataURL('image/png');
  }

  // helper functions
  static escapeSpecialChars(str: string) {
    return str.replace(/[;\\:,"]/g, '\\$&');
  }

  namedQRCodeSizeToNumber(): number {
    type sizeLookupTable = {
      [key: string]: number;
    };
    const lookupTable: sizeLookupTable = {
      small: 200,
      medium: 400,
      large: 600,
    };
    return lookupTable[this.qrCodeSizeSelected];
  }

  // modal helper
  closeModal(): void {
    this.showModal = false;
    this.isModalActiveHelper = false;
  }

  openModal(): void {
    this.showModal = true;
    // hacky workaround - i am not experienced enough to get why the modal was being
    // re-rendered when opened so i did it the old school way
    // "what ever floats the boat" right :grin:?
    setTimeout(() => {
      this.isModalActiveHelper = true;
    }, 10);
  }
}
</script>

<style scoped>

  /*here be dragons*/

  .more-options {
    margin-left: .5rem;
  }

  .more-options-qr-code-size {
    margin-top: 2rem;
    margin-right: .2rem;
  }

  .more-options-toggle {
    margin-left: 2.2rem;
    margin-bottom: 2rem;
  }

  .more-options-ssid-hidden {
    margin-top: 2rem;
  }

  .qr-input {
    margin-bottom: 15rem;
  }

  .custom-input-1 {
    margin-bottom: 2.5rem;
  }

  .qr-forms {
    margin-top: 1rem;
  }

  .more-options {
    color: #757575;
    box-sizing: content-box;
    margin-top: 1.5rem;
    margin-bottom: 2.5rem;
  }

  .qr-label {
    font-size: 1.7rem;
    margin-bottom: .8rem;
    color: #757575;
  }

  .custom-control-input:focus ~ .custom-control-label::before {
    box-shadow: 0 0 0 0.2rem rgba(47, 204, 118, .25);;
    -webkit-box-shadow: 0 0 0 0.2rem rgba(47, 204, 118, .25);;
  }

  .custom-control-input:checked ~ .custom-control-label::before {
    color: #fff;
    border-color: #2fcc76;
    background-color: #2fcc76;
  }

  .custom-form-inputs {
    max-width: 730px;
  }

  .anchor {
    padding-top: 130px;
  }

</style>