import * as actionTypes from './constants'

const initialState = {
            tiding: {
                id: null,
                category: '',
                title: '',
                body: '',
                message: '',
            },
            open: false,
            submitting: false,
            error: '',
}

const ERROR_STR = 'При выполнении операции произошла ошибка'

export default (state = initialState, action) => {
    const { type, key, value } = action
    let { tiding } = action
    switch (type) {
        case actionTypes.OPEN:
            if (!tiding) tiding = initialState.tiding
            return { ...state, tiding, open: true }
        case actionTypes.CLOSE:
            return { ...state, open: false }
        case actionTypes.BEGIN:
            return { ...state, submitting: true }
        case actionTypes.FAILURE:
            return { ...state, submitting: false, error: ERROR_STR }
        case actionTypes.SUCCESS:
            return { ...state, open: false, submitting: false }
        case actionTypes.EDIT:
            return { ...state, tiding: { ...state.tiding, [key]: value } }
        default:
            return state
    }
}
