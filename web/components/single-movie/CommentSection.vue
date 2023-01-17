<template>
  <div :class="attr['section']">
    <div 
      v-if="payload.comments.length"
      :class="attr['section__comments-container']"
    >
      <div 
        :class="attr['section__comment-row']"
        v-for="(item, key) in payload.comments"
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
          <span> {{  item.user.username  }} </span>
        </div>
        <div
          :class="attr['section__comment-text']"
          v-html="item.comment"
        > 
        </div>
      </div>
    </div>

    <div :class="attr['section__add-comment']" v-if="false">
      DI KO MUNA IDISPLAY
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
    data: () => ({
      displayed_comments: 10
    })
  }
</script>

<style lang="stylus" module="attr">
  .section  
    &__comment-thumbnail-container
      height: 30px
      width: 30px
      overflow: hidden
      border-radius: 100px
    &__comment-user
      max-width: 100px
</style>