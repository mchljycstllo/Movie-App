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
                      errors.length && 'cms__form-group__input--error',
                      $route.params.record_id != auth_user.id && 'cms__form-group__input--readonly'
                    ]" 
                    name="full_name" 
                    :readonly="$route.params.record_id != auth_user.id"
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
                    :class="[
                      'cms__form-group',
                      $route.params.record_id == auth_user.id && 'cms__form-group--disabled'
                    ]" 
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
                      name="role"
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
                      errors.length && 'cms__form-group__input--error',
                      $route.params.record_id != auth_user.id && 'cms__form-group__input--readonly'
                    ]" 
                    :readonly="$route.params.record_id != auth_user.id"
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
                      errors.length && 'cms__form-group__input--error',
                      $route.params.record_id != auth_user.id && 'cms__form-group__input--readonly'
                    ]" 
                    :readonly="$route.params.record_id != auth_user.id"
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

              <!-- password --->
              <div 
                class="cms__form-row cms__form-row--two"
                v-if="$route.params.record_id == auth_user.id"
              >
                <validation-provider tag="div" 
                    class="cms__form-group" 
                    name="password" 
                    :rules="{ required: false }" 
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
                    @input="checkRequiredPassword()"
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
                    :rules="{ required: confirm_password_required, confirmed: 'password' }"
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
                  <Uploader 
                    v-if="form_data.thumbnail_image"
                    :file_name="'image'"
                    ref="image_uploader" 
                    :res_image="form_data.thumbnail_image"
                    :uploader_name="'profile picture'"
                    :removable="$route.params.record_id == auth_user.id"
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
      title: 'Update User',
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
      },
      confirm_password_required: false
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
              form_data.append('user_id', this.$route.params.record_id)
              this.$axios.post(`user/validate-registration-info`, form_data)
              .then(res => {
                this.proceedUpdate()
              })
              .catch(err => {
                this.setError(err.response.data.errors[0])
                this.hideLoader()
              })
              
          }
          this.$nextTick(() => {
            this.$refs.form.reset()
          })
        })
      },
      proceedUpdate () {
        let form_data = new FormData(document.getElementById('form'))

        this.$axios.patch(`cms/users/${this.$route.params.record_id}`, form_data).then(res => {
          this.setSuccess('User has been updated')
            setTimeout(() => {
              this.$router.push(this.buttons.back_link)
              this.hideModal()
          }, 1000)    
        })
        .catch(err => {
          this.hideLoader()
        })
      },
      initialization () {
        this.fetchData()
        this.hideLoader()
        this.loaded = true
      },
      fetchData () {
        this.$axios.$get(`cms/users/${this.$route.params.record_id}`).then(({ user }) => {
          this.manipulateData(user)
        })
        .catch(err => {
          this.setError(err.response.data.errors[0])
        })
      },
      manipulateData (record) {
        this.form_data = {
          ...record,
          password: '',
          password_confirmation: '',
          username: record.user_name,
          thumbnail_image: this.checkImage(record)
        }
      },
      checkRequiredPassword () {
        if (this.form_data.password.length > 0) this.confirm_password_required = true
        else this.confirm_password_required = false

        console.log(this.confirm_password_required)
      }
    },  
    mounted () {
      this.$nuxt.$on('pressed-hide-modal', () => {
        this.$router.push('/users')
      })
      setTimeout(() => {
        this.initialization()
      }, 200)
    },
    asyncData({ $axios, store, error }) {
      store.commit('global/content-loader/toggleContentLoaderStatus', {
        type: 'loader',
        status: true
      })
    },
    destroyed () {
      this.$nuxt.$off('pressed-hide-modal')
    }
  }
</script>

<style lang="stylus" module="attr">
  .page
    //
</style>