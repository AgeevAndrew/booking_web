import { createSelector } from 'reselect'
import values from 'lodash/values'
import { getOrders } from './entities'
import { getOrderId } from './props'

export const getArrayOrders = createSelector(
  [getOrders],
  (orders) => values(orders)
)

export const getOrder = createSelector(
  [getOrders, getOrderId],
  (orders, orderId) => orders[orderId]
)
