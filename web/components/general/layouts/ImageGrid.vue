<template>
  <section :class="attr['section']">
    <div :class="attr['section__wrapper']">
      <div :class="attr['section__title-container']">
        <h2> {{  title  }} </h2>
      </div>
      <div :class="attr['section__grid']">
        <nuxt-link
          :class="attr['section__grid__item']"
          v-for="(item, key) in payload"
          :key="key"
          :to="item.slug"
        >
          <img
            :class="attr['section__grid__item__thumbnail']"
            :src="`${item.image.src}`"
          />
          <div :class="attr['section__grid__item__texts']">
            <nuxt-link
              :to="item.slug"
              :class="attr['section__grid__item__texts-title']"
            >
              {{  item.title  }}
            </nuxt-link>
            <div :class="attr['section__grid__item__star-container']">
              <div 
                :class="attr['section__grid__item__star']"
                v-for="(rate, rate_key) in item.ratings"
                :key="rate_key"
              >
                <img 
                  src="/images/icons/star-filled.png"
                  :class="attr['star-filled']"
                />
              </div>
              <div 
                :class="[
                  attr['section__grid__item__texts__star'],
                  attr['section__grid__item__texts__star--black'],
                ]"
                v-for="(rate, rate_key) in (5 - item.ratings)"
                :key="rate_key"
              >
                <img 
                  src="/images/icons/star-black.png"
                  :class="[
                    attr['star-filled'],
                    attr['star-filled--black']
                  ]"
                />
              </div>
              <div :class="attr['section__grid__item__group']">
                <label> Release Year:  </label>
                <span> {{ item.release_year }} </span>
              </div>
              <div :class="attr['section__grid__item__group']">
                <label> Genre:  </label>
                <span> {{ item.genre }} </span>
              </div>
            </div>
          </div>
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
      },
      title: {
        type: String,
        default: 'Default Title'
      }
    }
  }
</script>

<style lang="stylus" module="attr">
  //for global icons
  .star-filled
    max-width: 20px
    &--black
      max-width: 17px
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
        flex: 0 0 calc(100% / 5 - 20px)
        margin: 0 10px 20px
        &:hover
          & ^[0]__grid
            &__item
              &__texts-title
                color: var(--theme_primary)
        &__texts
          color: var(--theme_black)
        &__texts-title
          display: inline-block
          margin: 5px 0
          font-size: 20px
          transition: .2s ease-in-out
          color: var(--theme_black)
        &__star-container
          display: flex
          flex-flow: row wrap
          align-items: center
        &__group
          display: flex
          align-items: center
          margin: 5px 0
          span
            display: inline-block
            margin-left: 5px
</style>