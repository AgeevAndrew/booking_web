import React from 'react'
import { Card, Dimmer, Loader, Image } from 'semantic-ui-react'
import ProductShowForm from './ProductShowForm'
import ProductEditForm from './ProductEditForm'

const Product = ({ product, row }) => {
  const CardContent = product.id === row.id ? ProductEditForm : ProductShowForm

  return (
    <Card fluid>
      <Dimmer active={row.isSendFrom && product.id === row.id} inverted>
        <Loader/>
      </Dimmer>
      <Image size='huge' centered src={product.photo}/>
      <CardContent productId={product.id}/>
    </Card>
  )
}

import { connect } from 'react-redux'
import { getProduct } from 'selectors/products'
import PropTypes from 'prop-types'

Product.propTypes = {
  product: PropTypes.object.isRequired,
  row: PropTypes.object.isRequired,
}

const mapStateToProps = (state, props) => (
  {
    product: getProduct(state, props),
    row: state.ui.products.row,
  }
)

export default connect(mapStateToProps)(Product)
