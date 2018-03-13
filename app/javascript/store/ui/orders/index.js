import modal from './modal'
import { combineReducers } from 'redux'

export const initialState = {
  modal: modal.initialState,
}

export default combineReducers({
  modal,
})
