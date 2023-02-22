<template>
  <nav 
    :class="attr['nav']"
    data-navbar
  >
    <section
      :class="attr['nav__navbar-content']"
    >
    <nuxt-link to="/">
      <h1 :class="attr['nav__brand']">
        Movie <b>App</b>
      </h1>
    </nuxt-link>

    <ul :class="attr['nav__links']">
      <li :class="attr['nav__search-container']">
        <form @submit.prevent="submitSearch()">
          <input
            type="text"
            placeholder="Search movie title"
            :class="attr['nav__search-input']"
            v-model="form_data.title"
          />
          <img 
            @click="submitSearch()"
            :class="attr['nav__search-icon']"
            src="/icons/search.png"
          />
        </form>
      </li>
      <li>
        <nuxt-link
          custom
          to="/"
          v-slot="{ href, navigate, isActive, isExactActive }"
          >
          <a
            :href="href"
            @click="navigate"
            :class="[
            attr['nav__link-item'],
              (isExactActive) && attr['nav__link-item--active']
            ]"
          >
            Home
          </a>
        </nuxt-link>
      </li>
      <li v-if="auth_user">
        <nuxt-link
          to="/profile"
          :class="attr['nav__link-item']"
        >
          Hello, {{ auth_user.full_name }}
        </nuxt-link>
      </li>
      <li v-if="!auth_user">
        <nuxt-link
          custom
          to="/login"
          v-slot="{ href, navigate, isActive, isExactActive }"
          >
          <a
            :href="href"
            @click="navigate"
            :class="[
            attr['nav__link-item'],
              (isActive || isExactActive) && attr['nav__link-item--active']
            ]"
          >
            Login
          </a>
        </nuxt-link>
      </li>
      <li v-else>
        <a
          href="#"
          @click.prevent="logout()"
          :class="attr['nav__link-item']"
        > 
          Logout
        </a>
      </li>
    </ul>
    </section>
  </nav>
</template>

<script>
  export default {
    data: () => ({
      form_data: {
        title: ''
      }
    }),
    methods: {
      submitSearch () {
        let form_data = {
          ...this.form_data,
          user_id: this.auth_user ? this.auth_user.id : null
        }
        //save to local storage
        if (form_data.title.length == 0) {
          this.setError('Title is required')
        }
        else {
          localStorage.setItem('search_params', JSON.stringify(form_data))
          this.form_data.title = ''
          if (this.$route.name == 'search') {
            this.$nuxt.$emit('execute-search')
          }
          else {
            this.$router.push('/search')
          }
        }
      }
    }
  }
</script>

<style lang="stylus" module="attr">
  .nav
    position: fixed
    top: 0
    left: 0
    right: 0
    z-index: 999
    width: 100%
    background-color: var(--theme_black)
    padding: 20px 0
    &__navbar-content
      display: flex
      justify-content: space-between
      margin: 0 auto
      padding: 0 20px
      width: 100%
      max-width: 1280px
    &__link-item
      margin: 0 10px
      color: var(--theme_white)
      transition: .2s ease-in-out
      &:last-child
        margin: 0
      &:hover, &--active
        color: var(--theme_primary)
    &__brand
      color: var(--theme_white)
      cursor: pointer
      transition: .2s ease-in-out
      display: inline-block
      b
        color: var(--theme_primary)
      &:hover
        color: var(--theme_primary)
        b
          color: var(--theme_white)
    &__links
      display: flex
      align-items: center
      padding: 0
      list-style-type: none
      li
        display: inline-block
        margin: 0 10px
        &:last-child
          margin-right: 0
    &__search
      &-container
        display: flex
        align-items: center
        position: relative
      &-input
        padding: 5px 30px 5px 20px
        border-radius: 100px
        border: 1px solid var(--theme_white)
        color: var(--theme_white)
        font-size: 16px
      &-icon
        position: absolute
        top: 7px
        right: 10px
        max-width: 15px
        cursor: pointer
        transition: .2s ease-in-out
        opacity: 0.5
        &:hover
          opacity: 1
</style>