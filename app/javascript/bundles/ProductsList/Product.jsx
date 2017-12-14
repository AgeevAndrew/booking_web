import React from 'react'

const Product = (props) => (
  <tr>
    <td>{props.id}</td>
    <td>{props.title}</td>
    <td>{props.brief}</td>
    <td>{props.description}</td>
    <td>{props.photo}</td>
  </tr>
)

export default Product
