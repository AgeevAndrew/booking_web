import { railsRequest } from './base'

const ProductsEndpoint = {
  visibility_change: (id, params) => railsRequest({ uri: `/api/products/${id}/visibility_change`, method: 'PATCH', params }),
}

export default ProductsEndpoint
