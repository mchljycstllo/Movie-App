<template>
  <div :class="attr['page']">
    <page-content 
      v-if="loaded"
      :title="title"
    />
    <Skeleton v-else />

    <div 
      v-if="!data.length"
      :class="attr['page__skeleton']"
    >
      <img 
        src="/icons/no_search_result.png"
        :class="attr['page__no-search-icon']"
      />
    </div>
  </div>
</template>

<script>
  import { computed } from 'vue'
  export default {
    components: {
      PageContent: () => import('~/components/search/PageContent')
    },
    data: () => ({
      loaded: false,
      data: [],
      title: 'Search result for'
    }),
    provide () {
      return {
        movies_data_old: [
          {
            title: 'Fanta G Spot',
            genre: 'K-Drama',
            release_year: 2022,
            casts: ['Simu Liu', 'Awkwafina'],
            slug: '/fanta-g-spot',
            image: {
              src: '/images/movies/01.webp',
              alt: 'fanta'
            },
            ratings: 4,
            no_of_ratings: 10
          },
          {
            title: 'Red Baloon',
            genre: 'K-Drama',
            release_year: 2022,
            casts: ['Simu Liu', 'Awkwafina'],
            slug: '/fanta-g-spot',
            image: {
              src: '/images/movies/02.webp',
              alt: 'fanta'
            },
            ratings: 2,
            no_of_ratings: 5
          },
          {
            title: 'Missing: The Other Side Season 2',
            genre: 'K-Drama',
            release_year: 2022,
            casts: ['Simu Liu', 'Awkwafina'],
            slug: '/fanta-g-spot',
            image: {
              src: '/images/movies/03.webp',
              alt: 'fanta'
            },
            ratings: 5,
            no_of_ratings: 20
          },
          {
            title: 'Crash Course in Romance',
            genre: 'K-Drama',
            release_year: 2022,
            casts: ['Simu Liu', 'Awkwafina'],
            slug: '/fanta-g-spot',
            image: {
              src: '/images/movies/04.webp',
              alt: 'fanta'
            },
            ratings: 5,
            no_of_ratings: 20
          },
          {
            title: 'The Interest of Love',
            genre: 'K-Drama',
            release_year: 2022,
            casts: ['Simu Liu', 'Awkwafina'],
            slug: '/fanta-g-spot',
            image: {
              src: '/images/movies/05.webp',
              alt: 'fanta'
            },
            ratings: 5,
            no_of_ratings: 13
          },
          {
            title: 'Poong, the Joseon Psychiatrist Season 2',
            genre: 'K-Drama',
            release_year: 2022,
            casts: ['Simu Liu', 'Awkwafina'],
            slug: '/fanta-g-spot',
            image: {
              src: '/images/movies/06.webp',
              alt: 'fanta'
            },
            ratings: 5,
            no_of_ratings: 10
          },
          {
            title: `Single's Inferno Season 2`,
            genre: 'K-Drama',
            release_year: 2022,
            casts: ['Simu Liu', 'Awkwafina'],
            slug: '/fanta-g-spot',
            image: {
              src: '/images/movies/07.webp',
              alt: 'fanta'
            },
            ratings: 5,
            no_of_ratings: 5
          },
          {
            title: `The Forbidden Marriage`,
            genre: 'K-Drama',
            release_year: 2022,
            casts: ['Simu Liu', 'Awkwafina'],
            slug: '/fanta-g-spot',
            image: {
              src: '/images/movies/08.webp',
              alt: 'fanta'
            },
            ratings: 5,
            no_of_ratings: 20
          },
          {
            title: `Payback`,
            genre: 'K-Drama',
            release_year: 2022,
            casts: ['Simu Liu', 'Awkwafina'],
            slug: '/fanta-g-spot',
            image: {
              src: '/images/movies/09.webp',
              alt: 'fanta'
            },
            ratings: 5,
            no_of_ratings: 10
          },
          {
            title: `Eden Season 2`,
            genre: 'K-Drama',
            release_year: 2022,
            casts: ['Simu Liu', 'Awkwafina'],
            slug: '/fanta-g-spot',
            image: {
              src: '/images/movies/10.webp',
              alt: 'fanta'
            },
            ratings: 5,
            no_of_ratings: 5
          },
          {
            title: `The Glory`,
            genre: 'K-Drama',
            release_year: 2022,
            casts: ['Simu Liu', 'Awkwafina'],
            slug: '/fanta-g-spot',
            image: {
              src: '/images/movies/11.webp',
              alt: 'fanta'
            },
            ratings: 5,
            no_of_ratings: 30
          },
          {
            title: `Reborn Rich`,
            genre: 'K-Drama',
            release_year: 2022,
            casts: ['Simu Liu', 'Awkwafina'],
            slug: '/fanta-g-spot',
            image: {
              src: '/images/movies/12.webp',
              alt: 'fanta'
            },
            ratings: 5,
            no_of_ratings: 25
          },
        ],
        movies_data: computed(() => this.data?.map((item, key) => ({
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
        this.showLoader()
        let form_data = JSON.parse(localStorage.getItem('search_params'))
        this.$axios.$post('frontend/search-movies', form_data).then(({ data }) => {
          if (data.length) this.title = `Search results for: "${form_data.title}"`
          else this.title = `No results for "${form_data.title}". Try another keyword`
          this.manipulateData(data)
        })
        .catch(err => {
          this.setError(err.response.data.errors[0])
        })
        this.loaded = true
      },
      manipulateData (data) {
        this.data = data
        setTimeout(() => {
          this.hideLoader()
        }, 200)
      },
      initialization () {
        this.fetchData()
        this.hideLoader()
      }
    },  
    mounted () {
      //get localstorage and redirect to home if no search params
      let form_data = localStorage.getItem('search_params')
      if (!form_data) {
        this.$router.push('/')
      }

      this.$nuxt.$on('favorite-updated', () => {
        this.fetchData()
      })
      this.$nuxt.$on('execute-search', () => {
        this.fetchData()
      })
      setTimeout(() => {
        this.initialization()
      }, 200)
    },
    destroyed () {
      this.$nuxt.$off('favorite-updated')
      this.$nuxt.$off('execute-search')
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
    &__skeleton
      height: 75vh
      display: flex
      align-items: center
      justify-content: center
    &__no-search-icon
      width: 200px
</style>