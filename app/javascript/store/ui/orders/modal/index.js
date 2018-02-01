import * as actionTypes from './constants'

const initialState = {
  order: {},
  open: false,
}

export default (state = initialState, action) => {
  const { type, order } = action
  switch (type) {
    case actionTypes.OPEN:
      return { ...state, order, open: true }
    case actionTypes.CLOSE:
      return { ...state, open: false }
    default:
      return state
  }
}
