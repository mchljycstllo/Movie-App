import Vue from 'vue'
import { mapGetters, mapMutations } from 'vuex'
import moment from 'moment'

Vue.mixin({
  computed: {
    ...mapGetters({
      getContentLoaderStatus: 'global/content-loader/getContentLoaderStatus',
      image_url: 'settings/getImageURL'
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
    },
    showLoader () {
      this.$store.commit('global/content-loader/toggleContentLoaderStatus', {
        type: 'loader',
        status: true
      })
    }
  }
})