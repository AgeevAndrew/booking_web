import { createSelector } from 'reselect'
import values from 'lodash/values'
import { getCompany } from './entities'

export const getDataCompany = createSelector(
    [getCompany],
    (company) => values(company)[0]
)
