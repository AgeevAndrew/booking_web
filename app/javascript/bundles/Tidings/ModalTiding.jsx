import React, { Component } from 'react'
import { Modal, Form, Message, Icon, TextArea, Button, Dropdown } from 'semantic-ui-react'

class ModalTiding extends Component {
    handleClose = () => {
        this.props.close()
    }
    handleConfirm = () => {
        const { update, create, tiding } = this.props
        tiding.id ? update(tiding) : create(tiding)
    }
    handleChange = (e, { name, value }) => this.props.edit(name, value)
    getErrorMessage = (text) => {
        return (
            <Message warning>
                <Icon name='warning' />
                { text }
            </Message>
        )
    }
    getButtonBlock = () => {
            return (
                <Button.Group>
                    <Button color='red'
                            onClick={this.handleClose}
                    >Отмена</Button>
                    <Button.Or/>
                    <Button color='blue'
                            onClick={this.handleConfirm}
                    >Сохранить</Button>
                </Button.Group>
            )
    }
    categories = [
        { key: 1, text: 'Акции', value: 'promotions' },
        { key: 2, text: 'Уведомления', value: 'notifications' },
        { key: 3, text: 'Мероприятия', value: 'events' },
    ]
    render() {
        const { tiding, open, error } = this.props
        return (
                <Modal open={open} closeIcon onClose={this.handleClose}>
                    <Modal.Header>
                        {tiding.title}
                    </Modal.Header>
                    <Modal.Content>
                        { error && this.getErrorMessage(error) }
                        <Form>
                            <Form.Field>
                            <Form.Input fluid label='Заголовок'
                                        name='title'
                                        defaultValue={tiding.title}
                                        onChange={this.handleChange}
                                        placeholder='Заголовок'/>
                            </Form.Field>
                            <Form.Field>
                                <label>Категория</label>
                                <Dropdown fluid selection
                                          options={ this.categories }
                                          name='category'
                                          onChange={ this.handleChange }
                                          defaultValue={ tiding.category }
                                />
                            </Form.Field>
                            <Form.Field>
                                <label>Текст новости</label>
                            <TextArea autoHeight
                                      rows={3}
                                      name='body'
                                      onChange={this.handleChange}
                                      defaultValue={tiding.body}
                            />
                            </Form.Field>
                            <Form.Field>
                                <label>Текст push-сообщения</label>
                            <TextArea autoHeight
                                      rows={3}
                                      name='message'
                                      onChange={this.handleChange}
                                      defaultValue={tiding.message}
                            />
                            </Form.Field>
                            { this.getButtonBlock() }
                        </Form>
                    </Modal.Content>
                </Modal>
                )
    }
}

import { connect } from 'react-redux'
import { bindActionCreators } from 'redux'
import PropTypes from 'prop-types'
import { close, update, edit, create } from 'store/ui/tidings/modal/actions'

ModalTiding.propTypes = {
    tiding: PropTypes.object.isRequired,
    open: PropTypes.bool.isRequired,
    submitting: PropTypes.bool.isRequired,
    error: PropTypes.string.isRequired,
    close: PropTypes.func.isRequired,
    update: PropTypes.func.isRequired,
    edit: PropTypes.func.isRequired,
    create: PropTypes.func.isRequired,
}

const mapStateToProps = (state, props) => {
    const { modal } = state.ui.tidings
    return {
        tiding: modal.tiding,
        open: modal.open,
        submitting: modal.submitting,
        error: modal.error,
    }
}

const mapDispatchToProps = (dispatch) => bindActionCreators({ close, update, edit, create }, dispatch)

export default connect(mapStateToProps, mapDispatchToProps)(ModalTiding)
