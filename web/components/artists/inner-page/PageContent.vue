<template>
  <div :class="attr['page']">
    <div :class="attr['page__content']">
      <artist-info
        :payload="artist_data"
      />
      <image-grid
        :payload="movies_data"
        :title="`${artist_data.full_name} movies`"
        v-if="movies_data && movies_data.length"
      />
      <div
        v-else
        :class="attr['page__no-movies']"
      >
        <span>
          This artist has no movies at the moment
        </span>
      </div>
    </div>

  </div>
</template>

<script>
  export default {
    components: {
      ImageGrid: () => import('~/components/general/ImageGrid.vue'),
      ArtistInfo: () => import('~/components/artists/inner-page/ArtistInfo')
    },
    inject: [
      'movies_data',
      'artist_data'
    ]
  }
</script>

<style lang="stylus" module="attr">
  .page
    &__no-movies
      height: 70vh
      display: flex
      justify-content: center
      span
        font-weight: bold
    &__content  
      max-width: 1180px
      margin: 0 auto
</style>