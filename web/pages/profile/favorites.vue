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
      PageContent: () => import('~/components/profile/favorites/PageContent')
    },
    data: () => ({
      loaded: false,
      data: []
    }),
    provide () {
      return {
        favorites_data: computed(() => this.data?.map((item, key) => ({
          ...item.movie,
          genre: item.genre.title,
          image: {
            src: `${this.image_url}${item.movie.image.url}`,
            alt: item.movie.image_alt
          },
          ratings: item.ratings_score,
          no_of_ratings: item.no_of_ratings,
          favorite: item.favorite
        })))
      }
    },
    methods: {
      initialization () {
        this.fetchData()
        this.hideLoader()
      },
      fetchData () {
        this.$axios.$post('frontend/all-favorites', {
          user_id: this.auth_user ? this.auth_user.id : null
        })
        .then(({ favorites }) => {
          console.log(favorites)
          this.data = favorites
          this.loaded = true
        })
        .catch(err => {
          this.setError(err.response.data.errors[0])
          this.loaded = true
        })
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
    asyncData({ $axios, store, error }) {
      store.commit('global/content-loader/toggleContentLoaderStatus', {
        type: 'loader',
        status: true
      })
    },
    destroyed () {
      this.$nuxt.$off('favorites-updated')
    }
  }
</script>

<style lang="stylus" module="attr">
  .page
    //
</style>