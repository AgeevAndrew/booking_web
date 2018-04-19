import * as actionTypes from './constants'

const initialState = {
  pushMessage: {},
  open: false,
}

export default (state = initialState, action) => {
  const { type, pushMessage } = action
  switch (type) {
    case actionTypes.OPEN:
      return { ...state, pushMessage, open: true }
    case actionTypes.CLOSE:
      return { ...state, pushMessage: {}, open: false }
    default:
      return state
  }
}
