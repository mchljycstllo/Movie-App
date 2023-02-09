<template>
  <main
    :class="[
      (error.statusCode == 42069) ? attr['error--soon'] : '',
      attr['error']
    ]"
    v-if="loaded"
  >
    <div :class="attr['error__wrapper']">
      <template v-if="label.image">
        <nuxt-img
          format="svg"
          loading="lazy"
          preload
          width="250"
          height="90"
          :src="label.image"
        />
      </template>
      <h1 :class="attr['error__wrapper-title']">{{ label.title }}</h1>
      <h2 :class="attr['error__wrapper-subtitle']">{{ label.subtitle }}</h2>
      <nuxt-link
        :class="attr['error__button']"
        to="/"
      >
        Back to Home
      </nuxt-link>
    </div>

  </main>
</template>

<script>
  export default {
    props: ['error'],
    layout: 'error',
    data: () => ({
      loaded: false,
      page_title: 'Movie Review | Home',
      label: {
        title: '',
        subtitle: '',
        button: {
          label: '',
          link: ''
        }
      }
    }),
    methods: {
      initialization () {
        switch (this.error.statusCode) {
          case 404:
            this.page_title = 'Movie Review | Page Not Found'
            this.label = {
              title: 'Oops!',
              subtitle: 'We can\'t seem to find the page you\'re looking for.',
              image: '/error/error-404.svg',
              button: {
                label: 'Back to Home',
                link: '/'
              }
            }
            break
          case 42069:
            this.page_title = 'Movie Review | Coming Soon'
            this.label = {
              title: 'Coming Soon',
              subtitle: 'We are going to launch this page very soon. Stay Tune!',
              button: null
            }
            break
          case 403:
            this.page_title = 'Movie Review | Access Denied'
            this.label = {
              title: 'Oops!',
              subtitle: 'You don\'t have permission to access this page.',
              image: '/error/error-403.svg',
              button: {
                label: 'Back to Home',
                link: '/'
              }
            }
            break
          case 401:
            this.page_title = 'Movie Review | Unauthorized'
            this.label = {
              title: 'Error 401',
              subtitle: 'Oops! Looks like your token has been expired!',
              button: {
                label: 'Re-login',
                link: '/login'
              }
            }
            break
          default:
            this.page_title = 'Movie Review | Something Went Wrong'
            this.label = {
              title: 'Oops!',
              subtitle: 'Something Went Wrong.',
              image: '/error/error-500.svg',
              button: {
                label: 'Back to Home',
                link: '/'
              }
            }
            break
        }

        setTimeout( () => {
          this.loaded = true
          this.hideLoader()
        }, 500)
      }
    },
    mounted () {
      this.initialization()
    },
    head () {
      return {
        title: this.page_title
      }
    }
  }
</script>

<style lang="stylus" module="attr">
  .error
    position: relative
    display: flex
    flex-flow: row wrap
    align-items: center
    justify-content: center
    width: 100%
    max-width: var(--max_width)
    height: 900px
    margin: 0 auto
    padding: 5% 0 10%
    text-align: center
    &__wrapper
      position: relative
      z-index: 1
      display: flex
      flex-flow: column wrap
      align-items: center
      justify-content: center
      &-title
        position: relative
        margin: 30px 0 20px
        padding-bottom: 20px
        font-family: var(--roboto)
        font-weight: var(--med)
        font-size: 40px
        letter-spacing: -0.8px
        color: var(--theme_black)
        &::before
          content: ''
          position: absolute
          bottom: 0
          left: 0
          right: 0
          width: 55px
          height: 2px
          margin: 0 auto
          background-color: var(--theme_primary)
      &-subtitle
        width: 100%
        max-width: 300px
        margin: 0 auto 30px
        font-size: 20px
        letter-spacing: -0.3px
        line-height: 2
        color: var(--theme_black)
    &__button
      padding: 10px 20px
      border-radius: 20px
      background-color: var(--theme_primary)
      color: var(--theme_white)
      cursor: pointer
      transition: .2s ease-in-out
      border: 1px solid var(--theme_primary)
      &:hover
        background-color: var(--theme_white)
        color: var(--theme_primary)
  /**
  * Responsive */
  @media (max-width: 1024px) and (min-width: 280px)
    .error
      max-width: 100%
      padding: 10em 20px
      &__wrapper
        &-title
          font-size: 35px
        &-subtitle
          font-size: 14px
</style>