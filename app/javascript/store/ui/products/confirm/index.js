import * as actionTypes from './constants'

const initialState = {
  openConfirm: false,
  productId: '',
}

export default (state = initialState, action) => {
  const { type, id } = action
  switch (type) {
    case actionTypes.SET_CONFIRM:
      return { ...state, openConfirm: true, productId: id }
    case actionTypes.CANCEL_CONFIRM:
      return { ...state, openConfirm: false, productId: '' }
    default:
      return state
  }
}
