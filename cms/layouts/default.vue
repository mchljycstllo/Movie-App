<template>
  <div>
    <nav-bar />
    <Sidebar v-if="auth_status" />
    <Nuxt />
    <Footer v-if="auth_status" />

    <!-- Content Loader -->
    <transition name="fade">
      <template v-if="getContentLoaderStatus('loader')">
        <content-loader />
      </template>
    </transition>

    <transition name="slide-y">
      <Message 
        v-if="modal_info.show"
      />
    </transition>
  </div>
</template>

<script>
  export default {
    watch:{
      $route (to, from){
        this.runMiddleware()
        this.checkTableSticky()
      }
    },
    mounted () {
      this.setAuth()
      this.checkTableSticky()
      setTimeout(() => {
        this.runMiddleware()
      }, 100)
    }
  }
</script>

<style lang="stylus">
  :root
    --theme_white: #fff
    --theme_black: #000
    --theme_gray: #808080
    --theme_primary: #FF0073
    --theme_error: #D13744
    --theme_snow_white: #FFFAFA
    --theme_modal_head: rgba(0,0,0,.05)
    --theme_info: #438eff
    --theme_danger: #ea5455
    --theme_success: #5cbf69
    --roboto: 'Roboto'
    --light: 300
    --reg: 400
    --med: 500
    --semi: 600
    --bold: 700
    --max_width: 1180px
  #__movie4pp
    transition: .4s ease-in-out

  html
    -webkit-backface-visibility: hidden
    -moz-backface-visibility: hidden
    -ms-backface-visibility: hidden
    -webkit-text-size-adjust: none
    -webkit-font-smoothing: subpixel-antialiased
    backface-visibility: hidden
    font-family: var(--roboto), sans-serif
    font-variant-numeric: lining-nums

    //smooth scroll
    scroll-behavior: smooth


  *,
  *:before,
  *:after
    user-select: none
    box-sizing: border-box
    margin: 0
    word-break: break-word !important
    -webkit-user-drag: none
    font-weight: var(--reg)

  body
    position: relative
    overflow-y: overlay
    overflow-x: hidden
    font-size: 16px
    &.no_click
      pointer-events: none
    &.no_scroll
      overflow-y: hidden
    &::-webkit-scrollbar
      width: 10px
      background-color: rgba(0, 0, 0, 0.15)
    &::-webkit-scrollbar-track
      box-shadow: none
      background-color: transparent
    &::-webkit-scrollbar-thumb
      border-radius: 8px
      background-repeat: no-repeat
      background-clip: padding-box
      background-color: var(--theme_primary)

  ::-webkit-scrollbar-track
    box-shadow: none
    background-color: transparent
  ::-webkit-scrollbar
    width: 7px
    height: 5px
    background-color: rgba(0, 0, 0, 0.15)
  ::-webkit-scrollbar-thumb
    border-radius: 8px
    background-repeat: no-repeat
    background-clip: padding-box
    background-color: var(--theme_primary)

  ::selection
    color: var(--theme_white)
    background-color: var(--theme_primary)

  button
    padding: 0
    border: none
    outline: none
    box-shadow: none
    background-color: transparent

  textarea
    font-family: var(--roboto)
    resize: vertical
    vertical-align: middle

  input,
  input:before,
  input:after,
  textarea,
  textarea:before,
  textarea:after,
  select,
  select:before,
  select:after
    -webkit-appearance: none
    border: none
    outline: none
    box-shadow: none
    user-select: initial
    background-color: transparent
    //font-family: var(--roboto)

  ::-webkit-input-placeholder
    color: #B1B1B1
    font-weight: var(--reg)
    text-transform: none

  :-ms-input-placeholder
    color: #B1B1B1
    font-weight: var(--reg)
    text-transform: none

  ::-webkit-datetime-edit
    color: #B1B1B1
    font-weight: var(--reg)
    text-transform: none

  ::placeholder
    color: #B1B1B1
    font-weight: var(--reg)
    text-transform: none

  input::-webkit-outer-spin-button,
  input::-webkit-inner-spin-button
    -webkit-appearance: none
    margin: 0

  iframe,
  video
    border: none
    outline: none

  input[type=number]
    -moz-appearance: textfield

  picture
    display: block

  h1,
  h2,
  h3,
  h4,
  h5
    font-weight: normal

  table
    width: 100%
    border-collapse: collapse

  table
    width: 100%
    margin: 60px 0
    text-align: center
    thead
      //background-color: var(--theme_primary)
      th
        padding: 30px
        //color: var(--theme_white)
        *
          display: block
        span
          font-size: 14px
          color: rgba(255, 255, 255, 0.6)
    tbody
      tr
        border-bottom: 1px solid #0C0B3326
        td
          padding: 20px
          color: rgba(12, 11, 51, 0.6)
          font-weight: var(--reg)
          strong
            font-weight: var(--semi)
            color: var(--theme_black)

  svg,
  span,
  iframe
    vertical-align: middle

  img
    width: 100%
    height: auto
    vertical-align: middle

  a
    text-decoration: none

  p
    &:empty
      &::before
        content: ' '
        white-space: pre

  .isLoading
    width: 100px !important
    height: auto !important

  .ql-size-huge
    float: left
    padding-right: 10px
    font-family: var(--merri)
    font-size: 70px
    line-height: 1
    color: var(--theme_primary) !important
    transform: translateY(-5px)

  .__swpr
    .swiper-pagination-progressbar
      left: 0
      right: 0
      width: 100%
      max-width: 550px
      height: 5px
      margin: 0 auto
      border-radius: 30px
      background: #F2F2F2
      .swiper-pagination-progressbar-fill
        border-radius: 30px
        background: var(--theme_primary)
    .swiper-pagination-bullets
      left: 0
      right: 0
      bottom: 0
    .swiper-pagination-bullet
      width: 10px
      height: 10px
      margin-right: 20px
      background: #D3D3D3
      opacity: 1
      transition: .4s ease-in-out
      &:last-child
        margin-right: 0
      &.swiper-pagination-bullet-active
        background: var(--theme_primary)
        opacity: 1
    .swiper-button-prev,
    .swiper-button-next
      margin-top: 0
      width: 50px
      height: 50px
      transform: translateY(-50%)
      transition: .4s ease-in-out
      &::after
        content: ''
        font-size: 0
        width: 50px
        height: 50px
        background-position: center
        background-repeat: no-repeat
        background-size: contain
    .swiper-button-prev
      left: -65px
      &::after
        background-image: url('data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxMi4zMDciIGhlaWdodD0iNDIuODMyIiB2aWV3Qm94PSIwIDAgMTIuMzA3IDQyLjgzMiI+CiAgPGcgaWQ9IkNhcm91c2VsX0xlZnRfQnV0dG9uIiBkYXRhLW5hbWU9IkNhcm91c2VsIExlZnQgQnV0dG9uIiB0cmFuc2Zvcm09InRyYW5zbGF0ZSgxLjUgMS45ODYpIj4KICAgIDxwYXRoIGlkPSJJY29uX2ZlYXRoZXItY2hldnJvbi1sZWZ0IiBkYXRhLW5hbWU9Ikljb24gZmVhdGhlci1jaGV2cm9uLWxlZnQiIGQ9Ik0yMi4zMjEsNDcuODYsMTMuNSwyOC40MywyMi4zMjEsOSIgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoLTEzLjUgLTkpIiBmaWxsPSJub25lIiBzdHJva2U9IiNjZWNlY2UiIHN0cm9rZS1saW5lY2FwPSJyb3VuZCIgc3Ryb2tlLWxpbmVqb2luPSJyb3VuZCIgc3Ryb2tlLXdpZHRoPSIzIi8+CiAgPC9nPgo8L3N2Zz4K')
    .swiper-button-next
      right: -65px
      &::after
        background-image: url('data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxMi4zMDciIGhlaWdodD0iNDIuODMyIiB2aWV3Qm94PSIwIDAgMTIuMzA3IDQyLjgzMiI+CiAgPGcgaWQ9IkNhcm91c2VsX1JpZ2h0X0J1dHRvbiIgZGF0YS1uYW1lPSJDYXJvdXNlbCBSaWdodCBCdXR0b24iIHRyYW5zZm9ybT0idHJhbnNsYXRlKDEuOTg2IDEuOTg2KSI+CiAgICA8cGF0aCBpZD0iSWNvbl9mZWF0aGVyLWNoZXZyb24tbGVmdCIgZGF0YS1uYW1lPSJJY29uIGZlYXRoZXItY2hldnJvbi1sZWZ0IiBkPSJNMjIuMzIxLDQ3Ljg2LDEzLjUsMjguNDMsMjIuMzIxLDkiIHRyYW5zZm9ybT0idHJhbnNsYXRlKDIyLjMyMSA0Ny44Nikgcm90YXRlKDE4MCkiIGZpbGw9Im5vbmUiIHN0cm9rZT0iI2NlY2VjZSIgc3Ryb2tlLWxpbmVjYXA9InJvdW5kIiBzdHJva2UtbGluZWpvaW49InJvdW5kIiBzdHJva2Utd2lkdGg9IjMiLz4KICA8L2c+Cjwvc3ZnPgo=')
    &.__swpr--alt
      .swiper-button-prev,
      .swiper-button-next
        width: 100px
        height: 100px
        transform: translateY(-50%)
        &.swiper-button-disabled
          opacity: 0
        &::after
          width: 100px
          height: 100px
    /**
    * Responsive */
    @media (max-width: 1024px) and (min-width: 280px)
      .swiper-button-prev,
      .swiper-button-next
        width: 30px
        height: 30px
        &::after
          width: 30px
          height: 30px
      .swiper-button-prev
        left: 5px
      .swiper-button-next
        right: 5px

  /*
  *** Animations
  */
  .fade-enter-active,
  .fade-leave-active
    transition: .4s ease-in-out

  .fade-enter,
  .fade-leave-to
    opacity: 0

  .searchSlide-enter-active,
  .searchSlide-leave-active
    transition: .4s ease-in-out

  .searchSlide-enter,
  .searchSlide-leave-to
    opacity: 0
    transform: translateY(-100%)

  .slide-x-enter-active,
  .slide-x-leave-active
    transition: .4s ease-in-out

  .slide-x-enter,
  .slide-x-leave-to
    opacity: 0
    transform: translateX(100%)

  .slide-x-alt-enter-active,
  .slide-x-alt-leave-active
    transition: .4s ease-in-out

  .slide-x-alt-enter,
  .slide-x-alt-leave-to
    opacity: 0
    transform: translateX(-100%)

  .slide-y-enter-active,
  .slide-y-leave-active
    transition: .4s ease-in-out

  .slide-y-enter,
  .slide-y-leave-to
    opacity: 0
    transform: translateY(-20px)

  .slide-y-alt-enter,
  .slide-y-alt-leave-to
    opacity: 0
    transform: translateY(50%)

  .slide-y-alt-enter-active,
  .slide-y-alt-leave-active
    transition: .4s ease-in-out

  .page-enter-active,
  .page-leave-active
    transition: .4s ease-in-out

  .page-enter,
  .page-leave-to
    opacity: 0
    transform: translateY(50px)

  //cms
  .no-hover
    pointer-events: none
  #cms-dashboard
    padding: 85px 15px 20px 160px

  
  .cms-header
    position: fixed
    z-index: 999
    top: 62px
    padding: 20px 0 0
    width: 100%
    max-width: calc(100% - 175px)
    background-color: var(--theme_white)
    &__inner
      padding: 10px 20px
      border-radius: 5px
      width: 100%
      background-color: var(--theme_primary)
    &__title
      font-size: 20px
      color: var(--theme_white)
      text-transform: uppercase
  .multiselect__tags
    border: 1px solid var(--theme_gray) !important
  .cms
    &__main-content
      padding: 50px 0 30px
      background-color: var(--theme_white)
    &__table
      margin: 30px 0
      &-thumbnail
        height: 50px
        width: 50px
        margin-right: 20px
        object-fit: cover
        border-radius: 100px
      &__thead
        transition: .2s ease-in-out
        &--sticky
          position: sticky
          z-index: 9999
          top: 125px
          padding: 10px 0
          width: 100%
          max-width: calc(100% - 175px)
          border-radius: 10px
          color: var(--theme_white)
          background-color: var(--theme_gray)
          tr
            width: 100%
          th
            color: var(--theme_white)
            &:first-child
              border-top-left-radius: 5px
              border-bottom-left-radius: 5px
            &:last-child
              border-top-right-radius: 5px
              border-bottom-right-radius: 5px
      &-th
        padding: 10px
        background-color: transparent
        text-align: left
        text-transform: uppercase
        color: var(--theme_gray)
        font-weight: bold
      &-td
        text-align: left
        &--buttons
          display: flex
      &__name
        color: var(--theme_primary)
        text-decoration: underline
        cursor: pointer
        transition: .2s ease-in-out
      &-button
        margin-right: 10px
        padding: 10px
        min-width: 70px
        border-radius: 10px
        color: var(--theme_white)
        cursor: pointer
        text-align: center
        transition: .2s ease-in-out
        &:hover
          transform: scale(1.1)
        &--info
          background-color: var(--theme_info)
        &--danger
          background-color: var(--theme_danger)
        &--disabled
          background-color: var(--theme_gray)
          pointer-events: none
    &__actions-button
      display: inline-block
      color: var(--theme_white)
      background-color: var(--theme_primary)
      font-size: 14px
      text-transform: uppercase
      padding: 10px 15px
      border-radius: 10px
      box-shadow: 0 0 20px transparent
      text-align: center
      transform: translateY(0)
      transition: .3s ease-in-out
      cursor: pointer
      &:hover
        transform: scale(1.1)
    //form
    &__form-element
      margin-bottom: 80px
    &__form-container
      padding: 20px 5px 0
    &__form-header
      margin-bottom: 20px
    &__form-row
      display: flex
      flex-flow: row wrap
      margin: 0 -10px 20px
      &--one
        & ^[0]__form-group
          flex: 0 0 calc((100% / 1) - 20px)
      &--two
        & ^[0]__form-group
          flex: 0 0 calc((100% / 2) - 20px)
      &--three
        & ^[0]__form-group
          flex: 0 0 calc((100% / 3) - 20px)
    &__form-group
      position: relative
      display: flex
      flex-direction: column
      margin: 0 10px
      width: 100%
      label
        display: block
        margin: 0 0 10px
      &__input
        width: 100%
        border: 1px solid var(--theme_gray)
        padding: 8px 20px
        font-size: 18px
        transition: .2s ease-in-out
        border-radius: 5px
        font-family: sans-serif
        &--error
          border: 1px solid var(--theme_error)
        &:hover
          border: 1px solid var(--theme_primary)
      &--disabled
        pointer-events: none
        opacity: 0.5
      &__select-container
        position: relative
        width: 100%
        &:hover
          & ^[0]__form-group__select-arrow
            transform: translateY(-50%) rotate(180deg)
      &__select-arrow
        content: ""
        position: absolute
        top: 50%
        right: 10px
        border-left: 7px solid transparent
        border-right: 7px solid transparent
        border-top: 7px solid var(--theme_primary)
        z-index: 0
        transform: translateY(-50%)
        transition: .4s ease-in-out
          
      &__error
        position: absolute
        top: calc(100% + 5px)
        background-color: var(--theme_error)
        color: var(--theme_white)
        font-size: 14px
        z-index: 1
        padding: 5px 10px
        border-radius: 5px
        user-select: none
        right: 0
        &::before
          content: ""
          position: absolute
          bottom: calc(100% - 1px)
          width: 0
          height: 0
          border-left: 7px solid transparent
          border-right: 7px solid transparent
          border-bottom: 7px solid var(--theme_error)
          right: 17px
          z-index: 1
    &__form-buttons
      position: fixed
      display: flex
      bottom: 38px
      width: 100%
      max-width: calc(100% - 185px)
      & ^[0]__form-button
        width: 50%
        padding: 20px
        text-align: center
        color: var(--theme_white)
        cursor: pointer
        font-size: 18px
        transition: .2s ease-in-out
        &--cancel
          background-color: var(--theme_error)
        &--success
          background-color: var(--theme_success)
    &__box-container
      display: flex
      flex-flow: row wrap
      margin: 35px -10px 0
    &__box-item
      flex: 0 0 calc((100%/5) - 20px)
      display: flex
      flex-direction: column
      align-items: center
      justify-content: center
      margin: 0 10px
      padding: 10px 20px
      border: 2px solid var(--theme_gray)
      transition: .2s ease-in-out
      &:hover
        border: 2px solid var(--theme_primary)
        & ^[0]__box-item__count, & ^[0]__box-item__label
          color: var(--theme_primary)
      &__count, &__label
        display: inline-block
        margin: 15px 0
        font-size: 30px
        color: var(--theme_black)
        transition: .2s ease-in-out
      &__label
        margin: 0
        font-size: 20px
      &__icon
        max-height: 100px
        object-fit: cover
        max-width: 50px

</style>