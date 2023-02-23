<template>
  <section
    :class="attr['section']"
  >
    <img 
      :src="payload.image.src"
      :alt="payload.image.alt"
      :class="attr['section__image']"
    />
    <h2
      :class="attr['section__name']"
    >
      {{ payload.full_name }}
    </h2>

    <div 
      :class="attr['section__description']"
      v-html="payload.description"
    >
    </div>
  </section>
</template>

<script>
  export default {
    props: {
      payload: {
        type: Object,
        default: () => {}
      }
    }
  }
</script>

<style lang="stylus" module="attr">
  .section
    display: flex
    flex-direction: column
    align-items: center
    justify-content: center
    margin: 0 auto 50px
    &__image
      width: 200px
      height: 200px
      margin: 0 auto 20px
      border-radius: 500px
      object-fit: cover
      object-position: center
    &__name
      color: var(--theme_primary)
      font-size: 24px
      margin-bottom: 20px
    &__description
      max-width: 500px
      margin: 0 auto

</style>