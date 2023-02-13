export default {
    populateTitle (state, payload) {
        state.title = payload.title
    },
    userAuthentication (state, payload) {
        state.authenticated = payload.status
    },
    SET_AUTH_USER (state) {
        let user = localStorage.getItem('current_user')
        if (user) {
            state.auth_user = JSON.parse(user)
            state.auth_status = true
        }
        else {
            state.auth_user = null
            state.auth_status = false
        }

    }
}
