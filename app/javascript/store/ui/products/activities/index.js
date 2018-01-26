import * as actionTypes from './constants'
import { concat, reject } from 'lodash'

const initialState = []

export default (activities = initialState, action) => {
  const { type, productId } = action
  switch (type) {
    case actionTypes.SET_SEND:
      return concat(activities, productId)
    case actionTypes.SET_FINISH:
      return reject(activities, (id) => id === productId)
    default:
      return activities
  }
}
