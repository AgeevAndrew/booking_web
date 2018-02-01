import row from './row'
import { combineReducers } from 'redux'

export const initialState = {
  categories: {
    row: row.initialState,
  },
}

export default combineReducers({
  row,
})
