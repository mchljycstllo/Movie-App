<template>
  <div :class="attr['page']">
    <section :class="attr['page__main-content']">
      <main-content 
        :payload="single_movie_data"
      />
    </section>
    <image-grid 
      v-if="related_movies_data.length"
      :payload="related_movies_data"
      :title="'Related Movies'"
    />
  </div>
</template>

<script>
  export default {
    components: {
      ImageGrid: () => import('~/components/general/layouts/Imagegrid'),
      MainContent: () => import('~/components/single-movie/MainContent')
    },
    inject: [
      'single_movie_data',
      'related_movies_data'
    ]
  }
</script>

<style lang="stylus" module="attr">
  .page
    //
</style>