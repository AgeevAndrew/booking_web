import * as actionTypes from './constants'

export const open = (pushMessage) => ({
  type: actionTypes.OPEN,
  pushMessage,
})

export const close = () => ({
  type: actionTypes.CLOSE,
})
