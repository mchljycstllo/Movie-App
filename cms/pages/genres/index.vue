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
        <div class="cms__actions">
          <nuxt-link 
            class="cms__actions-button"
            :to="buttons.add"
          >
            <span>
              ADD ITEM
            </span>
          </nuxt-link>
        </div>
        
        <!--- record part --->
        <table class="cms__table">
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
                  {{ item.title }}
                </nuxt-link>
              </td>
              <td class="cms__table-td">
                {{ $moment(item.created_at).format('MMMM DD, YYYY') }}
              </td>
              <td class="cms__table-td">
                <button class="cms__table-button cms__table-button--info">
                  EDIT
                </button>
                <button class="cms__table-button cms__table-button--danger">
                  DELETE
                </button>
              </td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</template>

<script>
  export default {
    data: () => ({
      loaded: false,
      title: 'Genres',
      buttons: {
        add: '/genres/create',
        entity: 'genre'
      },
      table_fields: [
        {
          name: 'name',
          label: 'Name'
        },
        {
          name: 'created_at',
          label: 'Created At'
        },
        {
          name: 'actions',
          label: 'Actions'
        }
      ],
      records: []
    }),
    methods: {
      initialization () {
        this.fetchData()
        this.hideLoader()
        this.loaded = true
      },
      fetchData () {
        this.$axios.$get('cms/genre').then(({ data }) => {
          this.manipulateData(data)
        })
        .catch(err => {
          this.setError(err.response.data.errors[0])
        })
      },
      manipulateData (records) {
        let new_record = records.map((item, key) => ({
          ...item.genre,
          movies: item.movies
        }))
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