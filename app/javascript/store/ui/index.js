import { combineReducers } from 'redux'
import categories from './categories'
import products from './products'
import errors from './errors'
import orders from './orders'
import pushMessages from './push_messages'
import companies from './companies'

export const initialState = {
  categories: categories.initialState,
  products: products.initialState,
  errors: errors.initialState,
  orders: orders.initialState,
  pushMessages: pushMessages.initialState,
  companies: companies.initialState,
}

export default combineReducers({
  categories,
  products,
  errors,
  orders,
  pushMessages,
  companies,
})
