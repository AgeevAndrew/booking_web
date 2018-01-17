import * as actionTypes from './constants'
import * as entitiesActions from 'store/entities/actions'
import ProductsEndpoint from 'shared/endpoints/ProductsEndpoint'

export const setSend = (productId) => ({
  type: actionTypes.SET_SEND,
  productId,
})

export const setFinish = (productId) => ({
  type: actionTypes.SET_FINISH,
  productId,
})

export const updateActivity = (product) => (dispatch) => {
  dispatch(setSend(product.id))
  dispatch(entitiesActions.upsertEntity('products', { ...product, loading: true }))
  ProductsEndpoint.visibilityChange(product.id, { active: !product.active })
    .then((response) => {
      dispatch(setFinish(product.id))
      if (response.success) dispatch(entitiesActions.upsertEntity('products', { ...response.json }))
    })
}
