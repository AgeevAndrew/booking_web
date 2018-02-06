import { railsRequest } from './base'

const OrdersEndpoint = {
  accept: (id, params) => railsRequest({ uri: `/api/orders/${id}/accept`, method: 'POST', params }),
  cancel: (id, params) => railsRequest({ uri: `/api/orders/${id}/cancel`, method: 'POST', params }),
}

export default OrdersEndpoint
