import { createSelector } from 'reselect'
import values from 'lodash/values'
import { getSchedules } from './entities'

export const getArraySchedules = createSelector(
    [getSchedules],
    (schedules) => values(schedules)
)
