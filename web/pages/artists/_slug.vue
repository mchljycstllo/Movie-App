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
      PageContent: () => import('~/components/artists/inner-page/PageContent')
    },
    data: () => ({
      loaded: false,
      data: []
    }),
    provide () {
      return {
        artist_data: computed(() => ({
          ...this.data.artist,
          image: {
            src: this.checkImage(this.data.artist),
            alt: `${this.data.artist.full_name} profile image`
          },
          description: `Mark Sinclair, known professionally as Vin Diesel, is an American actor and producer. One of the world's highest-grossing actors, he is best known for playing Dominic Toretto in the Fast & Furious franchise.`
        })),
        movies_data: computed(() => this.data.movies?.map((item, key) => ({
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
      fetchData() {
        this.$axios.$post('frontend/artist-inner-page', {
          user_id: this.auth_user ? this.auth_user.id : '',
          artist_id: this.$route.params.slug,
          manipulate_movies: true
        }).then(({ data }) => {
          this.manipulateData(data)
        })
        .catch(err => {
          this.setError(err.response.data.errors[0])
          setTimeout(() => {
            this.$router.push(`/artists`)
            this.hideModal()
          }, 1000)
        })
        
      },
      manipulateData (data) {
        this.data = data
        console.log(data)
        this.loaded = true
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