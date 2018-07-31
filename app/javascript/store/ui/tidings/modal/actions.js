import * as actionTypes from './constants'
import * as entitiesActions from 'store/entities/actions'
import TidingsEndpoint from 'shared/endpoints/tidings_endpoint'

export const toggle = (tidings) => ({
    type: actionTypes.OPEN,
    tidings,
})

export const close = () => ({
    type: actionTypes.CLOSE,
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

export const activate = (tiding) => (dispatch) => {
    dispatch(begin())
    TidingsEndpoint.activate(tiding.id)
        .then((response) => {
            if (response.success) {
                dispatch(entitiesActions.upsertEntity('tidings', { ...response.json }))
                dispatch(success())
            } else {
                dispatch(failure())
            }
        })
}

export const deactivate = (tiding) => (dispatch) => {
    dispatch(begin())
    TidingsEndpoint.deactivate(tiding.id)
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
