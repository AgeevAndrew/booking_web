import { createSelector } from 'reselect'
import { values } from 'lodash'
import { getErrors } from './entities'
import { getShowErrors } from './ui'

export const getArrayErrors = createSelector(
  getErrors, getShowErrors,
  (errors, showErrors) => showErrors ? values(errors) : []
)
