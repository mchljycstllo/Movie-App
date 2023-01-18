<template>
  <div :class="attr['page']">
    <form
      data-user-profile
      :class="attr['page__content-form']">
      <h2 :class="attr['page__form-title']">
        Update Profile
      </h2>
      <div :class="attr['page__pic-container']">
        <div :class="attr['page__pic-wrapper']">
          <img 
            :src="`${user_info.img.src}`"
            :alt="`${user_info.img.alt}`"
          />
        </div>
      </div>
      <div :class="attr['page__input-group']">
        <label>
          First Name
        </label>
        <input 
          type="text"
          name="first_name"
          v-model="user_info.first_name"
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
          v-model="user_info.last_name"
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
          v-model="user_info.email"
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
          v-model="user_info.username"
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
          v-model="user_info.password"
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
          v-model="user_info.confirm_password"
          :class="attr['page__text-input']"
        />
      </div>
      <div :class="attr['page__input-group']">
        <button
          :class="attr['page__button']"
          @click="updateProfile()"
        >
          Update Profile
        </button>
      </div>
    </form>
  </div>
</template>

<script>
  export default {
    data: () => ({
      user_info: {
        first_name: '',
        last_name: '',
        username: '',
        email: '',
        password: '',
        confirm_password: '',
        email: '',
        img: {
          src: `/images/profiles/zuck.jpeg`,
          alt: 'profile pic'
        }
      }
    }),
    methods: {
      updateProfile () {
        console.log('asd')
      }
    }
  }
</script>

<style lang="stylus" module="attr">
  .page
    &__pic-container
      display: flex
      align-items: center
      justify-content: center
      & ^[0]__pic-wrapper
        max-width: 100px
        max-height: 100px
        overflow: hidden
        border-radius: 100%
    &__form-title
      margin-bottom: 20px
      text-align: center
      color: var(--theme_primary)
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
      width: 100%
      max-width: 200px
      margin: 0 auto
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
</style>