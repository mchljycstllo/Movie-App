<template>
  <aside :class="attr['sidebar']">
    <ul :class="attr['sidebar__links']">
      <li 
        v-for="(item, key) in sidebar_links"
        :key="key"
      >
        <nuxt-link
          custom
          :to="item.url"
          v-slot="{ href, navigate, isActive, isExactActive }"
          >
          <a
            :href="href"
            @click="navigate"
            :class="[
            attr['nav__link-item'],
              (isActive || isExactActive) && attr['nav__link-item--active']
            ]"
          >
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
      sidebar_links: [
        {
          name: 'Profile',
          url: '/profile'
        },
        {
          name: 'Favorites',
          url: '/profile/favorites'
        }
      ]
    })
  }
</script>

<style lang="stylus" module="attr">
  .sidebar
    min-width: 120px
    margin-right: 100px
    ul
      list-style-type: none
</style>
