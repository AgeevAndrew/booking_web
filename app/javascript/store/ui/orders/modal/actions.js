import * as actionTypes from './constants'
import * as entitiesActions from 'store/entities/actions'
import OrdersEndpoint from 'shared/endpoints/orders_endpoint'

export const toggle = (order) => ({
  type: actionTypes.OPEN,
  order,
})

export const close = () => ({
  type: actionTypes.CLOSE,
})

const begin = () => ({ type: actionTypes.BEGIN })
// const error = (errors) => ({ type: actionTypes.ERROR, errors })
const failure = () => ({ type: actionTypes.FAILURE })
const success = () => ({ type: actionTypes.SUCCESS })

export const accept = (order) => (dispatch) => {
  dispatch(begin())
  OrdersEndpoint.accept(order.id, {})
    .then((response) => {
      if (response.success) {
        dispatch(entitiesActions.upsertEntity('orders', { ...response.json }))
        dispatch(success())
      } else {
        dispatch(failure())
      }
    })
}

export const cancel = (order) => (dispatch) => {
  dispatch(begin())
  OrdersEndpoint.cancel(order.id, {})
    .then((response) => {
      if (response.success) {
        dispatch(entitiesActions.upsertEntity('orders', { ...response.json }))
        dispatch(success())
      } else {
        dispatch(failure())
      }
    })
}
