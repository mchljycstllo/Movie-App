export default {
  getContentLoaderStatus: (state) => (type) => {
    return state.show[type]
  },
  getModalInfo: (state) => {
    return state.modal
  }
}
