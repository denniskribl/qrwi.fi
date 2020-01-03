# qrwi.fi

> :key: :unlock: Let your family and friends connect to your wifi the **easy way**
>
> https://qrwi.fi

## About

This project was created for me to gain some experience in frontend tech.  
Coming from an operations background this may not be your usual web project :grin:

Caution: there might be dragons

## Architecture

This website is hosted in AWS using
* S3
* Cloudfront
* Route53
* ACM

Everything is written in terraform and can be found
in [infrastructure/](./infrastructure).

Deployment is made via Github actions and can be found 
in [.github/workflows/main.yml](./.github/workflows/main.yml).

This project makes great use of
* :sparkles: typescript w/ vue-class-component
* :art: mdb
* :left_right_arrow: vue-slider-component 

## Developer guide

Start development server

```bash
yarn serve
```

Lint 

```bash
yarn lint
```

Build prod

```bash
yarn build
```
