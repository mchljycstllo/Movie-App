<template>
  <div :class="attr['page']">
    <page-content />
  </div>
</template>

<script>
  export default {
    components: {
      PageContent: () => import('~/components/single-movie/PageContent')
    },
    provide () {
      return {
        single_movie_data: {
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
          trailer_link: `https://www.youtube.com/embed/${this.data.movie.trailer_link}`,
          comments: this.data.comments?.map((item) => ({
            ...item.comment,
            comment: item.comment.content,
            user: {
              ...item.user,
              image: {
                src: this.checkImage(item.user),
                alt: `${item.user.full_name} image`
              }
            }
          }))
        },
        related_movies_data: this.data.related_movies?.map((item, key) => ({
          ...item.movie,
          genre: item.genre.title,
          image: {
            src: `${this.image_url}${item.movie.image.url}`,
            alt: item.movie.image_alt
          },
          ratings: item.ratings_score,
          no_of_ratings: item.no_of_ratings
        }))
      }
    },
    methods: {
      initialization () {
        this.hideLoader()
      }
    },
    mounted () {
      let ids = [
        {
          id: 1
        },
        {
          id: 2
        }
      ]
      console.log('asdasd')
      console.log(ids, JSON.stringify(ids))

      setTimeout(() => {
        this.initialization()
      }, 200)
    },
    asyncData({ $axios, store, error, params }) {
      store.commit('global/content-loader/toggleContentLoaderStatus', {
        type: 'loader',
        status: true
      })

      return $axios.$get(`frontend/${params.slug}`)
      .then(({ data }) => {
        return { data }
      })
      .catch(() => {
        error({ statusCode: 500 })
      })
    }
  }
</script>

<style lang="stylus" module="attr">
  .page
    //
</style>