import { createSelector } from 'reselect'
import { values, filter } from 'lodash'
import { getProducts } from './entities'
import { getProductId } from './props'
import { getActiveCategoryId } from './ui'

export const getArrayProducts = createSelector(
  [getProducts],
  (products) => values(products)
)

export const getArrayActiveProducts = createSelector(
  getProducts,
  getActiveCategoryId,
  (products, activeCategoryId) =>
    activeCategoryId ? filter(products, { categoryId: activeCategoryId }) : values(products)
)

export const getProduct = createSelector(
  [getProducts, getProductId],
  (products, productId) => products[productId]
)
