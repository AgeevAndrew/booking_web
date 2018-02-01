import React from 'react'
import { Segment, Header, Button } from 'semantic-ui-react'
import { addressString } from 'shared/decorators/address'

class Order extends React.Component {
  openModal = () => {
    const { order } = this.props
    toggle(order)
  }
  address = () => {
    const { addressInfo } = this.props.order
    addressString(addressInfo, { hideCity: true })
  }
  render() {
    const { order } = this.props
    return (
      <Segment>
        <Header content={`Заказ №${order.num} на сумму ${order.totalCost}`}/>
        <span>{addressString(order.addressInfo, { hideCity: true })}</span>
        <Button onClick={this.openModal} content="Show"/>
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
}

const mapStateToProps = (state, props) => ({
  order: getOrder(state, props),
})

const mapDispatchToProps = (dispatch) => bindActionCreators({ toggle }, dispatch)

export default connect(mapStateToProps, mapDispatchToProps)(Order)
