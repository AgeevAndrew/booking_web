import { camelizeKeys } from 'humps'
import { normalize, schema } from 'normalizr'

const product = new schema.Entity('products')

export const normalizeEntities = (storeProps) =>
  normalize(camelizeKeys(storeProps), {
    products: [product],
})
