<template>
  <div :class="attr['section']">
    <div :class="attr['section__texts']">
      <nuxt-link
        v-if="show_title"
        :to="`/${payload.slug}`"
        :class="attr['section__texts-title']"
      >
        {{  payload.title  }}
      </nuxt-link>
      <div :class="attr['section__group']">
        <div :class="attr['section__star-container']">
          <div 
            :class="attr['section__star']"
            v-for="(rate, rate_key) in payload.ratings"
            :key="rate_key"
          >
            <img 
              src="/images/icons/star-orange.svg"
              :class="attr['star-filled']"
            />
          </div>
          <div 
            :class="[
              attr['section__texts__star'],
              attr['section__texts__star--black'],
            ]"
            v-for="(rate, rate_key) in (5 - payload.ratings)"
            :key="rate_key + 100"
          >
            <img 
              src="/images/icons/star-black.svg"
              :class="[
                attr['star-filled'],
                attr['star-filled--black']
              ]"
            />
          </div>
        </div>
        <div :class="attr['section__ratings-counter']">
          <span> ({{ payload.no_of_ratings }}) </span>
        </div>
      </div>
      <div :class="attr['section__group']">
        <label> Release Year:  </label>
        <span> {{ payload.release_year }} </span>
      </div>
      <div :class="attr['section__group']">
        <label> Genre:  </label>
        <span> {{ payload.genre }} </span>
      </div>
      <div 
        :class="attr['section__group']"
        v-if="show_casts && payload.casts.length"
      >
        <label> Casts:  </label>
        <nuxt-link
          :to="`/artists/${cast.id}`"
          v-for="(cast, cast_key) in payload.casts"
          :class="attr['section__cast-name']"
          :key="cast_key"
        > {{ cast.full_name }} <b v-if="(cast_key + 1) < payload.casts.length">,</b></nuxt-link>
      </div>
    </div>
  </div>
</template>

<script>
  export default {
    props: {
      payload: {
        type: Object,
        default: () => {}
      },
      show_title: {
        type: Boolean,
        default: true
      },
      show_casts: {
        type: Boolean,
        default: false
      }
    }
  }
</script>

<style lang="stylus" module="attr">
 //for global icons
  .star-filled
    max-width: 20px
    &--black
      max-width: 19px
  .section
    &__texts
      color: var(--theme_black)
      display: flex
      flex-direction: column
    &__texts-title
      display: inline-block
      margin: 15px 0 5px
      font-size: 20px
      font-weight: var(--bold)
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
    &__cast-name
      display: inline-block
      margin: 0 5px
      color: var(--theme_black)
      transition: .2s ease-in-out
      text-decoration: underline
      &:hover
        color: var(--theme_primary)
</style>