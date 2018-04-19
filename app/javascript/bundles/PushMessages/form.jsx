import React from 'react'
import { Modal, Button, Form, Loader } from 'semantic-ui-react'

class PushForm extends React.Component {

  validate = () => {
    const { title, body } = this.props.form
    if (title == '' || body == '') {
      alert('Не заполнены поля')
      return false
    }
    return true
  }

  handleChange = (e, { name, value }) => this.props.change(name, value)

  handleOpen = () => this.props.change('open', true)

  handleSubmit = () => {
    const { title, body } = this.props.form
    if (this.validate()) {
      this.props.sendPushMessage({
        title,
        body,
      })
    }
  }

  handleCancel = () => this.props.close()

  render() {
    const { open, sending } = this.props.form
    return (
      <Modal dimmer={false}
             trigger={<Button color='blue'>Новое сообщение</Button>}
             onOpen={this.handleOpen}
             open={open}>
        <Loader active={sending}/>
        <Modal.Header>
          Отправить Пуш-сообщение
        </Modal.Header>
        <Modal.Content>
          <Form>
            <Form.Input required label='Заголовок' name='title' onChange={this.handleChange}/>
            <Form.TextArea required label='Текст' name='body' onChange={this.handleChange}/>
          </Form>
        </Modal.Content>
        <Modal.Actions>
            <Button color='red'onClick={this.handleCancel}>Отменить</Button>
            <Button color='green' type='submit' onClick={this.handleSubmit}>Отправить</Button>
        </Modal.Actions>
      </Modal>
    )
  }
}

import { connect } from 'react-redux'
import { bindActionCreators } from 'redux'
import { change, sendPushMessage, close } from 'store/ui/push_messages/form/actions'
import PropTypes from 'prop-types'

PushForm.propTypes = {
  form: PropTypes.object.isRequired,
  change: PropTypes.func.isRequired,
  sendPushMessage: PropTypes.func.isRequired,
  close: PropTypes.func.isRequired,
}

const mapStateToProps = (state) => (
  {
    form: state.ui.pushMessages.form,
  }
)

const mapDispatchToProps = (dispatch) => bindActionCreators({ change, sendPushMessage, close }, dispatch)

export default connect(mapStateToProps, mapDispatchToProps)(PushForm)
