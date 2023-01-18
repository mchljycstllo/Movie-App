<template>
  <div :class="attr['page']">
   <div :class="attr['page__content']">
      <div :class="attr['page__sidebar-container']">
        <Sidebar />
      </div>
      <div :class="attr['page__content-container']">
        <user-info />
      </div>
   </div>
  </div>
</template>

<script>
  export default {
    components: {
      Sidebar: () => import('~/components/profile/Sidebar.vue'),
      UserInfo: () => import('~/components/profile/UserInfo')
    }
  }
</script>

<style lang="stylus" module="attr">
  .page
    margin-bottom: 40px
    &__content
      display: flex
      max-width: 800px
      margin: 0 auto
    &__content-container
      width: 100%
</style>