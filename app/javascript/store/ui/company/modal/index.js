import * as actionTypes from './constants'

const initialState = {
    schedules: {},
    open: false,
    submitting: false,
}

const ERROR_STR = 'Ошибка при сохранении времени работы'

export default (state = initialState, action) => {
    const { type, schedules, key, value } = action
    switch (type) {
        case actionTypes.OPEN:
            return { ...state, schedules, open: true }
        case actionTypes.CLOSE:
            return { ...state, open: false }
        case actionTypes.BEGIN:
            return { ...state, submiting: true }
        case actionTypes.FAILURE:
            return { ...state, submiting: false, error: ERROR_STR }
        case actionTypes.SUCCESS:
            return { ...state, open: false, submiting: false }
        case actionTypes.EDIT:
            const sched = state.schedules
            sched[key] = value
            return { ...state, schedules: sched }
        default:
            return state
    }
}
