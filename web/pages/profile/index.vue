<template>
  <div :class="attr['page']">
    <page-content 
      v-if="record"
    />

  </div>
</template>

<script>
import { computed } from 'vue'

  export default {
    components: {
      PageContent: () => import('~/components/profile/PageContent')
    },
    data: () => ({
      loaded: false,
      record: null
    }),
    methods: {
      fetchData () {
        this.$axios.post(`user/get-user-via-id`, {
          id: this.auth_user.id
        }).then(({ data }) => {
          this.manipulateData(data)
        })
        .catch(err => {
          this.setError(err.response.data.errors[0])
        })
      },  
      manipulateData (data) {
        let new_record = {
          ...data.data,
          image: this.checkImage(data.data)
        }
        this.record = new_record
      },
      initialization () {
        if (this.auth_user) {
          this.fetchData()
        }
        this.loaded = true
        this.hideLoader()
      }
    },
    provide () {
      return {
        user_info: computed(() => ({
          ...this.record
        }))
      }
    },
    mounted () {
      setTimeout(() => {
        this.initialization()
      }, 200)
    },
    asyncData({ $axios, store, error }) {
      store.commit('global/content-loader/toggleContentLoaderStatus', {
        type: 'loader',
        status: true
      })
    }
  }
</script>

<style lang="stylus" module="attr">
  .page
    //
</style>