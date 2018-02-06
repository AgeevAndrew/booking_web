import React from 'react'
import { Segment, Header, Button, Label } from 'semantic-ui-react'
import { addressString } from 'shared/decorators/address'

class Order extends React.Component {
  openModal = () => {
    const { toggle, order } = this.props
    toggle(order)
  }
  colorLabel = () => {
    const { status } = this.props.order
    switch (status) {
      case 'Новый':
        return 'orange'
      case 'Отменен':
        return 'red'
      case 'Подтвержден':
        return 'green'
      default:
      return 'grey'
    }
  }
  render() {
    const { order } = this.props
    return (
      <Segment>
        <Label corner='right' size='massive' color={this.colorLabel()}></Label>
        <Header content={`Заказ №${order.num} на сумму ${order.totalCost}`}/>
        <p>{addressString(order.addressInfo, { hideCity: true })}</p>
        <p><a href={`tel:+74951234567`}>+74951234567</a></p>
        <Button onClick={this.openModal} content='Show'/>
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
