import { PRODUCT_SWITCH_ACTIVE } from 'constants/productsConstants'
import ProductsEndpoint from 'shared/endpoints/ProductsEndpoint'

export const switchProductActive = (product) => ({
  type: PRODUCT_SWITCH_ACTIVE,
  product,
});

export const updateProductActivity = (product) => {
  return dispatch => {
    ProductsEndpoint.visibility_change(product.id, { active: !product.active })
      .then(response => {
        if (response.success) dispatch(switchProductActive(product))
      })
  }
}
