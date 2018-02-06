import React from 'react'
import { Card, Label, Grid } from 'semantic-ui-react'
import { currency } from 'shared/decorators/currency'

class Product extends React.Component {
  render() {
    const { orderProduct, product } = this.props
    console.log(orderProduct);
    console.log(product);
    return (
      <Card fluid>
        <Card.Content>
          <Card.Header>
            {orderProduct.productTitle}
          </Card.Header>
          <Card.Meta>
            {orderProduct.mainOption}
          </Card.Meta>
          <Card.Description>
            <Grid columns={3}>
              <Grid.Row>
                <Grid.Column>
                  &nbsp;
                </Grid.Column>
                <Grid.Column>
                  {orderProduct.qty}
                </Grid.Column>
                <Grid.Column floated='right'>
                  <Label size='massive' circular>{currency(orderProduct.totalCost)}</Label>
                </Grid.Column>
              </Grid.Row>
            </Grid>


          </Card.Description>
        </Card.Content>
      </Card>
    )
  }
}

import { connect } from 'react-redux'
import { bindActionCreators } from 'redux'
import { getProduct } from 'selectors/products'
import { getOrderProduct } from 'selectors/order_products'
import PropTypes from 'prop-types'

Product.propTypes = {
  orderProduct: PropTypes.object.isRequired,
  product: PropTypes.object.isRequired,
}

const mapStateToProps = (state, props) => ({
  orderProduct: getOrderProduct(state, props),
  product: getProduct(state, props),
})

const mapDispatchToProps = (dispatch) => bindActionCreators({}, dispatch)

export default connect(mapStateToProps, mapDispatchToProps)(Product)
