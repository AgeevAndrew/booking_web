import React from 'react'
import { updateProductActivity } from 'actions/productsActionCreators'
import { connect } from 'react-redux'

const SwitchActive = ({ product, dispatch }) => (
  <button
    onClick={ e => dispatch(updateProductActivity(product)) }
    className={product.active ? 'on' : 'off'}>
      { product.active ? 'On' : 'Off' }
  </button>
)

export default connect()(SwitchActive)
