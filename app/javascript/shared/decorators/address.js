import trim from 'lodash/trim'
import compact from 'lodash/compact'

export const addressString = (address, options) => {
  const { city, street, house, office, code, floor, entrance } = address
  const addressArray = [
    options && options.hideCity ? null : trim(city),
    trim(street),
    compact([trim(house), trim(office)]).join('-'),
    entrance && ['подъезд', trim(entrance)].join(' '),
    floor && ['этаж', trim(floor)].join(' '),
    code && ['домофон', trim(code)].join(' '),
  ]

  return compact(addressArray).join(', ')
}
