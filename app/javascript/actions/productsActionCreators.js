import { PRODUCT_EDIT, PRODUCT_SWITCH_ACTIVE } from 'constants/productsConstants'
import fetch from 'cross-fetch'

export const editProduct = (productId) => ({
  type: PRODUCT_EDIT,
  productId,
  isEdit: true,
});

export const editProductFinish = (productId) => ({
  type: PRODUCT_EDIT,
  productId,
  isEdit: false,
});

export const switchProductActive = (productId) => ({
  type: PRODUCT_SWITCH_ACTIVE,
  productId,
});

export const updateProductActivity = (product) => {
  return dispatch => {
    return fetch(
      `http://localhost:3000/api/products/${product.id}/visibility_change`,
      {
        method: 'PATCH',
        headers: { 'content-type': 'application/json', 'accept': 'application/json' },
        body: JSON.stringify({ active: product.active }),
        credentials: 'same-origin',
      }
    ).then(
      response => {
        if (response.status == 204) dispatch(editProductFinish(product.id))
      },
      error => alert(error)
    )
  }
}
