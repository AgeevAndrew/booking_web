import * as actionTypes from './constants'

const initialState = {
    schedules: {},
    open: false,
    submitting: false,
}

export default (state = initialState, action) => {
    const { type, schedules } = action
    switch (type) {
        case actionTypes.OPEN:
            return { ...state, schedules, open: true }
        case actionTypes.CLOSE:
            return { ...state, open: false }
        case actionTypes.BEGIN:
            return { ...state, submiting: true }
        case actionTypes.FAILURE:
            return { ...state, submiting: false }
        case actionTypes.SUCCESS:
            return { ...state, open: false, submiting: false }
        default:
            return state
    }
}
