import { createSelector } from 'reselect'
import { values } from 'lodash'
import { getCompany } from './entities'

export const getArrayCompany = createSelector(
    [getCompany],
    (company) => values(company)[0]
)

