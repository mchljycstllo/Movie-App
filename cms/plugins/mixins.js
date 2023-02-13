import Vue from 'vue'
import { mapGetters, mapMutations } from 'vuex'
import moment from 'moment'

Vue.mixin({
  computed: {
    ...mapGetters({
      getContentLoaderStatus: 'global/content-loader/getContentLoaderStatus',
      getAuthenticated: 'global/settings/getAuthStatus',
      auth_status: 'global/settings/getAuthStatus',
      auth_user: 'global/settings/getAuthUser'
    })
  },
  methods: {
    ...mapMutations({
      toggleContentLoaderStatus: 'global/content-loader/toggleContentLoaderStatus',
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
    }
  }
})