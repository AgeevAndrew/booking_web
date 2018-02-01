import * as actionTypes from './constants'

export const toggle = (order) => ({
  type: actionTypes.OPEN,
  order,
})
