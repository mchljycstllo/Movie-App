<template>
  <div :class="attr['page']">
    <page-content 
      
    />
  </div>
</template>

<script>
  export default {
    components: {
      PageContent: () => import('~/components/profile/favorites/PageContent')
    },
    methods: {
      initialization () {
        this.$axios.get('test-route').then(res => {
          console.log(res)
        })
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