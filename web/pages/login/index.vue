<template>
  <div :class="attr['page']">
    <page-content 
      
    />
  </div>
</template>

<script>
  export default {
    components: {
      PageContent: () => import('~/components/authentication/PageContent')
    },
    methods: {
      initialization () {
        this.hideLoader()
      }
    },  
    mounted () {
      setTimeout(() => {
        this.initialization()
      }, 200)
    },
    asyncData({ $axios, store, error }) {
      store.commit('global/content-loader/toggleContentLoaderStatus', {
        type: 'loader',
        status: true
      })
    }
  }
</script>

<style lang="stylus" module="attr">
  .page
    //
</style>