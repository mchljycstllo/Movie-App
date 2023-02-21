<template>
  <div :class="attr['page']">
    <div :class="attr['page__content']">
      <div :class="attr['page__sidebar-container']">
        <Sidebar />
      </div>
      <div :class="attr['page__content-container']">
        <main-content 
          :payload="favorites_data"
        />
      </div>
    </div>
  </div>
</template>

<script>
  export default {
    components: {
      Sidebar: () => import('~/components/profile/Sidebar.vue'),
      MainContent: () => import('~/components/profile/favorites/MainContent')
    },
    inject: ['favorites_data']
  }
</script>

<style lang="stylus" module="attr">
  .page
    margin-bottom: 40px
    &__content
      display: flex
      max-width: 1024px
      margin: 0 auto
    &__content-container
      width: 100%
      max-width: 750px
      margin: 0 auto
</style>