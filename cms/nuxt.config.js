export default {
  // Global page headers: https://go.nuxtjs.dev/config-head
  head: {
    title: 'Movie App',
    htmlAttrs: {
      lang: 'en'
    },
    meta: [
      { charset: 'utf-8' },
      { name: 'viewport', content: 'width=device-width, initial-scale=1' },
      { hid: 'description', name: 'description', content: '' },
      { name: 'format-detection', content: 'telephone=no' }
    ],
    link: [
      { rel: 'icon', type: 'image/x-icon', href: '/favicon.ico' }
    ]
  },

  loading: {
    color: '#2E3192',
    throttle: 0,
    height: '2px'
  },

  // Global CSS: https://go.nuxtjs.dev/config-css
  css: [
  ],

  // Plugins to run before rendering page: https://go.nuxtjs.dev/config-plugins
  plugins: [
    { src: '~/plugins/vue-scrollto', ssr: false },
    { src: '~/plugins/vue-multiselect', ssr: false },
    { src: '~/plugins/vue-moment' },
    { src: '~/plugins/mixins' },
    { src: '~/plugins/axios' },
    { src: '~/plugins/vee-validate' }
  ],

  // Auto import components: https://go.nuxtjs.dev/config-components
  components: [
    '~/components/general',
    '~/components/general/modal'
  ],

  // Modules for dev and build (recommended): https://go.nuxtjs.dev/config-modules
  buildModules: [
    '@nuxtjs/auth-next'
  ],

  // Modules: https://go.nuxtjs.dev/config-modules
  modules: [
    // https://go.nuxtjs.dev/axios
    '@nuxtjs/axios',
    '@nuxt/image',
    [
      'nuxt-compress', {
        gzip: {
          threshold: 8192
        },
        brotli: {
          threshold: 8192
        }
      }
    ]
  ],
  router: {
    middleware: ['authenticator']
  },
  auth: {
    strategies: {
      local: {
        // tokenRequired: true,
        // tokenType: 'Bearer',
        token: {
          property: 'token',
          maxAge: 604800,
          prefix: 'cms'
        },
        user: {
          property: 'user'
        },
        endpoints: {
          login: { url: `${process.env.APP_URL}/auth/sign_in`, method: 'post' },
          logout: { url: `${process.env.APP_URL}/auth/sign_out`, method: 'post' },
          user: { url: `${process.env.API_URL}/user-data`, method: 'get' }
        }
      }
    }
  },
  googleFonts: {
    download: true,
    inject: true,
    useStylesheet: true,
    families: {
      'Roboto': [300, 400, 500, 600, 700]
    },
    display: 'swap'
  },

  // Axios module configuration: https://go.nuxtjs.dev/config-axios
  axios: {
    credentials: false,
    baseURL: process.env.API_URL,
  },

  // Build Configuration: https://go.nuxtjs.dev/config-build
  build: {
    transpile: ["vee-validate/dist/rules"],
    loaders: {
      cssModules: {
        modules: {
          localIdentName: "m0vie4pp__[hash:base64:6]"
        }
      }
    },
    postcss: null
  }
}
