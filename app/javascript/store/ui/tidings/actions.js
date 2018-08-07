import * as actionTypes from './constants'
import * as entitiesActions from 'store/entities/actions'
import TidingsEndpoint from 'shared/endpoints/tidings_endpoint'

export const accordionToggle = (activeIndex) => ({
    type: actionTypes.OPEN,
    activeIndex,
})
const begin = () => ({ type: actionTypes.BEGIN })
const failure = () => ({ type: actionTypes.FAILURE })
const success = () => ({ type: actionTypes.SUCCESS })

export const activate = (index) => (dispatch) => {
    dispatch(begin())
    TidingsEndpoint.activate(index)
        .then((response) => {
            if (response.success) {
                dispatch(entitiesActions.upsertEntity('tidings', { ...response.json }))
                dispatch(success())
            } else {
                dispatch(failure())
            }
        })
}

export const deactivate = (index) => (dispatch) => {
    dispatch(begin())
    TidingsEndpoint.deactivate(index)
        .then((response) => {
            if (response.success) {
                dispatch(entitiesActions.upsertEntity('tidings', { ...response.json }))
                dispatch(success())
            } else {
                dispatch(failure())
            }
        })
}

export const remove = (index) => (dispatch) => {
    dispatch(begin())
    TidingsEndpoint.delete(index)
        .then((response) => {
            if (response.success) {
                dispatch(entitiesActions.removeEntity('tidings', index))
                dispatch(success())
            } else {
                dispatch(failure())
            }
        })
}
