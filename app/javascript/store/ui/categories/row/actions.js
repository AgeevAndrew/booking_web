import * as actionTypes from './constants'

export const setActiveCategory = (activeCategoryId) => ({
  type: actionTypes.SET_ACTIVE,
  activeCategoryId,
})
