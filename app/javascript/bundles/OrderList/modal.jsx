import React from 'react'
import { Button, Header, Modal } from 'semantic-ui-react'


class ModalOrder extends React.Component {
  render() {
    const { order, open } = this.props
    return (
      <Modal open={open} closeIcon>
        <Modal.Header>{`Заказ №${order.num}`}</Modal.Header>
        <Modal.Content>
          <Modal.Description>
            <Header>Default Profile Image</Header>
            <p>We've found the following gravatar image associated with your e-mail address.</p>
            <p>Is it okay to use this photo?</p>
          </Modal.Description>
        </Modal.Content>
      </Modal>
    )
  }
}

import { connect } from 'react-redux'
import { getOrder } from 'selectors/orders'
import PropTypes from 'prop-types'

ModalOrder.propTypes = {
  order: PropTypes.object.isRequired,
  open: PropTypes.bool.isRequired,
}

ModalOrder.defaultProps = {
  open: false,
}

const mapStateToProps = (state, props) => {
  const { modal } = state.ui.orders
  return {
    order: modal.order,
    open: modal.open,
  }
}

export default connect(mapStateToProps)(ModalOrder)
