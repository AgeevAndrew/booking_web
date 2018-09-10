import { createSelector } from 'reselect'
import values from 'lodash/values'
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

export const getCategoriesSelector = createSelector(
  [getCategories],
  (categories) => values(categories).map((x) => ({ key: x.id, text: x.name, value: x.id }))
)
