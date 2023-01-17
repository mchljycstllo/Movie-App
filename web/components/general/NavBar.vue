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
        Movie <b>Review</b>
      </h1>
    </nuxt-link>
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
      width: 100%
      max-width: 1280px
      margin: 0 auto
      padding: 0 10px
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
</style>