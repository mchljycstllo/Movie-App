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
                  <img
                    class="cms__table-thumbnail"
                    :src="item.image"
                    :alt="item.image_alt"
                  >
                  {{ item.full_name }}
                </nuxt-link>
              </td>
              <td class="cms__table-td">
                {{ item.user_name }}
              </td>
              <td class="cms__table-td">
                {{ item.role }}
              </td>
              <td class="cms__table-td">
                {{ $moment(item.created_at).format('MMMM DD, YYYY') }}
              </td>
              <td class="cms__table-td cms__table-td--buttons">
                <nuxt-link class="cms__table-button cms__table-button--info"
                  :to="`/${buttons.entity}/${item.id}/update`"
                >
                  EDIT
                </nuxt-link>
                <button 
                  :class="[
                    'cms__table-button cms__table-button--danger',
                    !checkCurrentUser(item) && 'cms__table-button cms__table-button--disabled'
                  ]"
                  @click="deleteItem(item)"
                >
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
      title: 'Users',
      buttons: {
        add: '/users/create',
        entity: 'users'
      },
      table_fields: [
        {
          name: 'full_name',
          label: 'Full Name'
        },
        {
          name: 'user_name',
          label: 'User Name'
        },
        {
          name: 'role',
          label: 'Role'
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
        this.$axios.$get(`cms/${this.buttons.entity}`).then(({ data }) => {
          this.manipulateData(data)
        })
        .catch(err => {
          console.log(err)
          //this.setError(err.response.data.errors[0])
        })

        this.loaded = true
        this.hideLoader()
      },
      manipulateData (records) {
        let new_records = records.users.map((item, key) => ({
          ...item,
          title: item.full_name,
          image: item.image ? `${this.image_url}/${item.image.url}` : '/images/unkown_user_placeholder.webp'
        }))
        console.log(new_records)
        this.records = new_records
      },
      checkCurrentUser(item) {
        if (item.id == this.auth_user.id)  return false
        else return true
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