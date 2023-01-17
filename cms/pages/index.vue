<template>
  <div :class="attr['page']">
    Lorem ipsum dolor sit amet consectetur adipisicing elit. Corporis, praesentium blanditiis? Sapiente eos recusandae atque vitae magnam. Vel nostrum ut, ipsam nisi impedit quis recusandae officia sint iure facilis assumenda?
  </div>
</template>

<script>
  export default {
    mounted () {
      this.$axios.get('test-route').then(res => {
        console.log(res)
      })
    }
  }
</script>

<style lang="stylus" module="attr">
  .page
    //
</style>