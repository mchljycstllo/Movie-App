<template>
  <div :class="attr['page']">
      <image-grid 
        :payload="payload"
        :title="'My Favorites'"
        :number_of_columns="3"
      />
  </div>
</template>

<script>
  export default {
    props: {
      payload: {
        type: Array,
        default: () => []
      }
    },
    components: {
      ImageGrid: () => import('~/components/general/ImageGrid')
    }
  }
</script>

<style lang="stylus" module="attr">
  .page
    //
</style>