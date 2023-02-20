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
            :to="buttons.back_link"
          >
            <span>
              BACK
            </span>
          </nuxt-link>
        </div>
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
                <div 
                  class="cms__table__name no-hover"
                  :to="`/${buttons.entity}/${item.id}/update`"
                >
                  <img
                    class="cms__table-thumbnail"
                    :src="item.image"
                    :alt="item.image_alt"
                  >
                  {{ item.user_name }}
              </div>
              </td>
              <td class="cms__table-td">
                {{ item.content }}
              </td>
              <td class="cms__table-td">
                {{ $moment(item.created_at).format('MMMM DD, YYYY') }}
              </td>
              <td class="cms__table-td cms__table-td--buttons">
                <button 
                  :class="[
                    'cms__table-button cms__table-button--danger',
                    item.movies_count > 0 && 'cms__table-button cms__table-button--disabled'
                  ]"
                  @click="deleteItem(item)"
                >
                  DELETE
                </button>
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
    data: ({ $route }) => ({
      loaded: false,
      title: 'Comments',
      buttons: {
        back_link: `/movies`,
        entity: 'comments'
      },
      table_fields: [
        {
          name: 'user_name',
          label: 'Username'
        },
        {
          name: 'comment',
          label: 'Comment'
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
      },
      fetchData () {
        this.showLoader()
        this.records = []
        this.loaded = false
        this.$axios.$post(`cms/pages/movie-comment-page`, {
          movie_id: this.$route.params.record_id
        }).then(({ data }) => {
          this.manipulateData(data)
        })
        .catch(err => {
          this.setError(err.response.data.errors[0])
        })

        this.loaded = true
        this.hideLoader()
      },
      manipulateData (data) {
        let new_record = data.comments.map(item => ({
          ...item.comment,
          title: 'this comment',
          user_name: item.user.user_name,
          image: `${this.image_url}${item.user.image.url}`
        }))
        this.title = `${data.movie.title} comments`
        this.records = new_record
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