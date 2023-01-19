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
            attr['sidebar__link-item'],
              (isExactActive) && attr['sidebar__link-item--active']
            ]"
          >
          <img 
            :src="`${item.img}`"
            :class="attr['sidebar__link-image']"
          />
            {{ item.name }}
          </a>
        </nuxt-link>
      </li>
      <li
        :key="100"
      >
        <img 
          src="/images/icons/logout.png"
          :class="attr['sidebar__link-image']"
        />
        <span
          :class="attr['sidebar__link-item']"
          @click="logout()"
        >
          Logout
        </span>
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
          url: '/profile',
          img: '/images/icons/user.png'
        },
        {
          name: 'Favorites',
          url: '/profile/favorites',
          img: '/images/icons/heart.png'
        }
      ]
    }),
    methdos: {
      logout () {
        console.log('logout')
      }
    }
  }
</script>

<style lang="stylus" module="attr">
  .sidebar
    min-width: 120px
    margin-right: 100px
    padding-right: 20px
    width: 100%
    ul
      display: flex
      flex-direction: column
      padding: 0
      list-style-type: none
      li
        display: inline-block
        padding: 20px 10px
    &__link-item
      color: var(--theme_black)
      transition: .2s ease-in-out
      cursor: pointer
      &:hover, &--active
        color: var(--theme_primary)
    &__link-image
      max-width: 20px
      margin-right: 10px
</style>
