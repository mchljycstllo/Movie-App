<template>
  <section :class="attr['section']">
    <div :class="attr['section__artist-grid']">
      <div
        v-for="(item, key) in payload"
        :key="key"
        :class="attr['section__artist-grid__item']"
      >
        <nuxt-link
          :to="`/artists/${item.id}`"
          :class="attr['section__artist-grid__item-inner']"
        >
          <img
            :src="item.image.src"
            :alt="item.image.alt"
            :class="attr['section__artist-grid__image']"
          />
          <h3 :class="attr['section__artist-grid__full-name']">
            {{ item.full_name }}
          </h3>
          <span :class="attr['section__artist-grid__movies-count']">
            Movies: {{ item.movies_count }}
          </span>
        </nuxt-link>
      </div>
    </div>
  </section>
</template>

<script>
  export default {
    props: {
      payload: {
        type: Array,
        default: () => []
      }
    }
  }
</script>

<style lang="stylus" module="attr">
  .section
    &__artist
      &-grid
        display: flex
        flex-flow: row wrap
        margin: 0 -10px
        &__item
          flex: 0 0 calc(100% / 5 - 20px)
          margin: 0 10px
          transition: .2s ease-in-out
          &:hover
            & ^[0]__artist-grid
              &__image
                transform: scale(1.1)
              &__full-name, &__movies-count
                color: var(--theme_primary)
        &__item-inner
          display: flex
          flex-direction: column
          align-items: center
          justify-content: center
        &__image
          width: 150px
          height: 150px
          object-fit: cover
          object-position: center
          border-radius: 500px
          transition: .2s ease-in-out
        &__full-name
          display: -webkit-box
          margin: 20px 0 10px
          -webkit-line-clamp: 2
          -webkit-box-orient: vertical
          overflow: hidden
          color: var(--theme_black)
        &__movies-count
          color: var(--theme_black)
          opacity: 0.8
</style>