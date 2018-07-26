import React, { Component } from 'react'
import { Modal, Form, Button, Message, Icon } from 'semantic-ui-react'
import { getHumanNameWeekDay } from './helpers'

class ModalSchedules extends Component {
    handleClose = () => {
        this.props.close()
    }
    handleConfirm = (schedules) => {
        const { change } = this.props
        change(schedules)
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

    render() {
        const { schedules, open, error } = this.props
        return (
            <Modal open={open} closeIcon onClose={this.handleClose}>
                <Modal.Header>
                    {getHumanNameWeekDay(schedules.weekDay)}
                </Modal.Header>
                <Modal.Content>
                    { error ? this.getErrorMessage(error) : ''}
                    <Form>
                        <Form.Group widths='equal'>
                            <Form.Input fluid label='Время начала'
                                        name='timeStart'
                                        defaultValue={schedules.timeStart}
                                        onChange={this.handleChange}
                                        placeholder='Время начала'/>
                            <Form.Input fluid label='Время окончания'
                                        name='timeEnd'
                                        defaultValue={schedules.timeEnd}
                                        onChange={this.handleChange}
                                        placeholder='Время окончания'/>
                        </Form.Group>
                        <Form.Field
                            id='form-button-control-public'
                            control={Button}
                            onClick={() => this.handleConfirm(schedules)}
                            content='Отправить'
                        />
                    </Form>
                </Modal.Content>
            </Modal>
        )
    }
}

import { connect } from 'react-redux'
import { bindActionCreators } from 'redux'
import PropTypes from 'prop-types'
import { close, change, edit } from 'store/ui/company/modal/actions'

ModalSchedules.propTypes = {
    schedules: PropTypes.object.isRequired,
    open: PropTypes.bool.isRequired,
    submitting: PropTypes.bool.isRequired,
    close: PropTypes.func.isRequired,
    change: PropTypes.func.isRequired,
    edit: PropTypes.func.isRequired,
    error: PropTypes.string.isRequired,
}

ModalSchedules.defaultProps = {
    open: false,
    error: '',
}

const mapStateToProps = (state, props) => {
    const { schedules } = state.ui.company
    return {
        schedules: schedules.schedules,
        open: schedules.open,
        submitting: schedules.submitting,
        error: schedules.error,
    }
}

const mapDispatchToProps = (dispatch) => bindActionCreators({ close, change, edit }, dispatch)

export default connect(mapStateToProps, mapDispatchToProps)(ModalSchedules)
