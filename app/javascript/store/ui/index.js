import { combineReducers } from 'redux'
import categories from './categories'
import products from './products'
import errors from './errors'

export const initialState = {
  categories: categories.initialState,
  products: products.initialState,
  errors: errors.initialState,
}

export default combineReducers({
  categories,
  products,
  errors,
})
