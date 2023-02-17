<template>
  <section :class="attr['section']">
    <div :class="attr['section__wrapper']">
      <div :class="attr['section__title-container']">
        <h2> {{  title  }} </h2>
      </div>
      <div :class="attr['section__grid']">
        <div
          :class="attr['section__grid__item']"
          :style="`--col_no: ${number_of_columns}`"
          v-for="(item, key) in payload"
          :key="key"
        >
          <nuxt-link
            :to="item.slug"
          >
            <img
              :class="attr['section__grid__item__thumbnail']"
              :src="`${item.image.src}`"
            />
            <movie-text-section
              :payload="item"
            />
          </nuxt-link>
          <div
            @click="addRemoveFavorite(item)"
          >
            {{ item.favorite }}
          </div>
        </div>
      </div>
    </div>
  </section>
</template>

<script>
  export default {
    components: {
      MovieTextSection: () => import('~/components/general/layouts/MovieTextSection')
    },  
    props: {
      payload: {
        type: Array,
        default: () => []
      },
      title: {
        type: String,
        default: 'Default Title'
      },
      number_of_columns: {
        type: Number,
        default: 5
      }
    },
    methods: {
      addRemoveFavorite(item) {
        item.favorite ? this.removeFavorite(item) : this.addFavorite(item)
      },
      addFavorite (item) {
        this.$axios.post('user/favorites', {
          user_id: this.auth_user.id,
          movie_id: item.id
        }).then(res => {
          this.$nuxt.$emit('favorite-updated')
        })
        .catch(err => {
          this.setError(err.response.data.errors[0])
        })
      },
      removeFavorite (item) {
        this.$axios.delete(`user/favorites/${item.favorite}`).then(res => {
          this.$nuxt.$emit('favorite-updated')
        })
        .catch(err => {
          this.setError(err.response.data.errors[0])
        })
      }
    },
    data: ({ payload }) => ({
      all_movies: payload
    })
  }
</script>

<style lang="stylus" module="attr">
  .section
    padding: 0 10px
    &__wrapper
      width: 100%
      max-width: 1180px
      margin: 0 auto
    &__title-container
      margin: 0 -10px 30px
    &__grid
      display: flex
      flex-flow: row wrap
      margin: 0 -20px
      &__item
        flex: 0 0 calc(100% / var(--col_no) - 20px)
        margin: 0 10px 20px
        cursor: pointer
        transition: .2s ease-in-out
        &:hover
          a
            color: var(--theme_primary)
</style>