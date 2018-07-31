import * as actionTypes from './constants'

const initialState = {
    tiding: {},
    open: false,
    submitting: false,
}

export default (state = initialState, action) => {
    const { type, tiding } = action
    switch ( type ) {
        case actionTypes.OPEN:
            return { ...state, tiding, open: true }
        case actionTypes.CLOSE:
            return { ...state, open: false }
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
