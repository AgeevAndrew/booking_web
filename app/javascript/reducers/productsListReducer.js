import { PRODUCT_EDIT, PRODUCT_SWITCH_ACTIVE } from 'constants/productsConstants'

const products = (productsList = [], action) => {
  switch (action.type) {
    case PRODUCT_SWITCH_ACTIVE:
      return productsList.map(product => {
        return product.id === action.productId ? Object.assign({}, product, { active: !product.active }) : product
      })
    default:
      return productsList
  }
};


export default products;
