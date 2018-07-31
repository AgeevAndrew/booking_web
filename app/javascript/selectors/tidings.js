import { createSelector } from 'reselect'
import values from 'lodash/values'
import { getTidings } from './entities'
import { getTidingId } from './props'

export const getArrayTidings = createSelector(
    [getTidings],
    (tidings) => values(tidings)
)

export const getTiding = createSelector(
    [getTidings, getTidingId],
    (tidings, tidingId) => tidings[tidingId]
)
