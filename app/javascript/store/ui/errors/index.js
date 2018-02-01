import * as actionTypes from './constants'

const initialState = {
  showErrors: true,
}

export default (state = initialState, action) => {
  const { type } = action
  switch (type) {
    case actionTypes.TOGGLE:
      return { showErrors: !state.showErrors }
    default:
      return state
  }
}
