import * as actionTypes from './constants'

const initialState = {
  order: {},
  open: false,
  submitting: false,
}

export default (state = initialState, action) => {
  const { type, order } = action
  switch (type) {
    case actionTypes.OPEN:
      return { ...state, order, open: true }
    case actionTypes.CLOSE:
      return { ...state, open: false }
    case actionTypes.BEGIN:
      return { ...state, submitting: true }
    case actionTypes.FAILURE:
      return { ...state, submitting: false }
    case actionTypes.SUCCESS:
      return { ...state, submitting: false }
    default:
      return state
  }
}
