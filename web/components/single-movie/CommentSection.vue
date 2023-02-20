<template>
  <div :class="attr['section']">
    <div 
      v-if="all_comments.length"
      :class="attr['section__comments-container']"
    >
      <h3>Comments ({{ all_comments.length }})</h3>
      <div 
        :class="attr['section__comment-row']"
        v-for="(item, key) in all_comments"
        :key="key"
      >
        <div :class="attr['section__comment-user']">
          <div :class="attr['section__comment-thumbnail-container']">
            
            <img 
              :src="item.user.image.src"
              :alt="item.user.image.alt"
              :class="attr['section__comment-thumbnail']"
            />
          </div>
        </div>
        <div :class="attr['section__comment-text-wrapper']">
          <div :class="attr['section__group']"> 
            <span :class="attr['section__group__username']">{{  item.user.user_name  }} </span>
            <div :class="attr['section__star-container']">
            <div 
              :class="attr['section__star']"
              v-for="(rate, rate_key) in payload.ratings"
              :key="rate_key"
            >
              <img 
                src="/images/icons/star-orange.svg"
                :class="attr['star-filled']"
              />
            </div>
            <div 
              :class="[
                attr['section__texts__star'],
                attr['section__texts__star--black'],
              ]"
              v-for="(rate, rate_key) in (5 - payload.ratings)"
              :key="rate_key + 100"
            >
              <img 
                src="/images/icons/star-black.svg"
                :class="[
                  attr['star-filled'],
                  attr['star-filled--black']
                ]"
              />
            </div>
        </div>
          </div>
          <div
            :class="attr['section__comment-text']"
            v-html="item.comment"
          >
          </div>
          <template 
            v-if="auth_user"
          >
            <div
              :class="attr['section__comment-controls']"
            >
              <span
                :class="[
                  attr['section__comment-control'],
                  attr['section__comment-control--edit']
                ]"
                v-if="checkEditableComment(item)"
                @click="displayEditComment(item)"
              >
                Edit
              </span>
              <span
                v-if="checkDeletableComment(item)"
                @click="deleteComment(item)"
                :class="[
                  attr['section__comment-control'],
                  attr['section__comment-control--delete']
                ]"
              >
                Delete
              </span>
            </div>
          </template>
        </div>
      </div>
    </div>

    <div 
      :class="attr['section__add-comment']"
      v-show="show_element.add_comment_box"
    >
      <div :class="[
        attr['section__group'],
        attr['section__group--comment-inputs']
      ]"> 
        <span>Your Rating: </span>
        <div :class="attr['section__star-container']">
          <div 
            :class="attr['section__star']"
            v-for="(rate, rate_key) in comment_form_data.rating_score"
            :key="rate_key"
          >
            <img 
              @click="adjustRating(rate, 'add')"
              src="/images/icons/star-orange.svg"
              :class="attr['star-filled']"
            />
          </div>
          <div 
            :class="[
              attr['section__texts__star'],
              attr['section__texts__star--black'],
            ]"
            v-for="(rate, rate_key_2) in (5 - comment_form_data.rating_score)"
            :key="rate_key_2 + 100"
          >
            <img
              @click="adjustRating(rate + comment_form_data.rating_score, 'add')"
              src="/images/icons/star-black.svg"
              :class="[
                attr['star-filled'],
                attr['star-filled--black']
              ]"
            />
          </div>
        </div>
      </div>
      <textarea 
        :class="attr['section__add-comment__textarea']"
        v-model="comment_form_data.comment"
        placeholder="Share your thoughts about this movie"
      >
      </textarea>
      <button
        :class="attr['section__add-comment__submit']"
        @click="submitComment()"
      >
        Submit Comment and Rate
      </button>
    </div>

    <div 
      :class="attr['section__add-comment']"
      v-if="show_element.edit_comment_box"
    >
      <textarea 
        :class="attr['section__add-comment__textarea']"
        v-model="edit_comment_form_data.comment"
      >
      </textarea>
      <button
        :class="attr['section__add-comment__submit']"
        @click="submitEditedComment()"
      >
        Update Comment and Rating
      </button>
    </div>
  </div>
</template>

<script>
  export default {
    props: {
      payload: {
        type: Object,
        default: () => {}
      }
    },
    data: ({ payload }) => ({
      show_element: {
        add_comment_box: true,
        edit_comment_box: false
      },
      displayed_comments: 10,
      all_comments: payload.comments,
      comment_type: 'new-comment',
      comment_form_data: {
        user: {
          username: 'user101',
          image: {
            src: '/images/profiles/zuck.jpeg',
            alt: 'user101 - image'
          }
        },
        comment: ``,
        rating_score: 5
      },
      edit_comment_form_data: null
    }),
    methods: {
      submitComment () {
        if (this.comment_form_data.comment.length == 0) {
          this.setError('Comment is required')
          return false
        }
        this.showLoader()
        this.$axios.$post(`user/comments`, {
          movie_id: this.payload.id,
          user_id: this.auth_user.id,
          content: this.comment_form_data.comment
        }).then(res => {
          this.$axios.post('user/ratings', {
            movie_id: this.payload.id,
            user_id: this.auth_user.id,
            score: this.comment_form_data.rating_score
          }).then(ratings_res => {
            this.hideLoader()
            this.setSuccess('Your comment and ratings have been added')
            this.refreshPage()
          })
          .cat(err => {
            this.setError(err.response.data.errors[0])
          })
          
        })
        .catch(err => {
          this.setError(err.response.data.errors[0])
        })
      },
      checkAllowComments () {
        if (this.auth_user) {
          if (this.all_comments.length) {
            let user_comment = this.all_comments.find(item => {
              return item.user.id == this.auth_user.id
            })
            if (user_comment) this.show_element.add_comment_box = false
            else return this.show_element.add_comment_box = true
          }
          else return this.show_element.add_comment_box = true
        } else return this.show_element.add_comment_box = false
      },
      checkDeletableComment (item) {
        if (this.auth_user.role == 'admin') return true
        else return item.comment_user_id == this.auth_user.id ? true : false
      },
      checkEditableComment (item) {
        return item.comment_user_id == this.auth_user.id ? true : false
      },
      displayEditComment (item) {
        console.log(item)
        this.edit_comment_form_data = {
          ...item,
          user: {
            ...this.auth_user,
            username: this.auth_user.user_name,
            image: {
              src: this.checkImage(this.auth_user),
              alt: `${this.auth_user.user_name} profile picture`
            }
          },
          comment: item.content
        }
        this.show_element.edit_comment_box = true
      },
      submitEditedComment () {
        this.$axios.$patch(`user/comments/${this.edit_comment_form_data.id}`, {
          movie_id: this.payload.id,
          user_id: this.auth_user.id,
          content: this.edit_comment_form_data.comment
        })
        .then(res => {
          this.setSuccess('Your comment has been edited')
          this.refreshPage()
        })
        .catch(err => {
          this.setError(err.response.data.errors[0])
        })
      },
      deleteComment (item) {
        this.comment_to_delete = item
        let delete_payload = {
          ...item,
          title: 'your comment',
          api: `user/comments/${item.id}`
        }
        this.deleteItem(delete_payload)
      },
      refreshPage () {
        setTimeout(() => {
          window.open(`/${this.$route.params.slug}`, '_SELF')
        }, 1000)
      },
      adjustRating (score, input_type) {
        console.log(score)
        if (input_type == 'add') {
          this.comment_form_data.rating_score = score
        }
        else {

        }
      }
    },
    mounted () {
      this.$nuxt.$on('clicked-proceed', () => {
        window.open(`/${this.$route.params.slug}`, '_SELF')
      })
      this.checkAllowComments()
    },
    destroyed () {
      this.$nuxt.$off('clicked-proceed')
    }
  }
</script>

<style lang="stylus" module="attr">
  .star-filled
    max-width: 20px
    &--black
      max-width: 19px
  .section  
    &__comment
      &-thumbnail-container
        height: 30px
        width: 30px
        overflow: hidden
        border-radius: 100px
      &-user
        margin-right: 10px
        max-width: 100px
      &-row
        display: flex
        align-items: flex-start
        margin: 15px 0
      &-text
        margin-top: 10px
        max-width: 500px
      &-controls
        margin: 10px 0
      &-control
        display: inline-block
        margin-right: 5px
        cursor: pointer
        &--edit
          color: var(--theme_success)
        &--delete
          color: var(--theme_error)
    &__add-comment
      display: flex
      flex-direction: column
      align-items: center
      justify-content: center
      textarea
        width: 100%
        max-width: 500px
        margin: 10px auto
        border-bottom: 2px solid var(--theme_gray)
        font-family: sans-serif
      &__submit
        padding: 10px 20px
        border-radius: 20px
        background-color: var(--theme_primary)
        color: var(--theme_white)
        cursor: pointer
        transition: .2s ease-in-out
        border: 1px solid var(--theme_primary)
        &:hover
          background-color: var(--theme_white)
          color: var(--theme_primary)
    &__star-container
      display: flex
      flex-flow: row wrap
      align-items: center
      transform: translateY(-2px)
    &__group
      display: flex
      align-items: center
      margin: 5px 0
      &__username
        display: inline-block
        margin-right: 5px
      &--comment-inputs
        .star-filled
          max-width: 50px
</style>