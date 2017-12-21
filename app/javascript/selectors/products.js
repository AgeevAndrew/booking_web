import { createSelector } from 'reselect'
import { values } from 'lodash'
import { getProducts } from './entities'
import { getProductId } from './props'

export const getArrayProducts = createSelector(
  [getProducts],
  (products) => values(products)
)

export const getProduct = createSelector(
  [getProducts, getProductId],
  (products, productId) => products[productId]
)
