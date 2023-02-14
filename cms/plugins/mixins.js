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
      if (authenticated) {
        // let token = `eyJhY2Nlc3MtdG9rZW4iOiJKSWpaS1JkZm1SZi0zYW1HekFsTThBIiwidG9rZW4tdHlwZSI6IkJlYXJlciIsImNsaWVudCI6IjlyOS1wdWxTRlo0X2NUZnFRY2ZneEEiLCJleHBpcnkiOiIxNjc3NTgyMTY2IiwidWlkIjoiamF5Y2FzdGlsbG9AbW92aWVhcHAuY29tIn0=`
        // localStorage.setItem('bearer_token', token)
        if (route_name == 'index') {
          this.$router.push('/dashboard')
        }
      }
      else this.$router.push('/')

    },
    logout () {
      localStorage.removeItem('current_user')
      this.logout_user()
      window.open('/', '_SELF')
    },
    //modals
    setSuccess (message) {
      this.set_modal({
        type: 'success',
        show: true,
        message: message ? message : 'Test modal success'
      })
    },
    setError (message) {
      this.set_modal({
        type: 'error',
        show: true,
        message: message ? message : 'Test modal error'
      })
    },
    setConfirmation (message, api) {
      this.set_modal({
        type: 'confirmation',
        show: true,
        message: message,
        api: api
      })
    },
    hideModal () {
      this.set_modal({
        type: '',
        show: false,
        message: '',
        api: ''
      })
    },

    //table
    checkTableSticky () {
      document.addEventListener('scroll', () => {
        let thead = document.querySelector('#cms-table-head')
        let page_offset = window.pageYOffset
        if (page_offset >= 105) {
          thead ? thead.classList.add('cms__table__thead--sticky') : ''
        }
        else {
          thead ? thead.classList.remove('cms__table__thead--sticky') : ''
        }
      })
    }
  }
})