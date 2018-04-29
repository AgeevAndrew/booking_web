import * as actionTypes from './constants'

const initialState = {
  title: '',
  body: '',
  open: false,
  sending: false,
  failure: false,
}

export default (state = initialState, action) => {
  const { type, key, value } = action
  switch (type) {
    case actionTypes.CLOSE:
      return { ...initialState }
    case actionTypes.SENDING:
      return { ...state, sending: true }
    case actionTypes.SEND_SUCCESS:
      return { ...initialState }
    case actionTypes.SEND_FAILURE:
      return { ...state, sending: false, failure: true }
    case actionTypes.CHANGE_FORM:
      return { ...state, [key]: value }
    default:
      return state
  }
}
