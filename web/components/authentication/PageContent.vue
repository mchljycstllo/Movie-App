<template>
  <div :class="attr['page']">
    <div :class="attr['page__content']">
      <!--- login --->
      <validation-observer 
        tag="div" 
        ref="login_form"
        :class="[
          attr['page__form-container'],
          display.login && attr['page__form-container--active']
        ]"
      >
        <form
          :class="attr['page__content-form']"
          id="login_form"
          @submit.prevent="login()"
          ref="login_form"
        >
          <h2 :class="attr['page__form-title']">
            Login
          </h2>
          <validation-provider 
            :class="attr['page__input-group']"
            name="email" 
            :rules="{ required: true }" 
            v-slot="{ errors }"
          >
            <label>
              Email
            </label>
            <input
              type="text"
              name="email"
              placeholder="Enter your email"
              v-model="login_form.email"
              :class="[
                attr['page__text-input'],
                errors.length && attr['page__text-input--error'],
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
            :rules="{ required: true }" 
            v-slot="{ errors }"
          >
            <label>
              Password
            </label>
            <input
              type="password"
              name="password"
              placeholder="Enter your password"
              v-model="login_form.password"
              :class="[
                attr['page__text-input'],
                errors.length && attr['page__text-input--error'],
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
          <div :class="attr['page__input-group']">
            <button
              :class="attr['page__button']"
            >
              Login
            </button>
          </div>
          <div :class="attr['page__input-group']">
            <p :class="attr['page__disclaimer']">
              Don't have an account yet? Click <b @click="display.login = false">here</b> to register for an account.
            </p>
          </div>
        </form>
      </validation-observer>


      <!--- register --->
      <validation-observer
        tag="div" ref="register_form"
        :class="[
          attr['page__form-container'],
          !display.login && attr['page__form-container--active']
        ]"
      >
        <form
          :class="attr['page__content-form']"
          id="register_form"
          ref="register_form"
          @submit.prevent="register()"
        >
          <h2 :class="attr['page__form-title']">
            Sign Up
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
              v-model="register_form.full_name"
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
              v-model="register_form.email"
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
              v-model="register_form.username"
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
            :rules="{ required: true }"
            v-slot="{ errors }"
          >
            <label>
              Password
            </label>
            <input
              type="password"
              name="password"
              v-model="register_form.password"
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
            :rules="{ required: true, confirmed: 'password' }"
            v-slot="{ errors }"
          >
            <label>
              Confirm Password
            </label>
            <input
              type="password"
              name="password_confirmation"
              v-model="register_form.confirm_password"
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
            <button
              :class="attr['page__button']"
            >
              Register
            </button>
          </div>
          <div :class="attr['page__input-group']">
            <p :class="attr['page__disclaimer']">
              Already have an account? Click <b @click="display.login = true">here</b> to login to your account.
            </p>
          </div>
        </form>
      </validation-observer>
    </div>
  </div>
</template>

<script>
import { alpha_spaces } from 'vee-validate/dist/rules'

  export default {
    data: () => ({
      display: {
        login: true //to do
      },
      login_form: {
        email: '',
        password: ''
      },
      register_form: {
        full_name: '',
        username: '',
        email: '',
        password: '',
        confirm_password: '',
        email: ''
      }
    }),
    methods: {
      login () {
        this.showLoader()
        
        this.$refs.login_form.validate().then(success => {
          if (!success) {
            this.$scrollTo('.err0r', {
              offset: -250
            })
            this.hideLoader()
            return
          }
          else {
            this.$auth.loginWith('local', { data: this.login_form }).then(res => {
              if (res.data.data.deleted) {
                this.setError('User not found')
                setTimeout(() => {
                  this.logout()
                }, 2000)
              }
              else {
                localStorage.setItem('current_user', JSON.stringify(res.data.data))
                window.open('/profile', '_SELF')
              }
            }).catch(err => {
              this.setError(err.response.data.errors[0])
            }).then(() => {
              setTimeout( () => {
                this.hideLoader()
              }, 500)
            })
          }
        })
        //console.log(this.$auth)
      },
      register () {
        this.$refs.register_form.validate().then(success => {
          if (!success) {
            this.$scrollTo('.err0r', {
              offset: -250
            })
            this.hideLoader()
            return
          } 
          else {
            let form_data = new FormData(document.getElementById('register_form'))
            this.$axios.post(`${this.app_url}/auth`, form_data).then(res => {
              this.setSuccess('You have been registered successfully. You may now login to your account')
              setTimeout(() => {
                this.display.login = true
                this.hideModal()
              }, 2000)
            })
            .catch(err => {
              console.log(err)
            })
          }
        })
      }
    }
  }
</script>

<style lang="stylus" module="attr">
  .page
    padding: 0 10px
    &__form-container
      display: none
      &--active
        display: block
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