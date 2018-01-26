import * as actionTypes from './constants'
import * as entitiesActions from 'store/entities/actions'
import ProductsEndpoint from 'shared/endpoints/ProductsEndpoint'

export const init = (form) => ({ type: actionTypes.INIT_FORM, form })
export const cancel = () => ({ type: actionTypes.CANCEL_FORM })
export const change = (key, value) => ({ type: actionTypes.CHANGE_FORM, key, value })
export const setSend = () => ({ type: actionTypes.SEND_FORM })
export const setFinish = () => ({ type: actionTypes.SEND_FINISH })

export const update = (productForm) => (dispatch) => {
  dispatch(setSend())
  ProductsEndpoint.updateData(productForm.id, { ...productForm })
    .then((response) => {
      if (response.success)
        dispatch(entitiesActions.upsertEntity('products', { ...response.json }))
      dispatch(setFinish())
    })
}
