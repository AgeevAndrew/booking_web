import * as actionTypes from './constants'
import * as entitiesActions from 'store/entities/actions'
import TidingsEndpoint from 'shared/endpoints/tidings_endpoint'

export const toggle = (tiding, user) => ({
    type: actionTypes.OPEN,
    tiding,
    user,
})

export const close = () => ({
    type: actionTypes.CLOSE,
})

export const edit = (key, value) => ({
    type: actionTypes.EDIT,
    key, value,
})

const begin = () => ({ type: actionTypes.BEGIN })
const failure = () => ({ type: actionTypes.FAILURE })
const success = () => ({ type: actionTypes.SUCCESS })

export const update = (tiding) => (dispatch) => {
    dispatch(begin())
    TidingsEndpoint.update(tiding.id, tiding)
        .then((response) => {
            if (response.success) {
                dispatch(entitiesActions.upsertEntity('tidings', { ...response.json }))
                dispatch(success())
            } else {
                dispatch(failure())
            }
        })
}

export const create = (tiding) => (dispatch) => {
    dispatch(begin())
    TidingsEndpoint.create(tiding)
        .then((response) => {
            if (response.success) {
                dispatch(entitiesActions.upsertEntity('tidings', { ...response.json }))
                dispatch(success())
            } else {
                dispatch(failure())
            }
        })
}
