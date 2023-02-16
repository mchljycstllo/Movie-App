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
                    name="full name" 
                    :rules="{ required: true }" 
                    v-slot="{ errors }"
                  >
                  <label for="full_name">Full Name *</label>
                  <input 
                    type="text" 
                    :class="[
                      'cms__form-group__input',
                      errors.length && 'cms__form-group__input--error'
                    ]" 
                    name="full_name" 
                    autocomplete="off" 
                    placeholder="Enter full name" 
                    v-model="form_data.full_name"
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
                    name="role" 
                    :rules="{ required: true }" 
                    v-slot="{ errors }"
                  >
                  <label for="role">Role *</label>
                  <div class="cms__form-group__select-container">
                    <select 
                      :class="[
                        'cms__form-group__input',
                        errors.length && 'cms__form-group__input--error'
                      ]" 
                      name="role_id"
                      v-model="form_data.role"
                    >
                      <option value="" selected disabled> Select Role </option>
                      <option value="admin">Admin </option>
                      <option value="user"> User </option>
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
                  name="email" 
                  :rules="{ required: true, email: true }" 
                  v-slot="{ errors }"
                >
                  <label for="email">Email *</label>
                  <input 
                    type="text" 
                    :class="[
                      'cms__form-group__input',
                      errors.length && 'cms__form-group__input--error'
                    ]" 
                    name="email" 
                    autocomplete="off" 
                    placeholder="email@domain.com" 
                    v-model="form_data.email"
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
                  name="username" 
                  :rules="{ required: true }" 
                  v-slot="{ errors }"
                >
                  <label for="user_name">Username *</label>
                  <input 
                    type="text" 
                    :class="[
                      'cms__form-group__input',
                      errors.length && 'cms__form-group__input--error'
                    ]" 
                    name="user_name" 
                    autocomplete="off" 
                    placeholder="Enter username" 
                    v-model="form_data.username"
                  >
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
                    name="password" 
                    :rules="{ required: true }" 
                    v-slot="{ errors }"
                    vid="password"
                  >
                  <label for="password">Password *</label>
                  <input 
                    type="password" 
                    :class="[
                      'cms__form-group__input',
                      errors.length && 'cms__form-group__input--error'
                    ]" 
                    name="password" 
                    autocomplete="off" 
                    placeholder="Enter password" 
                    v-model="form_data.password"
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
                    name="password confirmation" 
                    :rules="{ required: true, confirmed: 'password' }"
                    v-slot="{ errors }"
                  >
                  <label for="password_confirmation">Confirm Password *</label>
                  <input 
                    type="password" 
                    :class="[
                      'cms__form-group__input',
                      errors.length && 'cms__form-group__input--error'
                    ]" 
                    name="password_confirmation" 
                    autocomplete="off" 
                    placeholder="Enter password" 
                    v-model="form_data.password_confirmation"
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
      title: 'Add User',
      buttons: {
        back_link: '/users'
      },
      form_data: {
        full_name: '',
        role: '',
        password: '',
        password_confirmation: '',
        email: '',
        username: ''
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

              this.$axios.post(`${this.app_url}/auth`, form_data).then(res => {
                
                if (res.data && res.data.status == 'success') {
                  //check user
                  if (this.form_data.role == 'admin') {
                    this.$axios.post('cms/update-user-role', {
                      user_id: res.data.data.id,
                      role: 'admin'
                    }).then(update_res => {
                      this.setSuccess('New admin has been saved')
                      setTimeout(() => {
                      this.$router.push(this.buttons.back_link)
                      this.hideModal()
                    }, 1000)
                    })
                  }
                  else {
                    this.setSuccess('User has been saved')
                    setTimeout(() => {
                      this.$router.push(this.buttons.back_link)
                      this.hideModal()
                    }, 1000)
                  }
                }
              })
              .catch(err => {
                //console.log(err)
                //this.setError(err.response.data.errors[0])
              })
              this.hideLoader()
          }
          this.$nextTick(() => {
            this.$refs.form.reset()
          })
        })
      },
      initialization () {
        this.loaded= true
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