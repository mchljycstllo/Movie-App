<template>
  <div :class="attr['page']">
    <page-content 
      
    />
  </div>
</template>

<script lang="js">
  export default {
    components: {
      PageContent: () => import('~/components/single-movie/PageContent')
    },
    mounted () {
      this.$axios.get('test-route').then(res => {
        console.log(res)
      })
    }
  }
</script>

<style lang="stylus" module="attr">
  .page
    //
</style>