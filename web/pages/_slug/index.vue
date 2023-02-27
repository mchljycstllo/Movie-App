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
      PageContent: () => import('~/components/single-movie/PageContent')
    },
    provide () {
      return {
        single_movie_data: computed(() => ({
          ...this.data.movie,
          genre: this.data.genre.title,
          casts: this.data.artists?.map(item => ({
            ...item
          })),
          image: {
            src: `${this.image_url}${this.data.movie.image.url}`,
            alt: this.data.movie.image_alt
          },
          ratings: this.data.ratings_score,
          no_of_ratings: this.data.no_of_ratings,
          favorite: this.data.favorite,
          trailer_link: `https://www.youtube.com/embed/${this.data.movie.trailer_link}`,
          comments: this.data.comments?.map((item) => ({
            ...item.comment,
            comment: item.comment.content,
            comment_user_id: item.comment.user_id,
            user: {
              ...item.user,
              image: {
                src: this.checkImage(item.user),
                alt: `${item.user.full_name} image`
              }
            },
            user_rating: {
              ...item.user_rating,
              score: item.user_rating.score
            }
          }))
        })),
        related_movies_data: computed(() => this.data.related_movies?.map((item, key) => ({
          ...item.movie,
          genre: item.genre.title,
          image: {
            src: `${this.image_url}${item.movie.image.url}`,
            alt: item.movie.image_alt
          },
          favorite: item.favorite,
          ratings: item.ratings_score,
          no_of_ratings: item.no_of_ratings
        })))
      }
    },
    data: () => ({
      loaded: false,
      data: {}
    }),
    methods: {
      initialization () {
        this.fetchData()
        this.hideLoader()
      },
      fetchData () {
        this.$axios.$post(`frontend/movie-inner-page`, {
          user_id: this.auth_user ? this.auth_user.id : null,
          movie_slug: this.$route.params.slug
        })
        .then(({ data }) => {
          this.data = data
          console.log(data)
          this.loaded = true
        })
        .catch(err => {
          this.setError(err.response.data.errors[0])
        })
      }
    },
    mounted () {
      this.$nuxt.$on('favorite-updated', () => {
        this.fetchData()
      })
      this.$nuxt.$on('pressed-hide-modal', () => {
        this.$router.push('/')
      })
      setTimeout(() => {
        this.initialization()
      }, 200)
    },
    asyncData({ $axios, store, error, params }) {
      store.commit('global/content-loader/toggleContentLoaderStatus', {
        type: 'loader',
        status: true
      })

      // return $axios.$get(`frontend/${params.slug}`)
      // .then(({ data }) => {
      //   return { data }
      // })
      // .catch(() => {
      //   error({ statusCode: 500 })
      // })
    },
    destroyed () {
      this.$nuxt.$off('favorite-updated')
      this.$nuxt.$off('pressed-hide-modal')
    }
  }
</script>

<style lang="stylus" module="attr">
  .page
    //
</style>