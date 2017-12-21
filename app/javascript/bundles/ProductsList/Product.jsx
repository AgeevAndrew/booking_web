import React from 'react'
import { updateProductActivity } from 'actions/productsActionCreators'
import { connect } from 'react-redux'
import { getProduct } from 'selectors/products'

const Product = ({ product, dispatch }) => (
  <tr>
    <td>{product.id}</td>
    <td>{product.title}</td>
    <td>{product.brief}</td>
    <td>{product.description}</td>
    <td>{product.photo}</td>
    <td>
      <button
        onClick={ e => dispatch(updateProductActivity(product)) }
        className={product.active ? 'on' : 'off'}>
          { product.active ? 'On' : 'Off' }
      </button>
    </td>
  </tr>
)

const mapStateToProps = (state, ownProps) => (
  {
    product: getProduct(state, ownProps)
  }
)

export default connect(mapStateToProps, null)(Product)
