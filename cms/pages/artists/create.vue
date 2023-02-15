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
                <span>INFORMATION </span>
              </div>

              <!--- actual inputs --->
              <div class="cms__form-row cms__form-row--one">
                <validation-provider tag="div" 
                  class="cms__form-group" 
                  name="full name" 
                  :rules="{ required: true }" 
                  v-slot="{ errors }"
                >
                  <label for="trailer link">Name *</label>
                  <input 
                    type="text" 
                    :class="[
                      'cms__form-group__input',
                      errors.length && 'cms__form-group__input--error'
                    ]" 
                    name="full_name" 
                    autocomplete="off" 
                    placeholder="e.g. Juan Dela Cruz" 
                    v-model="form_data.full_name"
                  >
                  <transition name="slide">
                    <span 
                      class="cms__form-group__error" 
                      v-if="errors.length > 0"
                    > {{ errors[0] }}</span>
                  </transition>
                </validation-provider>
              </div>

              <div class="cms__form-row cms__form-row--one">
                <validation-provider tag="div" 
                    class="cms__form-group" 
                    name="thubmanil image"
                    :rules="{ required: false }" 
                    v-slot="{ errors }"
                  >
                  <label for="name">Thumbnail *</label>
                  <Uploader :file_name="'image'" ref="image_uploader" />
                  <transition name="slide">
                    <span 
                      class="cms__form-group__error" 
                      v-if="error_messages"
                    > {{ error_messages }}</span>
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
      loaded: false,
      error_messages: '',
      title: 'Add Artist',
      buttons: {
        back_link: '/artists'
      },
      form_data: {
        name: ''
      },
      records: {
        genres: [],
        artists: []
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
              let image_uploader = this.$refs.image_uploader
              image_uploader.validateImage()
              console.log(image_uploader.data_errors)
              if (image_uploader.data_errors.length > 0) {
                setTimeout(() => {
                  this.$scrollTo('.cms__form-group__error', {
                    offset: -250
                  })
                }, 200)
                this.hideLoader()
                return false
              }

              //form data
              let form_data = new FormData(document.getElementById('form'))
              form_data.append('image_alt', `${this.form_data.full_name} thumbnail`)
              form_data.append('description', this.form_data.description)

              this.$axios.post('cms/artists', form_data).then(res => {
                this.setSuccess('Artist has been saved')
                setTimeout(() => {
                  this.$router.push(this.buttons.back_link)
                  this.hideModal()
                }, 1000)
              })
              .catch(err => {
                this.setError(err.response.data.errors[0])
              })
              this.hideLoader()
          }
          this.$nextTick(() => {
            this.$refs.form.reset()
          })
        })
      },
      fetchData () {
        this.$axios.$get(`cms/pages/movie-create-page`).then(({ data }) => {
          this.manipulateData(data)
        })
        .catch(err => {
          this.setError(err.response.data.errors[0])
        })
        .then(() => {
          this.hideLoader()
        })
        this.loaded = true
      },
      manipulateData (data) {
        let new_records = {
          ...data,
          artists: data.artists.map(item => ({
            ...item,
            name: item.full_name
          }))
        }
        this.records = new_records
      },
      initialization () {
        this.fetchData()
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