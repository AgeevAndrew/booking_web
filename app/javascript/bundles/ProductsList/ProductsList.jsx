import React from 'react'
import map from 'lodash/map'
import Product from './Product'
import Categories from './Categories'
import { Segment, Item, Grid } from 'semantic-ui-react'

class ProductsList extends React.Component {
  render() {
    const { products } = this.props
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
      </Segment>
    )
  }
}

import { connect } from 'react-redux'
import { getArrayActiveProducts } from 'selectors/products'
import PropTypes from 'prop-types'

ProductsList.propTypes = {
  products: PropTypes.array.isRequired,
}

const mapStateToProps = (state, props) => ({
  products: getArrayActiveProducts(state, props),
})

export default connect(mapStateToProps)(ProductsList)
