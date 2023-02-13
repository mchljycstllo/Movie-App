<template>
  <aside :class="attr['sidebar']">
    <ul :class="attr['sidebar__content']">
      <li
        v-for="(item, key) in items"
        :key="key"
      >
      <nuxt-link
          custom
          :to="item.slug"
          v-slot="{ href, navigate, isActive, isExactActive }"
          >
          <a
            :href="item.slug"
            @click="navigate"
            :class="[
            attr['sidebar__link-item'],
              (isActive || isExactActive) && attr['sidebar__link-item--active']
            ]"
          >
            <img 
              :src="`${item.icon}`"
            />
            {{ item.name }} 
          </a>
        </nuxt-link>
      </li>
    </ul>
  </aside>
</template>

<script>
  export default {
    data: () => ({
      items: [
        {
          name: 'Dashboard',
          icon: '/icons/dashboard.png',
          slug: '/dashboard'
        },
        {
          name: 'Categories',
          icon: '/icons/category.png',
          slug: '/categories'
        },
        {
          name: 'Actors',
          icon: '/icons/actor.png',
          slug: '/actors'
        },
        {
          name: 'Movies',
          icon: '/icons/movies.png',
          slug: '/movies'
        },
        {
          name: 'Users',
          icon: '/icons/users.png',
          slug: '/users'
        }
      ]
    })
  }
</script>

<style lang="stylus" module="attr">
  .sidebar
    position: fixed
    padding-top: 70px
    height: 100%
    background-color: var(--theme_snow_white)
    border-right: 3px solid var(--theme_primary)
    ul
      list-style-type: none
      padding: 0
      padding-left: 20px
      width: 150px
      li
        display: block
        margin: 20px 0
        img
          max-width: 20px
          margin-right: 10px
    &__link-item
      display: flex
      align-items: center
      color: var(--theme_black)
      transition: .2s ease-in-out
      &--active, &:hover
        color: var(--theme_primary)
</style>
