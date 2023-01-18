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
          <span> {{  item.user.username  }} </span>
          <div
            :class="attr['section__comment-text']"
            v-html="item.comment"
          >
          </div>
        </div>
      </div>
    </div>

    <div 
      :class="attr['section__add-comment']"
      v-if="show_element.add_comment_box"
    >
      <textarea 
        :class="attr['section__add-comment__textarea']"
        v-model="new_comment.comment"
      >
      </textarea>
      <button
        :class="attr['section__add-comment__submit']"
        @click="submitComment()"
      >
        Submit Comment
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
      new_comment: {
        user: {
          username: 'user101',
          image: {
            src: '/images/profiles/zuck.jpeg',
            alt: 'user101 - image'
          }
        },
        comment: ``
      }
    }),
    methods: {
      submitComment () {
        this.all_comments.push(this.new_comment)
        this.new_comment = ''
        this.show_element.add_comment_box = false
      }
    }
  }
</script>

<style lang="stylus" module="attr">
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
        font-family: var(--roboto)
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
</style>