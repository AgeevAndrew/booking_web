import React from 'react'
import map from 'lodash/map'
import { Container } from 'semantic-ui-react'
import Order from './order'
import OrderModal from './modal'

class List extends React.Component {
  render() {
    const { orders } = this.props
    return (
      <Container text>
        {map(orders, (order) => <Order key={order.id} orderId={order.id}/>)}
        <OrderModal/>
      </Container>
    )
  }
}

import { connect } from 'react-redux'
import { getArrayOrders } from 'selectors/orders'
import PropTypes from 'prop-types'

List.propTypes = {
  orders: PropTypes.array,
}

const mapStateToProps = (state, props) => ({
  orders: getArrayOrders(state, props),
})

export default connect(mapStateToProps)(List)
