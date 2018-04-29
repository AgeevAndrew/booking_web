import * as actionTypes from './constants'

export const changeFilter = (value) => ({ type: actionTypes.CHANGE_FILTER, value })
export const clearFilter = () => ({ type: actionTypes.CLEAR_FILTER })
