import row from './row'
import activities from './activities'
import { combineReducers } from 'redux'

export const initialState = {
  row: row.initialState,
  activities: activities.initialState,
}

export default combineReducers({
  row,
  activities,
})
