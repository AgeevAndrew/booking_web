import React from 'react'
import map from 'lodash/map'
import Product from './Product'
import Categories from './Categories'
import { Segment, Item, Grid, Confirm } from 'semantic-ui-react'

class ProductsList extends React.Component {
  render() {
    const { products, openConfirm, cancelConfirm, destroy } = this.props
    return (
      <Segment style={{ paddingLeft: '10%', paddingRight: '10%' }}>
        <Grid>
          <Grid.Column width={4}>
            <Categories/>
          </Grid.Column>
          <Grid.Column width={12}>
            <Item.Group>
                {map(products, (product) => <Product key={product.id} productId={product.id}/>)}
              </Item.Group>
          </Grid.Column>
        </Grid>
        <Confirm content='Вы действительно хотите удалить данный продукт?'
                 open={openConfirm}
                 cancelButton='Отмена'
                 confirmButton='Да, хочу'
                 onCancel={cancelConfirm}
                 onConfirm={destroy}/>
      </Segment>
    )
  }
}

import { connect } from 'react-redux'
import { bindActionCreators } from 'redux'
import { getArrayActiveProducts } from 'selectors/products'
import PropTypes from 'prop-types'

import { cancelConfirm, destroy } from 'store/ui/products/confirm/actions'

ProductsList.propTypes = {
  products: PropTypes.array.isRequired,
  openConfirm: PropTypes.bool.isRequired,
  cancelConfirm: PropTypes.func.isRequired,
  destroy: PropTypes.func.isRequired,
}

const mapStateToProps = (state, props) => {
  const { openConfirm } = state.ui.products.confirm
  return {
    products: getArrayActiveProducts(state, props),
    openConfirm,
  }
}

const mapDispatchToProps = (dispatch) => bindActionCreators({ destroy, cancelConfirm }, dispatch)

export default connect(mapStateToProps, mapDispatchToProps)(ProductsList)
