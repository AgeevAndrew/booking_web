import { camelizeKeys } from 'humps'
import { normalize, schema } from 'normalizr'

const product = new schema.Entity('products')
const category = new schema.Entity('categories')
const error = new schema.Entity('errors')
const order = new schema.Entity('orders')
const orderProduct = new schema.Entity('orderProducts')

export const normalizeEntities = (storeProps) =>
  normalize(camelizeKeys(storeProps), {
    products: [product],
    categories: [category],
    orders: [order],
    errors: [error],
    orderProducts: [orderProduct],
})
