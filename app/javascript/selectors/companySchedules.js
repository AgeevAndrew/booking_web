import { createSelector } from 'reselect'
import { values } from 'lodash'
import { getSchedules } from './entities'

export const getArraySchedules = createSelector(
    [getSchedules],
    (schedules) => values(schedules)
)
