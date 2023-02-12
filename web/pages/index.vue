<template>
  <div :class="attr['page']">
    <page-content 
      
    />
  </div>
</template>

<script>
  export default {
    components: {
      PageContent: () => import('~/components/home/PageContent')
    },
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
        movies_data: this.data?.map((item, key) => ({
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
        console.log(this.data)
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

      return $axios.$get('frontend/all-movies')
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