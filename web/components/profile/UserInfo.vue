<template>
  <div :class="attr['page']">
    <!--- register --->
    <validation-observer
        tag="div" ref="form"
        :class="[
          attr['page__form-container']
        ]"
      >
        <form
          autocomplete="off"
          :class="attr['page__content-form']"
          id="form"
          ref="form"
          @submit.prevent="updateProfile()"
        >
          <h2 :class="attr['page__form-title']">
            Update Profile
          </h2>
          <validation-provider 
            :class="attr['page__input-group']"
            name="full name" 
            :rules="{ required: true, alpha_spaces: true }"
            v-slot="{ errors }"
          >
            <label>
              Full Name *
            </label>
            <input
              type="text"
              name="full_name"
              v-model="form_data.full_name"
              :class="[
                attr['page__text-input'],
                errors.length && attr['page__text-input--error']
              ]"
            />
            <transition name="slide">
              <span 
                :class="[
                  attr['page__input-error'],
                  'err0r'
                ]" 
                v-if="errors.length > 0"
              > {{ errors[0] }}</span>
            </transition>
          </validation-provider>
          <validation-provider 
            :class="attr['page__input-group']"
            name="email" 
            :rules="{ required: true, email: true }"
            v-slot="{ errors }"
          >
            <label>
              Email *
            </label>
            <input
              type="text"
              name="email"
              v-model="form_data.email"
              :class="[
                attr['page__text-input'],
                errors.length && attr['page__text-input--error']
              ]"
            />
            <transition name="slide">
              <span 
                :class="[
                  attr['page__input-error'],
                  'err0r'
                ]" 
                v-if="errors.length > 0"
              > {{ errors[0] }}</span>
            </transition>
          </validation-provider>
          <validation-provider 
            :class="attr['page__input-group']"
            name="user name" 
            :rules="{ required: true, alpha_num: true }"
            v-slot="{ errors }"
          >
            <label>
              Username *
            </label>
            <input
              type="text"
              name="user_name"
              v-model="form_data.user_name"
              :class="[
                attr['page__text-input'],
                errors.length && attr['page__text-input--error']
              ]"
            />
            <transition name="slide">
              <span 
                :class="[
                  attr['page__input-error'],
                  'err0r'
                ]" 
                v-if="errors.length > 0"
              > {{ errors[0] }}</span>
            </transition>
          </validation-provider>
          <validation-provider 
            :class="attr['page__input-group']"
            name="password" 
            :rules="{ required: false }"
            v-slot="{ errors }"
          >
            <label>
              Password
            </label>
            <input
              type="password"
              name="password"
              v-model="form_data.password"
              autocomplete="new-password"
              :class="[
                attr['page__text-input'],
                errors.length && attr['page__text-input--error']
              ]"
              vid="password"
            />
            <transition name="slide">
              <span 
                :class="[
                  attr['page__input-error'],
                  'err0r'
                ]" 
                v-if="errors.length > 0"
              > {{ errors[0] }}</span>
            </transition>
          </validation-provider>
          <validation-provider 
            :class="attr['page__input-group']"
            name="password confirmation" 
            :rules="{ required: false, confirmed: 'password' }"
            v-slot="{ errors }"
          >
            <label>
              Confirm Password
            </label>
            <input
              type="password"
              name="password_confirmation"
              v-model="form_data.confirm_password"
              :class="attr['page__text-input']"
            />
            <transition name="slide">
              <span 
                :class="[
                  attr['page__input-error'],
                  'err0r'
                ]" 
                v-if="errors.length > 0"
              > {{ errors[0] }}</span>
            </transition>
          </validation-provider>
          <div :class="attr['page__input-group']">
            <Uploader 
              v-if="form_data.image"
              :file_name="'image'"
              :uploader_name="'profile picture'"
              ref="image_uploader"
              :res_image="form_data.image"
            />
          </div>
          <div :class="attr['page__input-group']">
            <button
              :class="attr['page__button']"
            >
              Update Profile
            </button>
          </div>
        </form>
    </validation-observer>
  </div>
</template>

<script>
  export default {
    inject: ['user_info'],
    data: ({ user_info }) => ({
      form_data: ({
        ...user_info,
        password: '',
        password_confirmation: ''
      })
    }), 
    methods: {
      updateProfile () {
        if (this.form_data.password.length > 0) this.confirm_password_required = true
        else this.confirm_password_required = false

        this.showLoader()
        this.$refs.form.validate().then(success => {
          if (!success) {
            this.$scrollTo('.err0r', {
              offset: -250
            })
            this.hideLoader()
            return
          } else {
              let image_uploader = this.$refs.image_uploader
              image_uploader.validateImage()
              if (image_uploader.data_errors.length > 0) {
                setTimeout(() => {
                  this.$scrollTo('.err0r', {
                    offset: -250
                  })
                }, 200)
                this.hideLoader()
                return false
              }

              //form data
              let form_data = new FormData(document.getElementById('form'))
              form_data.append('role', this.form_data.role)
              this.$axios.patch(`user/users/${this.auth_user.id}`, form_data).then(({data}) => {
                this.setSuccess('Your info has been updated')
                localStorage.setItem('current_user', JSON.stringify(data.data))
                  setTimeout(() => {
                    window.open('/profile', '_SELF')
                    this.hideModal()
                }, 1000)    
              })
              .catch(err => {
                //console.log(err)
                //this.setError(err.response.data.errors[0])
              })
              this.hideLoader()
          }
          this.$nextTick(() => {
            this.$refs.form.reset()
          })
        })
      }
    }
  }
</script>

<style lang="stylus" module="attr">
  .page
    padding: 0 10px
    &__form-container
      //
    &__form-title
      margin-bottom: 20px
      text-align: center
      color: var(--theme_primary)
    &__content
      display: flex
      align-items: center
      justify-content: center
      width: 100%
      max-width: 350px
      margin: 0 auto 40px
      min-height: 80vh
      overflow: hidden
    &__content-form
      width: 100%
      padding: 10px 20px
      border: 1px solid var(--theme_gray)
      border-radius: 5px
      & ^[0]__input-group
        position: relative
        display: flex
        flex-direction: column
        margin-bottom: 30px
      & ^[0]__input-error
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
        &:before
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
    &__text-input
      margin: 10px 0 0
      padding: 10px
      border-radius: 5px
      border: 1px solid var(--theme_gray)
      transition: .2s ease-in-out
      &--error
        border: 1px solid var(--theme_error)
      &:hover
        border: 1px solid var(--theme_primary)
    &__button
        padding: 10px 20px
        border-radius: 20px
        background-color: var(--theme_primary)
        color: var(--theme_white)
        cursor: pointer
        transition: .2s ease-in-out
        border: 1px solid var(--theme_primary)
        &:hover
          background-color: var(--theme_white)
          color: var(--theme_primary)
    &__disclaimer
      margin-top: 20px
      b
        color: var(--theme_primary)
        cursor: pointer
</style>