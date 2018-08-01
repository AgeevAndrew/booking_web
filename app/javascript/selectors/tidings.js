import { createSelector } from 'reselect'
import values from 'lodash/values'
import { getTidings, getCurrentUsers } from './entities'
import { getTidingId } from './props'


export const getArrayTidings = createSelector(
    [getTidings],
    (tidings) => values(tidings)
)

export const getTiding = createSelector(
    [getTidings, getTidingId],
    (tidings, tidingId) => tidings[tidingId]
)

export const getUsers = createSelector(
    [getCurrentUsers],
    (users) => values(users)[0]
)
