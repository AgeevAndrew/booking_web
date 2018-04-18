import React from 'react'
import { Modal, Header, Icon } from 'semantic-ui-react'

class PushMessageModal extends React.Component {
  handleClose = () => {
    const { close } = this.props
    close()
  }
  render() {
    const { pushMessage, open } = this.props
    return (
      <Modal open={open} closeIcon onClose={this.handleClose}>
        <Modal.Header>Информация о сообщении</Modal.Header>
        <Modal.Content scrolling>
          <Modal.Description>
            <Header>{pushMessage.title}</Header>
            <p>{pushMessage.body}</p>
            <p><Icon circular inverted name='user outline' color='green'/> Доставлено: {pushMessage.success}</p>
            <p><Icon circular inverted name='user outline' color='red'/> Не доставлено: {pushMessage.failure}</p>
          </Modal.Description>
        </Modal.Content>
      </Modal>
    )
  }
}


import { connect } from 'react-redux'
import { bindActionCreators } from 'redux'
import PropTypes from 'prop-types'

import { close } from 'store/ui/push_messages/modal/actions'

PushMessageModal.propTypes = {
  pushMessage: PropTypes.object.isRequired,
  open: PropTypes.bool.isRequired,
  close: PropTypes.func.isRequired,
}

PushMessageModal.defaultProps = {
  open: false,
}

const mapStateToProps = (state) => {
  const { modal } = state.ui.pushMessages
  return {
    pushMessage: modal.pushMessage,
    open: modal.open,
  }
}

const mapDispatchToProps = (dispatch) => bindActionCreators({ close }, dispatch)

export default connect(mapStateToProps, mapDispatchToProps)(PushMessageModal)
