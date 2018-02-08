import React from 'react'
import { Segment, Header, Label } from 'semantic-ui-react'
import { currency } from 'shared/decorators/currency'
import { statusColor } from 'shared/decorators/order_status'

class Order extends React.Component {
  openModal = () => {
    const { toggle, order } = this.props
    toggle(order)
  }

  render() {
    const { order } = this.props
    return (
      <Segment onClick={this.openModal}>
        <Header>
          {`Заказ №${order.num} на сумму ${currency(order.totalCost)}`}
        </Header>
        <Label corner='right' size='large' color={statusColor(order.status)}></Label>
      </Segment>
    )
  }
}

import { connect } from 'react-redux'
import { bindActionCreators } from 'redux'
import { getOrder } from 'selectors/orders'
import { toggle } from 'store/ui/orders/modal/actions'
import PropTypes from 'prop-types'

Order.propTypes = {
  order: PropTypes.object.isRequired,
  toggle: PropTypes.func.isRequired,
}

const mapStateToProps = (state, props) => ({
  order: getOrder(state, props),
})

const mapDispatchToProps = (dispatch) => bindActionCreators({ toggle }, dispatch)

export default connect(mapStateToProps, mapDispatchToProps)(Order)
