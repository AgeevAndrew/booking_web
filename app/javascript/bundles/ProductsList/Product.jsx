import React from 'react'
import { Item, Dimmer, Loader, Segment } from 'semantic-ui-react'
import ProductShowForm from './ProductShowForm'
import ProductEditForm from './ProductEditForm'

const Product = ({ product, row }) => {
  const ItemContent = product.id === row.id ? ProductEditForm : ProductShowForm

  return (
      <Item as={Segment}>
        <Dimmer active={row.isSendFrom && product.id === row.id} inverted>
          <Loader/>
        </Dimmer>

        <Item.Image size='large' src={product.photo}/>
        <ItemContent productId={product.id}/>
      </Item>

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
