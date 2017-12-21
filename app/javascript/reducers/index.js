import { combineReducers } from 'redux'
import name from './helloWorldReducer'
import products from './productsListReducer'

export default combineReducers({
  name,
  products,
})
