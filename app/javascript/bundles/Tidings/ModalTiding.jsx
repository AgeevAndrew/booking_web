import React, { Component } from 'react'
import { Modal, Form, Message, Icon } from 'semantic-ui-react'

export class ModalTiding extends Component {
    handleClose = () => {
        this.props.close()
    }
    getErrorMessage = (text) => {
        return (
            <Message warning>
                <Icon name='warning' />
                { text }
            </Message>
        )
    }
    render() {
        const { tiding, open, error } = this.props
        return (
                <Modal open={open} closeIcon onClose={this.handleClose}>
                    <Modal.Header>
                        {tiding.title}
                    </Modal.Header>
                    <Modal.Content>
                        {error && this.getErrorMessage(error)}
                        <Form>
                            <Form.Group width='equal'>
                                <p>tiding.body</p>
                                <p>tiding.message</p>
                            </Form.Group>
                        </Form>
                    </Modal.Content>
                </Modal>
                )
    }
}

import { connect } from 'react-redux'
import { bindActionCreators } from 'redux'
import PropTypes from 'prop-types'
import { close, update } from 'store/ui/tidings/modal/actions'
import { getTiding } from '../../selectors/tidings'

ModalTiding.propTypes = {
    tiding: PropTypes.object.isRequired,
    open: PropTypes.bool.isRequired,
    submitting: PropTypes.bool.isRequired,
    close: PropTypes.func.isRequired,
    update: PropTypes.func.isRequired,
}

const mapStateToProps = (state, props) => {
    const { tiding } = state.ui.tiding
    return {
        tiding: getTiding(state, props),
        open: tiding.open,
        submitting: tiding.submitting,
    }
}

const mapDispatchToProps = (dispatch) => bindActionCreators({ close, update }, dispatch)

export default connect(mapStateToProps, mapDispatchToProps)(ModalTiding)
