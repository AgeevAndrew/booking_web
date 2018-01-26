import entities from './entities'
import ui from './ui'
import { combineReducers } from 'redux'

export const initialState = {
  entities: entities.initialState,
  ui: ui.initialState,
}

export default combineReducers({
  entities,
  ui,
})
