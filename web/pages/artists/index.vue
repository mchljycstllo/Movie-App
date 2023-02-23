<template>
  <div :class="attr['page']">
    <page-content 
      v-if="loaded"
    />
    <Skeleton v-else />
  </div>
</template>

<script>
  import { computed } from 'vue'
  export default {
    components: {
      PageContent: () => import('~/components/artists/PageContent')
    },
    data: () => ({
      loaded: false,
      data: []
    }),
    provide () {
      return {
        all_artists: computed(() => this.data?.map(item => ({
          ...item.artist,
          image: {
            src: this.checkImage(item.artist),
            alt: `${item.artist.name} profile image`
          },
          movies_count: item.movies_count
        })))
      }
    },  
    methods: {
      fetchData() {
        this.$axios.$post('frontend/all-artists').then(({ data }) => {
          this.manipulateData(data)
        })
        .catch(err => {
          this.setError(err.response.data.errors[0])
        })
        this.loaded = true
      },
      manipulateData (data) {
        this.data = data
        console.log(data)
      },
      initialization () {
        this.fetchData()
        this.hideLoader()
      }
    },  
    mounted () {
      this.$nuxt.$on('favorite-updated', () => {
        this.fetchData()
      })
      setTimeout(() => {
        this.initialization()
      }, 200)
    },
    destroyed () {
      this.$nuxt.$off('favorite-updated')
    },
    asyncData({ $axios, store, error }) {
      store.commit('global/content-loader/toggleContentLoaderStatus', {
        type: 'loader',
        status: true
      })

      // return $axios.$post('frontend/all-movies')
      // .then(({ data }) => {
      //   return { data }
      // })
      // .catch(() => {
      //   error({ statusCode: 500 })
      // })
    }
  }
</script>

<style lang="stylus" module="attr">
  .page
    //
</style>