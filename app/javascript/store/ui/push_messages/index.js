import modal from './modal'
import form from './form'
import filter from './filter'
import { combineReducers } from 'redux'

export const initialState = {
  modal: modal.initialState,
  form: form.initialState,
  filter: filter.initialState,
}

export default combineReducers({
  modal,
  form,
  filter,
})
