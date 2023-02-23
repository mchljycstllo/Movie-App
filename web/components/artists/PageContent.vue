<template>
  <div :class="attr['page']">
    <div :class="attr['page__content-wrapper']">
      <h1 :class="attr['page__title']">
        All Artists
      </h1>
      <artist-grid 
        :payload="all_artists"
      />
    </div>
  </div>
</template>

<script>
  export default {
    components: {
      ArtistGrid: () => import('~/components/artists/ArtistGrid')
    },
    inject: ['all_artists']
  }
</script>

<style lang="stylus" module="attr"> 
  .page
    &__content-wrapper
      max-width: 1180px
      margin: 0 auto
      min-height: 90vh
    &__title
      color: var(--theme_primary)
      margin: 20px 0 50px
      text-align: center
</style>