import * as actionTypes from './constants'

const initialState = {
  activeCategoryId: null,
}

export default (categoriesState = initialState, action) => {
  const { activeCategoryId } = action
  switch (action.type) {
    case actionTypes.SET_ACTIVE:
      return { ...categoriesState, activeCategoryId }
    default:
      return categoriesState

  }
}
