import { railsRequest } from './base'

const PushMessagesEndpoint = {
  send: (params) => railsRequest({ uri: '/api/push_messages', method: 'POST', params }),
}

export default PushMessagesEndpoint
