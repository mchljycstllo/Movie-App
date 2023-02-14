<template>
  <div :class="attr['page']">
    <div id="cms-dashboard">
      <div class="cms-header">
        <div class="cms-header__inner">
          <span class="cms-header__title">
            {{ title }}
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
            <tr v-for="(item, key) in 10" :key="key">
              <td class="cms__table-td">
                <span class="cms__table__name">
                  TEST
                </span>
              </td>
              <td class="cms__table-td">
                June 27, 1998
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
      title: 'Categories',
      buttons: {
        add: '/categories/create'
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
      ]
    }),
    methods: {
      initialization () {
        this.hideLoader()
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