import * as actionTypes from './constants'
import { removeEntity } from 'store/entities/actions'
import ProductsEndpoint from 'shared/endpoints/ProductsEndpoint'

export const cancelConfirm = () => ({ type: actionTypes.CANCEL_CONFIRM })

export const setConfirm = (id) => ({ type: actionTypes.SET_CONFIRM, id })

export const destroy = () => (dispatch, getState) => {
  const { productId } = getState().ui.products.confirm

  ProductsEndpoint.destroy(productId)
    .then((response) => {
      if (response.success) {
        dispatch(removeEntity('products', productId))
        dispatch(cancelConfirm())
      }
    })
}
