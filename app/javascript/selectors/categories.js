import { createSelector } from 'reselect'
import { values } from 'lodash'
import { getCategories } from './entities'
import { getCategoryId } from './props'

export const getArrayCategories = createSelector(
  [getCategories],
  (categories) => values(categories)
)

export const getCategory = createSelector(
  [getCategories, getCategoryId],
  (categories, categoryId) => categories[categoryId]
)
