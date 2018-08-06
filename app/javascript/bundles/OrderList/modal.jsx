import React from 'react'
import { Header, Modal, Button, Icon, Label } from 'semantic-ui-react'
import { addressString } from 'shared/decorators/address'
import map from 'lodash/map'
import Product from './product'
import { currency } from 'shared/decorators/currency'
import { statusColor } from 'shared/decorators/order_status'
import { dateTimeFormat } from 'shared/decorators/date_time'

class ModalOrder extends React.Component {
  handleClose = () => {
    this.props.close()
  }

  handleConfirm = () => {
    const { order, accept } = this.props
    accept(order)
  }

  handleDecline = () => {
    const { order, cancel } = this.props
    cancel(order)
  }

  renderActions = () => {
    const { submitting } = this.props
    return (
      <Button.Group>
        <Button color='red' disabled={submitting} onClick={this.handleDecline}>
          <Icon name='remove'/>Отменить
        </Button>
        <Button.Or/>
        <Button color='green' disabled={submitting} onClick={this.handleConfirm}>
          <Icon name='checkmark'/>Подтвердить
        </Button>
      </Button.Group>
    )
  }

  renderPickup = () => {
    const { discount, deliveryTime } = this.props.order
    return (
      <div>
        <p>Скидка за самовывоз: {currency(discount)}</p>
        <p>Время самовывоза: { deliveryTime ? dateTimeFormat(deliveryTime) : 'На ближайшее время' }</p>
      </div>
    )
  }

  renderDeliveryInfo = () => {
    const { addressInfo, deliveryCost, deliveryTime } = this.props.order
    return (
      <div>
        <p>Стоимость доставки: {currency(deliveryCost)}</p>
        <p>Адрес доставки: {addressInfo && addressString(addressInfo, { hideCity: false })}</p>
        <p>Время доставки: { deliveryTime ? dateTimeFormat(deliveryTime) : 'На ближайшее время' }</p>
      </div>
    )
  }

  render() {
    const { order, open, account } = this.props
    return (
      <Modal open={open} closeIcon onClose={this.handleClose}>
        <Modal.Header>
          {`Заказ №${order.num}`}
          <Label tag color={statusColor(order.status)} attached='top right' content={order.status}/>
        </Modal.Header>
        <Modal.Content>
          <Modal.Description>
            <Header>Детали заказа</Header>
            {map(order.orderProducts, (product) =>
              <Product key={product.id} orderProductId={product.id} productId={product.productId}/>)}
          </Modal.Description>
        </Modal.Content>
        <Modal.Actions>
          <div>
          <p><strong>Итого к оплате: {currency(order.totalCost || 0)}</strong></p>
          {order.pickup ? this.renderPickup() : this.renderDeliveryInfo()}
          {account &&
            <p>Клиент: {account.name}, тел. <a href={`tel:${account.phone}`}>{account.phone}</a></p>}
          </div>
          {order.status === 'Новый' ? this.renderActions() : ''}
        </Modal.Actions>
      </Modal>
    )
  }
}

import { connect } from 'react-redux'
import { bindActionCreators } from 'redux'
import PropTypes from 'prop-types'

import { getAccount } from 'selectors/accounts'
import { close, accept, cancel } from 'store/ui/orders/modal/actions'

ModalOrder.propTypes = {
  order: PropTypes.object.isRequired,
  account: PropTypes.object,
  open: PropTypes.bool.isRequired,
  submitting: PropTypes.bool.isRequired,
  close: PropTypes.func.isRequired,
  accept: PropTypes.func.isRequired,
  cancel: PropTypes.func.isRequired,
}

ModalOrder.defaultProps = {
  open: false,
}

const mapStateToProps = (state, props) => {
  const { modal } = state.ui.orders
  return {
    account: getAccount(state, props),
    order: modal.order,
    open: modal.open,
    submitting: modal.submitting,
  }
}

const mapDispatchToProps = (dispatch) => bindActionCreators({ close, accept, cancel }, dispatch)

export default connect(mapStateToProps, mapDispatchToProps)(ModalOrder)
