import * as actionTypes from './constants'

const initialState = {
  query: '',
}

export default (state = initialState, action) => {
  const { type, value } = action
  switch (type) {
    case actionTypes.CLEAR_FILTER:
      return { ...initialState }
    case actionTypes.CHANGE_FILTER:
      return { ...state, query: value }
    default:
      return state
  }
}
