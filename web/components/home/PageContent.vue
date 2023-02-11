<template>
  <div :class="attr['page']">
    <image-grid 
      :payload="movies_data"
      :title="'Browse All Movies'"
    />
  </div>
</template>

<script>
  export default {
    components: {
      ImageGrid: () => import('~/components/general/layouts/Imagegrid.vue')
    },
    inject: [
      'movies_data',
      'movies_data_old'
    ]
  }
</script>

<style lang="stylus" module="attr">
  .page
    //
</style>