import row from './row'
import activities from './activities'
import confirm from './confirm'
import { combineReducers } from 'redux'

export const initialState = {
  row: row.initialState,
  activities: activities.initialState,
  confirm: confirm.initialState,
}

export default combineReducers({
  row,
  activities,
  confirm,
})
