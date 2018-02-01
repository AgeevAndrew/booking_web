import { camelizeKeys } from 'humps'
import { normalize, schema } from 'normalizr'

const product = new schema.Entity('products')
const category = new schema.Entity('categories')
const error = new schema.Entity('errors')

export const normalizeEntities = (storeProps) =>
  normalize(camelizeKeys(storeProps), {
    products: [product],
    categories: [category],
    errors: [error],
})
