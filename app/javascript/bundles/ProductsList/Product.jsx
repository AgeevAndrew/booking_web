import React from 'react'
import { editProduct, switchProductActive, updateProductActivity } from 'actions/productsActionCreators'

const Product = ({ product, dispatch }) => (
  <tr>
    <td>{product.id}</td>
    <td>{product.title}</td>
    <td>{product.brief}</td>
    <td>{product.description}</td>
    <td>{product.photo}</td>
    <td>
      { product.isEdit ? <button onClick={ e => dispatch(switchProductActive(product.id)) } className={product.active ? 'on' : 'off'} >{ product.active ? 'On' : 'Off' }</button> : product.active.toString() }
    </td>
    <td>
      { product.isEdit ? <button onClick={ e => dispatch(updateProductActivity(product))} >save</button> : <button onClick={ e => dispatch(editProduct(product.id)) }>edit</button> }
    </td>
  </tr>
)

import { connect } from 'react-redux';

export default connect()(Product);
