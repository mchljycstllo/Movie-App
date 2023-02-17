export default {
  SET_MODAL: (state, payload) => {
    state.modal.type = payload.type
    state.modal.show = payload.show
    state.modal.message = payload.message
    state.modal.api = payload.api
  }
}