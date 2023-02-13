export default async ({ app, redirect, route, error, store }) => {
  const token = await app.$auth.strategy.token.get()

  switch (route.name) {
    case 'dashboard':
      // if (token) {
      //   redirect('/dashboard')
      // }
      // else {
      //   redirect('/')
      // }
      break
    default:
      break
  }

  store.commit('global/settings/userAuthentication', { status: (token) ? true : false })
}