export default {
    getTitle: (state) => {
        return state.title
    },
    getAuthenticated: (state) => {
        return state.authenticated
    },
    getAuthStatus: (state) => {
        return state.auth_status
    },
    getAuthUser: (state) => {
        return state.auth_user
    },
    getImageURL (state) {
        return state.image_url
    }
}
