import { combineReducers } from 'redux'
import categories from './categories'
import products from './products'
import errors from './errors'
import orders from './orders'

export const initialState = {
  categories: categories.initialState,
  products: products.initialState,
  errors: errors.initialState,
  orders: orders.initialState,
}

export default combineReducers({
  categories,
  products,
  errors,
  orders,
})
