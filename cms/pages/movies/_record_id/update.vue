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
              <div class="cms__form-row cms__form-row--two">
                <validation-provider tag="div" 
                    class="cms__form-group" 
                    name="title" 
                    :rules="{ required: true }" 
                    v-slot="{ errors }"
                  >
                  <label for="title">Title *</label>
                  <input 
                    type="text" 
                    :class="[
                      'cms__form-group__input',
                      errors.length && 'cms__form-group__input--error'
                    ]" 
                    name="title" 
                    autocomplete="off" 
                    placeholder="Enter title" 
                    v-model="form_data.title"
                  >
                  <transition name="slide">
                    <span 
                      class="cms__form-group__error" 
                      v-if="errors.length > 0"
                    > {{ errors[0] }}</span>
                  </transition>
                </validation-provider>

                <validation-provider tag="div" 
                    class="cms__form-group" 
                    name="genre" 
                    :rules="{ required: true }" 
                    v-slot="{ errors }"
                  >
                  <label for="genre">Genre *</label>
                  <div class="cms__form-group__select-container">
                    <select 
                      :class="[
                        'cms__form-group__input',
                        errors.length && 'cms__form-group__input--error'
                      ]" 
                      name="genre_id"
                      v-model="form_data.genre_id"
                    >
                      <option value="" selected disabled> Select Genre </option>
                      <template v-if="records.genres.length">
                        <option
                          v-for="(item, key) in records.genres"
                          :key="key"
                          :value="item.id"
                        >
                        {{ item.title }}
                        </option>
                      </template>
                    </select>
                    <div class="cms__form-group__select-arrow"></div>
                  </div>

                  <transition name="slide">
                    <span 
                      class="cms__form-group__error" 
                      v-if="errors.length > 0"
                    > {{ errors[0] }}</span>
                  </transition>
                </validation-provider>
              </div>

              <div class="cms__form-row cms__form-row--two">
                <validation-provider tag="div" 
                    class="cms__form-group" 
                    name="artists" 
                    :rules="{ required: true }" 
                    v-slot="{ errors }"
                  >
                  <label for="artists">Artists *</label>
                  <input type="hidden" v-model="form_data.artists">
                  <multiselect
                    placeholder="Search artist"
                    id="artists"
                    label="name"
                    track-by="id"
                    :options="records.artists"
                    :multiple="true"
                    :close-on-select="true"
                    :hide-selected="true"
                    v-model="form_data.artists">
                  </multiselect>
                  <transition name="slide">
                    <span 
                      class="cms__form-group__error" 
                      v-if="errors.length > 0"
                    > {{ errors[0] }}</span>
                  </transition>
                </validation-provider>

                <validation-provider tag="div" 
                    class="cms__form-group" 
                    name="release year" 
                    :rules="{ required: true, numeric: true }" 
                    v-slot="{ errors }"
                  >
                  <label for="release year">Release Year *</label>
                  <input 
                    type="text" 
                    :class="[
                      'cms__form-group__input',
                      errors.length && 'cms__form-group__input--error'
                    ]" 
                    name="release_year" 
                    autocomplete="off" 
                    placeholder="Enter release year" 
                    v-model="form_data.release_year"
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
                    name="description" 
                    :rules="{ required: true, max: 1000 }"
                    v-slot="{ errors }"
                  >
                  <label for="description">Description *</label>
                  <textarea 
                    :class="[
                      'cms__form-group__input',
                      errors.length && 'cms__form-group__input--error'
                    ]"
                    name="description"
                    autocomplete="off"  
                    placeholder="Enter description" 
                    v-model="form_data.description"
                  ></textarea>
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
                  name="trailer link" 
                  :rules="{ required: true }" 
                  v-slot="{ errors }"
                >
                  <label for="trailer link">Trailer Link *</label>
                  <input 
                    type="text" 
                    :class="[
                      'cms__form-group__input',
                      errors.length && 'cms__form-group__input--error'
                    ]" 
                    name="trailer_link" 
                    autocomplete="off" 
                    placeholder="e.g. zGXGA1dMYu4" 
                    v-model="form_data.trailer_link"
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
                  <Uploader 
                    v-if="form_data.thumbnail_image"
                    :file_name="'image'" 
                    ref="image_uploader" 
                    :update="true"
                    :res_image="form_data.thumbnail_image"
                  />
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
      title: 'Update Movie',
      buttons: {
        back_link: '/movies'
      },
      form_data: {
        title: '',
        genre_id: '',
        release_year: '',
        description: '',
        trailer_link: '',
        artists: []
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
              form_data.append('image_alt', `${this.form_data.title} thumbnail`)
              form_data.append('description', this.form_data.description)

              this.form_data.artists.forEach(item => {
                form_data.append('artist_ids[]', item.id)
              })

              this.$axios.patch(`cms/movies/${this.$route.params.record_id}`, form_data).then(res => {
                this.setSuccess('Movie has been updated')
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
        this.$axios.$get(`cms/movies/${this.$route.params.record_id}`).then(({ data }) => {
          this.manipulateData(data)
        })
        .catch(err => {
          this.setError(err.response.data.errors[0])
          //console.log(err)
        })
        .then(() => {
          this.hideLoader()
        })
        this.loaded = true
      },
      manipulateData (data) {
        //format form data
        let new_form_data = {
          ...data.movie,
          thumbnail_image: this.checkImage(data.movie),
          artists: data.artists.map(item => ({
            ...item,
            name: item.full_name
          }))
        }
        this.form_data = new_form_data

        //new records
        let new_records = {
          genres: data.all_genres,
          artists: data.all_artists.map(item => ({
            ...item,
            name: item.full_name
          }))
        }
        this.records = new_records

        console.log(this.form_data)
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