<template>
  <div :class="attr['page']">
    <div id="cms-dashboard">
      Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptatem doloribus quidem sed beatae animi fuga dignissimos esse, eaque dolores minima tenetur non dolorem in quis sint nam quam veniam architecto.
    </div>
  </div>
</template>

<script>
  export default {
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