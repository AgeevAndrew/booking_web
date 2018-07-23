import { railsRequest } from './base'

const SchedulesEndpoint = {
    change: (id, params) => railsRequest({ uri: `/api/companies/${id}/delivery_time_change`, method: 'POST', params }),
}
export default SchedulesEndpoint
