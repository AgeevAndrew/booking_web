import { railsRequest } from './base'

const ProductsEndpoint = {
  visibilityChange: (id, params) => railsRequest({ uri: `/api/products/${id}/visibility_change`, method: 'POST', params }),
  updateData: (id, params) => railsRequest({ uri: `/api/products/${id}/update`, method: 'POST', params }),
}

export default ProductsEndpoint
