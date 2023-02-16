<template>
  <div :class="attr['page']">
    <div id="cms-dashboard" v-if="loaded">
      <div class="cms-header">
        <div class="cms-header__inner">
          <span class="cms-header__title">
            {{ title }}
          </span>
        </div>
      </div>
      <div class="cms__main-content">
        <!--- record part --->
        <div class="cms__box-container">
          <nuxt-link 
            class="cms__box-item"
            v-for="(item, key) in dashboard_items"
            :key="key"
            :to="item.slug"
          >
            <img 
              :src="item.icon"
              class="cms__box-item__icon"
            />
            <span class="cms__box-item__count">
              {{ records[item.name] }}
            </span>
            <span class="cms__box-item__label">
              {{ item.label }}
            </span>
          </nuxt-link>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
  export default {
    data: () => ({
      loaded: false,
      title: 'Dashboard',
      dashboard_items: [
        {
          name: 'genres',
          slug: '/genres',
          label: 'Genres',
          icon: '/icons/category.png'
        },
        {
          name: 'artists',
          slug: '/artists',
          label: 'Artists',
          icon: '/icons/actor.png'
        },
        {
          name: 'movies',
          slug: '/movies',
          label: 'Movies',
          icon: '/icons/movies.png'
        },
        {
          name: 'users',
          slug: '/users',
          label: 'Users',
          icon: '/icons/users.png'
        }
      ],
      records: {}
    }),
    methods: {
      initialization () {
        this.fetchData()
        this.hideLoader()
      },
      fetchData () {
        this.showLoader()
        this.records = []
        this.loaded = false
        this.$axios.$get(`cms/pages/dashboard`).then(({ data }) => {
          this.manipulateData(data)
        })
        .catch(err => {
          this.setError(err.response.data.errors[0])
        })

        this.loaded = true
        this.hideLoader()
      },
      manipulateData (records) {
        let new_record = {
          ...records
        }
        this.records = new_record
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