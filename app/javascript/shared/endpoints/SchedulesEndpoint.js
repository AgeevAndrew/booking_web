import { railsRequest } from './base'

const SchedulesEndpoint = {
    change: (id, params) => railsRequest({ uri: `/companies/${id}/delivery_time_change`, method: 'POST', params }),
}
export default SchedulesEndpoint
