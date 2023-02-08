<template>
  <div :class="attr['page']">
    <div :class="attr['page__content']">
      <!--- login --->
      <div
        v-if="display.login"
        :class="attr['page__content-form']"
      >
        <h2 :class="attr['page__form-title']">
          Login
        </h2>
        <div :class="attr['page__input-group']">
          <label>
            Email / Username
          </label>
          <input 
            type="text"
            name="username"
            v-model="login_form.username"
            :class="attr['page__text-input']"
          />
        </div>
        <div :class="attr['page__input-group']">
          <label>
            Password
          </label>
          <input 
            type="password"
            name="password"
            v-model="login_form.password"
            :class="attr['page__text-input']"
          />
        </div>
        <div :class="attr['page__input-group']">
          <button
            :class="attr['page__button']"
            @click="login()"
          >
            Login
          </button>
        </div>
        <div :class="attr['page__input-group']">
          <p :class="attr['page__disclaimer']">
            Don't have an account yet? Click <b @click="display.login = false">here</b> to register for an account.
          </p>
        </div>
      </div>
      <!--- register --->
      <div
        v-else 
        :class="attr['page__content-form']">
        <h2 :class="attr['page__form-title']">
          Sign Up
        </h2>
        <div :class="attr['page__input-group']">
          <label>
            First Name
          </label>
          <input 
            type="text"
            name="first_name"
            v-model="register_form.first_name"
            :class="attr['page__text-input']"
          />
        </div>
        <div :class="attr['page__input-group']">
          <label>
            Last Name
          </label>
          <input 
            type="text"
            name="last_name"
            v-model="register_form.last_name"
            :class="attr['page__text-input']"
          />
        </div>
        <div :class="attr['page__input-group']">
          <label>
            Email
          </label>
          <input 
            type="text"
            name="email"
            v-model="register_form.email"
            :class="attr['page__text-input']"
          />
        </div>
        <div :class="attr['page__input-group']">
          <label>
            Username
          </label>
          <input 
            type="text"
            name="username"
            v-model="register_form.username"
            :class="attr['page__text-input']"
          />
        </div>
        <div :class="attr['page__input-group']">
          <label>
            Password
          </label>
          <input 
            type="password"
            name="password"
            v-model="register_form.password"
            :class="attr['page__text-input']"
          />
        </div>
        <div :class="attr['page__input-group']">
          <label>
            Confirm Password
          </label>
          <input 
            type="password"
            name="confirm_password"
            v-model="register_form.confirm_password"
            :class="attr['page__text-input']"
          />
        </div>
        <div :class="attr['page__input-group']">
          <button
            :class="attr['page__button']"
            @click="register()"
          >
            Register
          </button>
        </div>
        <div :class="attr['page__input-group']">
          <p :class="attr['page__disclaimer']">
            Already have an account? Click <b @click="display.login = true">here</b> to login to your account.
          </p>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
  export default {
    data: () => ({
      display: {
        login: true
      },
      login_form: {
        username: '',
        password: ''
      },
      register_form: {
        first_name: '',
        last_name: '',
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
        console.log('login', this.login_form)
      },
      register () {
        console.log('register', this.register_form)
      }
    }
  }
</script>

<style lang="stylus" module="attr">
  .page
    padding: 0 10px
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
        display: flex
        flex-direction: column
        margin-bottom: 10px
    &__text-input
      margin: 10px 0
      padding: 10px
      border-radius: 5px
      border: 1px solid var(--theme_gray)
      transition: .2s ease-in-out
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