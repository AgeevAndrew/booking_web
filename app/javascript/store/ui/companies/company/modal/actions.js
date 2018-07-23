import * as actionTypes from './constants'
import * as entitiesActions from 'store/entities/actions'
import SchedulesEndpoint from 'shared/endpoints/SchedulesEndpoint'

export const toggle = (schedules) => ({
    type: actionTypes.OPEN,
    schedules,
})

export const close = () => ({
    type: actionTypes.CLOSE,
})

const begin = () => ({ type: actionTypes.BEGIN })
const failure = () => ({ type: actionTypes.FAILURE })
const success = () => ({ type: actionTypes.SUCCESS })

export const change = (schedules) => (dispatch) => {
    dispatch(begin())
    SchedulesEndpoint.change(schedules.companyId, { week_day: schedules.weekDay, time_start: schedules.time_start,
        time_end: schedules.time_end }).then((response) => {
        if (response.success) {
            dispatch(entitiesActions.upsertEntity('company', { ...response.json }))
            dispatch(success())
        } else {
            dispatch(failure())
        }
    })
}
