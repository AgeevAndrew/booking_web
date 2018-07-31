import { railsRequest } from './base'

const TidingsEndpoint = {
    create: (params) => railsRequest({ uri: `tidings`, method: 'POST', params}),
    update: (id, params) => railsRequest({ uri: `tidings/${id}`, method: 'POST', params }),
    delete: (id) => railsRequest({ uri: `tidings/${id}`, method: 'DELETE'}),
    activate: (id) => railsRequest({ uri: `tidings/${id}`, method: 'POST'}),
    deactivate: (id) => railsRequest({ uri: `tidings/${id}`, method: 'POST'}),
}

export default TidingsEndpoint
