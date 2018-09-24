import modal from './modal'
import { combineReducers } from 'redux'
import * as actionTypes from './constants'

export const initialState = {
    activeIndex: 0,
    modal: modal.initialState,
}
export const tiding = (state = initialState, action) => {
    const { type, activeIndex } = action
    switch (type) {
        case actionTypes.OPEN:
            return { ...state, activeIndex }
        case actionTypes.BEGIN:
            return { ...state, submitting: true }
        case actionTypes.FAILURE:
            return { ...state, submitting: false }
        case actionTypes.SUCCESS:
            return { ...state, open: false, submitting: false }
        default:
            return state
    }
}

export default combineReducers({
    tiding,
    modal,
})
