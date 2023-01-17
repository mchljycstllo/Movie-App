<template>
  <footer :class="attr['footer']">
    <div :class="attr['footer__content']">
      <span :class="attr['footer__copyright']"> Copyright {{ $moment().format('Y') }}. Movie Review. All right reserved </span>
    </div>
  </footer>
</template>

<style lang="stylus" module="attr">
  .footer
    padding: 20px 0
    background-color: var(--theme_black)
    &__content
      display: flex
      align-items: center
      justify-content: center
    &__copyright
      color: var(--theme_white)
</style>