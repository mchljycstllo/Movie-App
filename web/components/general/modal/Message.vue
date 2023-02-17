<template>
  <div :class="attr['modal']">
    <div :class="[
      attr['modal__content'],
      attr[`modal__content--${modal_info.type}`]
    ]">
      <div :class="attr['modal__head']">
        <h5 :class="attr['modal__head-title']"> {{ modal_info.type.toUpperCase() }} </h5>
        <div :class="attr['modal__close']" @click="hideModal()">
          <span :class="attr['modal__x-mark']">+</span>
        </div>
      </div>
      <div :class="attr['modal__body']">
        <span :class="attr['modal__body-message']"> {{ modal_info.message }} </span>
      </div>
      <div :class="attr['modal__footer']">
        <button 
          @click="hideModal()"
          :class="[
            attr['modal__footer-button'],
            attr['modal__footer-button--close']
          ]"
        > CLOSE </button>

        <button
          v-if="modal_info.api"
          @click="submitDelete()"
          :class="[
            attr['modal__footer-button'],
            attr['modal__footer-button--proceed']
          ]"
        > PROCEED </button>
      </div>
    </div>
  </div>
</template>

<script>
  export default {
    methods: {
      submitDelete () {
        this.showLoader()
        //delete data
        this.$axios.delete(this.modal_info.api).then(res => {
          this.hideModal()
          this.setSuccess('Data has been deleted')

          setTimeout(() => {
            this.$nuxt.$emit('clicked-proceed')
            this.hideModal()
          }, 2000)
        })
        .catch(err => {
          this.hideModal()
          this.setError(err.response.data.errors[0])
        })
        .then(() => {
          this.hideLoader()
        })
      }
    }
  }
</script>

<style lang="stylus" module="attr">
  .modal
    position: fixed
    z-index: 9999
    top: 0
    right: 0
    bottom: 0
    left: 0
    display: flex
    align-items: center
    justify-content: center
    backdrop-filter: blur(10px)
    &__head
      position: relative
    &__content
      width: 500px
      background-color: var(--theme_white)
      border-radius: 10px
      box-shadow: 0px 2px 12px 2px rgba(0,0,0,0.75)
      //overflow: hidden
      h5
        font-weight: bold
        font-size: 20px
        
    &__head
      padding: 10px 20px
      background-color: var(--theme_modal_head)
      border-top-left-radius: 10px
      border-top-right-radius: 10px
    &__content
      & ^[0]__close
        position: absolute
        display: flex
        align-items: center
        justify-content: center
        height: 35px
        width: 35px
        top: -15px
        right: -10px
        border-radius: 10px
        overflow: hidden
        transition: .2s ease-in-out
        cursor: pointer
        &:hover
          transform: scale(1.2)
      & ^[0]__x-mark
        margin-top: -4px
        margin-left: 6px
        color: var(--theme_white)
        font-size: 40px
        transform: rotate(45deg)
      //button statuses
      &--error, &--confirmation
        & ^[0]__close
          background-color: var(--theme_error)
        & ^[0]__footer-button--close
          background-color: var(--theme_error)
        h5
          color: var(--theme_error)
      &--success
        & ^[0]__close
          background-color: var(--theme_success)
        & ^[0]__footer-button--close
          background-color: var(--theme_success)
        h5
          color: var(--theme_success)
    &__body
      padding: 10px 20px
    &__footer
      position: relative
      display: flex
      justify-content: flex-end
      padding: 10px 20px
      &::before
        content: ''
        position: absolute
        top: 5px
        left: 0
        right: 0
        height: 1px
        background-color: var(--theme_gray)
        opacity: .5
      &-button
        margin-left: 10px
        padding: 10px 20px
        border-radius: 10px
        color: var(--theme_white)
        transition: .2s ease-in-out
        cursor: pointer
        &:hover
          transform: scale(1.1)
        &--proceed
          background-color: var(--theme_success)
</style>