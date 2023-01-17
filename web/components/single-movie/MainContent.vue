<template>
  <div :class="attr['section']">
    <div :class="attr['section__wrapper']">
      <div :class="attr['section__wrapper__content']">
        <div :class="attr['section__iframe-container']">
          <iframe
            :class="attr['section__iframe-container__iframe']"
            :src="payload.trailer_link"
            :title="`${payload.title}`">
          </iframe>
        </div>
        <div :class="attr['section__texts-container']">
          <h1 :class="attr['section__texts-container__title']"> 
            {{  payload.title  }} 
          </h1>
          <movie-text-section 
            :payload="payload"
            :show_title="false"
            :show_casts="true"
          />
          <div 
            :class="attr['section__description']"
            v-html="payload.description"
          ></div>

          <comment-section 
            :payload="payload"
          />
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import MovieTextSection from '../general/layouts/MovieTextSection.vue'
  export default {
    components: {
      MovieTextSection: () => import('~/components/general/layouts/MovieTextSection'),
      CommentSection: () => import('~/components/single-movie/CommentSection')
    },  
    props: {
      payload: {
        type: Object,
        default: () => {}
      }
    }
  }
</script>

<style lang="stylus" module="attr">
  .section
    &__wrapper
      max-width: 1180px
      margin: 0 auto
      &__content
        margin: 0 -10px 50px
    &__iframe-container
      position: relative
      overflow: hidden
      width: 100%
      padding-top: 56.25%
      &__iframe
        position: absolute
        top: 0
        left: 0
        bottom: 0
        right: 0
        width: 100%
        height: 100%
    &__texts-container
      margin-top: 20px
      &__title
        font-size: 40px
        font-weight: var(--bold)
    &__description
      margin: 20px 0
</style>