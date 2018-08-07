import { createSelector } from 'reselect'
import { getCurrentUsers } from './entities'
import values from 'lodash/values'

export const getUser = createSelector(
    [getCurrentUsers],
    (users) => values(users)[0]
)
