import { railsRequest } from './base'

const ProductsEndpoint = {
  visibilityChange: (id, params) => railsRequest({ uri: `/api/products/${id}/visibility_change`, method: 'POST', params }),
  updateData: (id, params) => railsRequest({ uri: `/api/products/${id}/update`, method: 'POST', params }),
  destroy: (id) => railsRequest({ uri: `/api/products/${id}`, method: 'DELETE' }),
  create: (params) => railsRequest({ uri: 'api/products', method: 'POST', params }),
}

export default ProductsEndpoint
