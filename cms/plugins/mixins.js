import Vue from 'vue'
import { mapGetters, mapMutations } from 'vuex'
import moment from 'moment'

Vue.mixin({
  computed: {
    ...mapGetters({
      getContentLoaderStatus: 'global/content-loader/getContentLoaderStatus',
      getAuthenticated: 'global/settings/getAuthStatus',
      auth_status: 'global/settings/getAuthStatus',
      auth_user: 'global/settings/getAuthUser',
      modal_info: 'global/modal/getModalInfo'
    })
  },
  methods: {
    ...mapMutations({
      toggleContentLoaderStatus: 'global/content-loader/toggleContentLoaderStatus',
      setAuth: 'global/settings/SET_AUTH_USER',
      logout_user: 'global/settings/LOGOUT_USER',
      set_modal: 'global/modal/SET_MODAL'
    }),
    hideLoader () {
      this.$store.commit('global/content-loader/toggleContentLoaderStatus', {
        type: 'loader',
        status: false
      })
      document.body.classList.remove('no-click')
    },
    showLoader () {
      this.$store.commit('global/content-loader/toggleContentLoaderStatus', {
        type: 'loader',
        status: true
      })
    },
    runMiddleware () {
      let authenticated = this.auth_status
      let route_name = this.$route.name
      console.log(route_name)
      switch (route_name) {
        case 'index':
        case 'dashboard':
          if (authenticated) this.$router.push('/dashboard')
          else this.$router.push('/')
          break
        default:
          break
      }
    },
    logout () {
      localStorage.removeItem('current_user')
      this.logout_user()
      window.open('/', '_SELF')
    },
    //modals
    setSuccess (message=null) {
      this.set_modal({
        type: 'success',
        show: true,
        message: message ? messsage : 'Test modal success'
      })
    },
    setError (message) {
      this.set_modal({
        type: 'error',
        show: true,
        message: message ? message : 'Test modal error'
      })
    },
    hideModal () {
      this.set_modal({
        show: false
      })
    }
  }
})