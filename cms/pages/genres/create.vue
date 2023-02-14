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
            :to="buttons.back_link"
          >
            <span>
              BACK
            </span>
          </nuxt-link>
        </div>
        
        <!--- form part --->
        <div class="cms__form-container">
          <validation-observer tag="div" ref="form">
            <form id="form" class="cms__form-element" @submit.prevent="submit()">
              <div class="cms__form-header">
                <span>INFORMATION</span>
              </div>

              <!--- actual inputs --->
              <div class="cms__form-row cms__form-row--one">
                <validation-provider tag="div" 
                    class="cms__form-group" 
                    name="name" 
                    :rules="{ required: true }" 
                    v-slot="{ errors }"
                  >
                  <label for="name">Name *</label>
                  <input 
                    type="text" 
                    :class="[
                      'cms__form-group__input',
                      errors.length && 'cms__form-group__input--error'
                    ]" 
                    name="name" 
                    autocomplete="off" 
                    placeholder="Enter name" 
                    v-model="form_data.name"
                  >
                  <transition name="slide">
                    <span 
                      class="cms__form-group__error" 
                      v-if="errors.length > 0"
                    > {{ errors[0] }}</span>
                  </transition>
                </validation-provider>
              </div>

              <!--- buttons --->
              <div class="cms__form-buttons">
                <nuxt-link
                  class="cms__form-button cms__form-button--cancel"
                  :to="`${buttons.back_link}`"
                >
                  CANCEL
                </nuxt-link>
                <button 
                  type="submit"
                  class="cms__form-button cms__form-button--success"
                >
                  SUBMIT
                </button>
              </div>
            </form>
          </validation-observer>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
  export default {
    data: () => ({
      title: 'Add Genre',
      buttons: {
        back_link: '/genres'
      },
      form_data: {
        name: ''
      }
    }),
    methods: {
      submit () {
        this.showLoader()
        this.$refs.form.validate().then(success => {
          if (!success) {
            this.$scrollTo('.cms__form-group__error', {
              offset: -250
            })
            this.hideLoader()
            return
          } else {
              // //call axips
              // this.axios.post('').then(res => {
              //   //show confirmation
              //   //redirect to back link
              //   //hide confirmation
              // })
              // .catch(err => {
              //   this.setError(err.response.data.errors[0])
              // })
              // .then(() => {
              //   this.hideLoader()
              // })
              this.hideLoader()
          }
          this.$nextTick(() => {
            this.$refs.form.reset()
          })
        })
      },
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