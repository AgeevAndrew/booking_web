import React from 'react'
import SwitchActive from './SwitchActive'

const Product = ({ product, dispatch }) => (
  <tr>
    <td>{product.id}</td>
    <td>{product.title}</td>
    <td>{product.brief}</td>
    <td>{product.description}</td>
    <td>{product.photo}</td>
    <td>
      <SwitchActive product={product}  />
    </td>
  </tr>
)

export default Product
