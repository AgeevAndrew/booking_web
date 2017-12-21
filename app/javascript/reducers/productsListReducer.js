import { PRODUCT_SWITCH_ACTIVE } from 'constants/productsConstants'

const products = (productsList = [], action) => {
  switch (action.type) {
    case PRODUCT_SWITCH_ACTIVE:
      const { id, active } = action.product
      return { ...productsList, [id]: { ...productsList[id], active: !active } }
    default:
      return productsList
  }
};


export default products;
