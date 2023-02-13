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
      <li>
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
    </ul>
    </section>
  </nav>
</template>

<script>

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
      list-style-type: none
      padding: 0
      li
        display: inline-block
        margin: 0 10px
        &:last-child
          margin-right: 0
</style>