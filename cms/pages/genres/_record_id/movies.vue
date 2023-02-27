<template>
  <div :class="attr['page']">
    <div id="cms-dashboard" v-if="loaded">
      <div class="cms-header">
        <div class="cms-header__inner">
          <span class="cms-header__title">
            {{ title }} : {{ records.length }} {{ records.length == 1 ? 'item' : 'items' }}
          </span>
        </div>
      </div>
      <div class="cms__main-content">
        <nuxt-link 
          class="cms__actions-button"
          :to="buttons.back_link"
        >
          <span>
            BACK
          </span>
        </nuxt-link>

        <!--- record part --->
        <table 
          class="cms__table"
          v-if="records.length"
        >
          <thead 
            class="cms__table__thead"
            id="cms-table-head"
          >
            <tr>
              <th 
                v-for="(field, key) in table_fields" 
                :key="key"
                class="cms__table-th"
              >
                {{ field.label }}
              </th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="(item, key) in records" :key="key">
              <td class="cms__table-td">
                <nuxt-link 
                  class="cms__table__name"
                  :to="`/${buttons.entity}/${item.id}/update`"
                >
                  <img
                    class="cms__table-thumbnail"
                    :src="item.image"
                    :alt="item.image_alt"
                  >
                  {{ item.title }}
                </nuxt-link>
              </td>
            </tr>
          </tbody>
        </table>
        <span 
          v-else
          class="cms__no-data"
        >
          No data available
        </span>
      </div>
    </div>
  </div>
</template>

<script>
  export default {
    data: () => ({
      loaded: false,
      title: 'Movies',
      buttons: {
        add: '/movies/create',
        back_link: `/genres`,
        entity: 'movies'
      },
      table_fields: [
        {
          name: 'title',
          label: 'Title'
        }
      ],
      records: [],
      artist: null
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
        this.$axios.$post(`cms/pages/genre-movies-page`, {
          genre_id: this.$route.params.record_id
        }).then(({ data }) => {
          this.manipulateData(data)
        })
        .catch(err => {
          // this.setError(err.response.data.errors[0])
          console.log(err)
        })

        this.loaded = true
        this.hideLoader()
      },
      manipulateData (records) {
        this.title = `${records.genre.title} movies`
        let new_record = records.movies.map((item, key) => ({
          ...item,
          image: `${this.image_url}/${item.image.url}`
        }))
        this.records = new_record
        console.log(records)
      }
    },  
    mounted () {
      this.$nuxt.$on('clicked-proceed', () => {
        this.fetchData ()
      })
      setTimeout(() => {
        this.initialization()
      }, 200)
    },
    destroyed () {
      this.$nuxt.$off('clicked-proceed')
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