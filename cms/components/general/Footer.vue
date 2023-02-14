<template>
  <nav :class="attr['footer']">
    <span> Copyright {{ $moment().format('Y') }}. Movie App. All right reserved</span>
  </nav>
</template>

<script>

</script>

<style lang="stylus" module="attr">
  .footer
    position: fixed
    bottom: 0
    display: flex
    align-items: center
    justify-content: center
    width: 100%
    margin-left: 153px
    padding: 10px 20px
    background-color: var(--theme_primary)
    color: var(--theme_white)
</style>