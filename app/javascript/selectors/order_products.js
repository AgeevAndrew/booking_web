import { createSelector } from 'reselect'
import { values } from 'lodash'
import { getOrderProducts } from './entities'
import { getOrderProductId } from './props'

export const getArrayOrderProducts = createSelector(
  [getOrderProducts],
  (orderProducts) => values(orderProducts)
)

export const getOrderProduct = createSelector(
  [getOrderProducts, getOrderProductId],
  (orderProducts, orderProductId) => orderProducts[orderProductId]
)
