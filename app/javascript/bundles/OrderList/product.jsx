import React from 'react'
import { Card, List, Statistic } from 'semantic-ui-react'
import map from 'lodash/map'
import { currency } from 'shared/decorators/currency'

class Product extends React.Component {
  render() {
    const { orderProduct } = this.props
    return (
      <Card fluid color='grey'>
        <Card.Content>
          <Card.Header>
            {orderProduct.qty}&nbsp;x&nbsp;{orderProduct.productTitle}
            <Statistic floated='right' size='mini'>
              <Statistic.Value><strong>{currency(orderProduct.totalCost)}</strong></Statistic.Value>
            </Statistic>
          </Card.Header>
          <Card.Meta>
            {orderProduct.mainOption}
          </Card.Meta>
          <Card.Description>
            <List divided verticalAlign='middle'>
              {map(orderProduct.ingredients, (ingredient, index) =>
                <List.Item key={index}>
                  <List.Content floated='right' content={currency(ingredient.totalCost)}/>
                  <List.Content content={ingredient.name}/>
                </List.Item>
              )}
            </List>
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
