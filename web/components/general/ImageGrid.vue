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
            :to="`/${item.slug}`"
            :class="attr['section__grid__item__inner']"
          >
            <img
              :class="attr['section__grid__item__thumbnail']"
              :src="`${item.image.src}`"
            />
            <div :class="attr['section__grid__item__movie-text-cover']">
              <movie-text-section
                :payload="item"
              />
            </div>
          </nuxt-link>
          <template
            v-if="auth_user"
          >
            <div :class="attr['section__grid__item__movie-text-cover']">
              <div
                @click="addRemoveFavorite(item)"
                :class="attr['section__grid__item__favorite']"
                :title="`${item.favorite ? 'Remove from favorites' : 'Add to favorites'}`"
              >
                <img
                  :src="getFavoriteImage(item)"
                  :class="attr['section__grid__item__favorite-image']"
                />
              </div>
            </div>
          </template>
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
      //all favorite methods in mixins
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
        display: flex
        flex-direction: column
        align-items: center
        justify-content: space-between
        flex: 0 0 calc(100% / var(--col_no) - 20px)
        margin: 0 10px 20px
        //padding: 5px
        border-radius: 5px
        box-shadow: 0px 0px 9px 0px rgba(0,0,0,0.25)
        cursor: pointer
        transition: .2s ease-in-out
        &:hover
          a
            color: var(--theme_primary)
        &__favorite
          display: flex
          align-items: center
          justify-content: center
          width: 100%
          padding: 10px
          border-radius: 5px
          background-color: rgba(255, 0, 115, 0.3)
          transition: .2s ease-in-out
          border: 2px solid transparent
          &:hover
            border: 2px solid rgba(255, 0, 115, 0.3)
            background-color: var(--theme_white)
        &__favorite-image
          max-width: 30px
        &__inner
          display: block
          margin-bottom: 10px
          width: 100%
        &__thumbnail
          object-fit: cover
          object-position: center
          height: 320px
        &__movie-text-cover
          padding: 10px
          width: 100%
</style>