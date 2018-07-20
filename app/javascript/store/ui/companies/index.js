import { combineReducers } from 'redux'
import company from './company'

export const initialState = {
    companies: company.initialState,
}

export default combineReducers({
    company,
})
