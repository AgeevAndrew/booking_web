import * as actionTypes from './constants'
import { upsertEntity } from '../../../entities/actions'
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
export const edit = (key, value) => ({ type: actionTypes.EDIT, key, value })
export const change = (schedules) => (dispatch) => {
    dispatch(begin())
    const params = { week_day: schedules.weekDay, time_start: schedules.timeStart, time_end: schedules.timeEnd }
    SchedulesEndpoint.change(schedules.companyId, params).then((response) => {
        if (response.success) {
            dispatch(upsertEntity('companySchedules', { ...schedules }))
            dispatch(success())
        } else {
            dispatch(failure())
        }
    })
}
