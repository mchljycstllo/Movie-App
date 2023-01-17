<template>
  <div id="__movie4pp">
    <nav-bar />
    <Nuxt />
    <Footer />
  </div>
</template>

<script>
  export default {
    provide () {
      return {
        movies_data: [
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
        single_movie_data: {
            title: 'Fanta G Spot',
            genre: 'K-Drama',
            release_year: 2022,
            description: `<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>`,
            casts: ['Simu Liu', 'Awkwafina'],
            slug: '/fanta-g-spot',
            image: {
              src: '/images/movies/01.webp',
              alt: 'fanta'
            },
            ratings: 4,
            no_of_ratings: 10,
            trailer_link: 'https://www.youtube.com/embed/GP--HMACnO8',
            comments: [
              {
                user: {
                  username: 'user101',
                  image: {
                    src: '/images/profiles/zuck.jpeg',
                    alt: 'user101 - image'
                  }
                },
                comment: `This movie is nice`
              },
              {
                user: {
                  username: 'user101',
                  image: {
                    src: '/images/profiles/zuck.jpeg',
                    alt: 'user101 - image'
                  }
                },
                comment: `This movie is nice`
              },
              {
                user: {
                  username: 'user101',
                  image: {
                    src: '/images/profiles/zuck.jpeg',
                    alt: 'user101 - image'
                  }
                },
                comment: `This movie is nice`
              },
              {
                user: {
                  username: 'user101',
                  image: {
                    src: '/images/profiles/zuck.jpeg',
                    alt: 'user101 - image'
                  }
                },
                comment: `This movie is nice`
              },
              {
                user: {
                  username: 'user101',
                  image: {
                    src: '/images/profiles/zuck.jpeg',
                    alt: 'user101 - image'
                  }
                },
                comment: `This movie is nice`
              }
            ]
        },
        related_movies_data: [
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
          }
        ],
      }
    },
    methods: {
      autoPadding () {
        let top_bar = document.querySelector('[data-navbar]')
        let el = document.querySelector('#__movie4pp')
        if (top_bar) {
          let height = top_bar.offsetHeight + 20
          el.style.paddingTop = `${height}px`
        }
      }
    },
    mounted () {
      setTimeout(() => {
        this.autoPadding()
      }, 500)
    }
  }
</script>

<style lang="stylus">
  :root
    --theme_white: #fff
    --theme_black: #000
    --theme_primary: #FF0073
    --theme_error: #D13744
    --roboto: 'Roboto'
    --light: 300
    --reg: 400
    --med: 500
    --semi: 600
    --bold: 700
    --max_width: 1180px
  #__ahc
    transition: .4s ease-in-out

  html
    -webkit-backface-visibility: hidden
    -moz-backface-visibility: hidden
    -ms-backface-visibility: hidden
    -webkit-text-size-adjust: none
    -webkit-font-smoothing: subpixel-antialiased
    backface-visibility: hidden
    font-family: var(--roboto), sans-serif
    font-variant-numeric: lining-nums

    //smooth scroll
    scroll-behavior: smooth


  *,
  *:before,
  *:after
    user-select: none
    box-sizing: border-box
    margin: 0
    word-break: break-word !important
    -webkit-user-drag: none
    font-weight: var(--reg)

  body
    position: relative
    overflow-y: overlay
    overflow-x: hidden
    font-size: 16px
    &.no_click
      pointer-events: none
    &.no_scroll
      overflow-y: hidden
    &::-webkit-scrollbar
      width: 10px
      background-color: rgba(0, 0, 0, 0.15)
    &::-webkit-scrollbar-track
      box-shadow: none
      background-color: transparent
    &::-webkit-scrollbar-thumb
      border-radius: 8px
      background-repeat: no-repeat
      background-clip: padding-box
      background-color: var(--theme_primary)

  ::-webkit-scrollbar-track
    box-shadow: none
    background-color: transparent
  ::-webkit-scrollbar
    width: 7px
    height: 5px
    background-color: rgba(0, 0, 0, 0.15)
  ::-webkit-scrollbar-thumb
    border-radius: 8px
    background-repeat: no-repeat
    background-clip: padding-box
    background-color: var(--theme_primary)

  ::selection
    color: var(--theme_white)
    background-color: var(--theme_primary)

  button
    padding: 0
    border: none
    outline: none
    box-shadow: none
    background-color: transparent

  textarea
    font-family: var(--roboto)
    resize: vertical
    vertical-align: middle

  input,
  input:before,
  input:after,
  textarea,
  textarea:before,
  textarea:after,
  select,
  select:before,
  select:after
    -webkit-appearance: none
    border: none
    outline: none
    box-shadow: none
    user-select: initial
    background-color: transparent
    font-family: var(--roboto)

  ::-webkit-input-placeholder
    color: #B1B1B1
    font-weight: var(--reg)
    text-transform: none

  :-ms-input-placeholder
    color: #B1B1B1
    font-weight: var(--reg)
    text-transform: none

  ::-webkit-datetime-edit
    color: #B1B1B1
    font-weight: var(--reg)
    text-transform: none

  ::placeholder
    color: #B1B1B1
    font-weight: var(--reg)
    text-transform: none

  input::-webkit-outer-spin-button,
  input::-webkit-inner-spin-button
    -webkit-appearance: none
    margin: 0

  iframe,
  video
    border: none
    outline: none

  input[type=number]
    -moz-appearance: textfield

  picture
    display: block

  h1,
  h2,
  h3,
  h4,
  h5
    font-weight: normal

  table
    width: 100%
    border-collapse: collapse

  table
    width: 100%
    margin: 60px 0
    text-align: center
    thead
      background-color: var(--theme_primary)
      th
        padding: 30px
        color: var(--theme_white)
        *
          display: block
        span
          font-size: 14px
          color: rgba(255, 255, 255, 0.6)
    tbody
      tr
        border-bottom: 1px solid #0C0B3326
        td
          padding: 20px
          color: rgba(12, 11, 51, 0.6)
          font-weight: var(--reg)
          strong
            font-weight: var(--semi)
            color: var(--theme_black)

  svg,
  span,
  iframe
    vertical-align: middle

  img
    width: 100%
    height: auto
    vertical-align: middle

  a
    text-decoration: none

  p
    &:empty
      &::before
        content: ' '
        white-space: pre

  .isLoading
    width: 100px !important
    height: auto !important

  .ql-size-huge
    float: left
    padding-right: 10px
    font-family: var(--merri)
    font-size: 70px
    line-height: 1
    color: var(--theme_primary) !important
    transform: translateY(-5px)

  .__swpr
    .swiper-pagination-progressbar
      left: 0
      right: 0
      width: 100%
      max-width: 550px
      height: 5px
      margin: 0 auto
      border-radius: 30px
      background: #F2F2F2
      .swiper-pagination-progressbar-fill
        border-radius: 30px
        background: var(--theme_primary)
    .swiper-pagination-bullets
      left: 0
      right: 0
      bottom: 0
    .swiper-pagination-bullet
      width: 10px
      height: 10px
      margin-right: 20px
      background: #D3D3D3
      opacity: 1
      transition: .4s ease-in-out
      &:last-child
        margin-right: 0
      &.swiper-pagination-bullet-active
        background: var(--theme_primary)
        opacity: 1
    .swiper-button-prev,
    .swiper-button-next
      margin-top: 0
      width: 50px
      height: 50px
      transform: translateY(-50%)
      transition: .4s ease-in-out
      &::after
        content: ''
        font-size: 0
        width: 50px
        height: 50px
        background-position: center
        background-repeat: no-repeat
        background-size: contain
    .swiper-button-prev
      left: -65px
      &::after
        background-image: url('data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxMi4zMDciIGhlaWdodD0iNDIuODMyIiB2aWV3Qm94PSIwIDAgMTIuMzA3IDQyLjgzMiI+CiAgPGcgaWQ9IkNhcm91c2VsX0xlZnRfQnV0dG9uIiBkYXRhLW5hbWU9IkNhcm91c2VsIExlZnQgQnV0dG9uIiB0cmFuc2Zvcm09InRyYW5zbGF0ZSgxLjUgMS45ODYpIj4KICAgIDxwYXRoIGlkPSJJY29uX2ZlYXRoZXItY2hldnJvbi1sZWZ0IiBkYXRhLW5hbWU9Ikljb24gZmVhdGhlci1jaGV2cm9uLWxlZnQiIGQ9Ik0yMi4zMjEsNDcuODYsMTMuNSwyOC40MywyMi4zMjEsOSIgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoLTEzLjUgLTkpIiBmaWxsPSJub25lIiBzdHJva2U9IiNjZWNlY2UiIHN0cm9rZS1saW5lY2FwPSJyb3VuZCIgc3Ryb2tlLWxpbmVqb2luPSJyb3VuZCIgc3Ryb2tlLXdpZHRoPSIzIi8+CiAgPC9nPgo8L3N2Zz4K')
    .swiper-button-next
      right: -65px
      &::after
        background-image: url('data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxMi4zMDciIGhlaWdodD0iNDIuODMyIiB2aWV3Qm94PSIwIDAgMTIuMzA3IDQyLjgzMiI+CiAgPGcgaWQ9IkNhcm91c2VsX1JpZ2h0X0J1dHRvbiIgZGF0YS1uYW1lPSJDYXJvdXNlbCBSaWdodCBCdXR0b24iIHRyYW5zZm9ybT0idHJhbnNsYXRlKDEuOTg2IDEuOTg2KSI+CiAgICA8cGF0aCBpZD0iSWNvbl9mZWF0aGVyLWNoZXZyb24tbGVmdCIgZGF0YS1uYW1lPSJJY29uIGZlYXRoZXItY2hldnJvbi1sZWZ0IiBkPSJNMjIuMzIxLDQ3Ljg2LDEzLjUsMjguNDMsMjIuMzIxLDkiIHRyYW5zZm9ybT0idHJhbnNsYXRlKDIyLjMyMSA0Ny44Nikgcm90YXRlKDE4MCkiIGZpbGw9Im5vbmUiIHN0cm9rZT0iI2NlY2VjZSIgc3Ryb2tlLWxpbmVjYXA9InJvdW5kIiBzdHJva2UtbGluZWpvaW49InJvdW5kIiBzdHJva2Utd2lkdGg9IjMiLz4KICA8L2c+Cjwvc3ZnPgo=')
    &.__swpr--alt
      .swiper-button-prev,
      .swiper-button-next
        width: 100px
        height: 100px
        transform: translateY(-50%)
        &.swiper-button-disabled
          opacity: 0
        &::after
          width: 100px
          height: 100px
    /**
    * Responsive */
    @media (max-width: 1024px) and (min-width: 280px)
      .swiper-button-prev,
      .swiper-button-next
        width: 30px
        height: 30px
        &::after
          width: 30px
          height: 30px
      .swiper-button-prev
        left: 5px
      .swiper-button-next
        right: 5px

  /*
  *** Animations
  */
  .fade-enter-active,
  .fade-leave-active
    transition: .4s ease-in-out

  .fade-enter,
  .fade-leave-to
    opacity: 0

  .searchSlide-enter-active,
  .searchSlide-leave-active
    transition: .4s ease-in-out

  .searchSlide-enter,
  .searchSlide-leave-to
    opacity: 0
    transform: translateY(-100%)

  .slide-x-enter-active,
  .slide-x-leave-active
    transition: .4s ease-in-out

  .slide-x-enter,
  .slide-x-leave-to
    opacity: 0
    transform: translateX(100%)

  .slide-x-alt-enter-active,
  .slide-x-alt-leave-active
    transition: .4s ease-in-out

  .slide-x-alt-enter,
  .slide-x-alt-leave-to
    opacity: 0
    transform: translateX(-100%)

  .slide-y-enter-active,
  .slide-y-leave-active
    transition: .4s ease-in-out

  .slide-y-enter,
  .slide-y-leave-to
    opacity: 0
    transform: translateY(-20px)

  .slide-y-alt-enter,
  .slide-y-alt-leave-to
    opacity: 0
    transform: translateY(50%)

  .slide-y-alt-enter-active,
  .slide-y-alt-leave-active
    transition: .4s ease-in-out

  .page-enter-active,
  .page-leave-active
    transition: .4s ease-in-out

  .page-enter,
  .page-leave-to
    opacity: 0
    transform: translateY(50px)
</style>