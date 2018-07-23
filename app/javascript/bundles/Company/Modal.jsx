import React, { Component } from 'react'
import { Modal, Form, Button } from 'semantic-ui-react'

class ModalSchedules extends Component {
    handleClose = () => {
        this.props.close()
    }
    handleConfirm = (schedules) => {
        const { change } = this.props
        change(schedules)
    }

    render() {
        const { schedules, open } = this.props
        return (
            <Modal open={open} closeIcon onClose={this.handleClose}>
                <Modal.Header>
                    {schedules.weekDay}
                </Modal.Header>
                <Modal.Content>
                    <Form>
                        <Form.Group widths='equal'>
                            <Form.Input fluid label='Время начала' value={schedules.timeStart} placeholder='Время начала'/>
                            <Form.Input fluid label='Время окончания' value={schedules.timeEnd} placeholder='Время окончания'/>
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
import { close, change } from 'store/ui/companies/company/modal/actions'

ModalSchedules.propTypes = {
    schedules: PropTypes.object.isRequired,
    open: PropTypes.bool.isRequired,
    submitting: PropTypes.bool.isRequired,
    close: PropTypes.func.isRequired,
    change: PropTypes.func.isRequired,
}

ModalSchedules.defaultProps = {
    open: false,
}

const mapStateToProps = (state, props) => {
    const { schedules } = state.ui.companies.company
    return {
        schedules: schedules.schedules,
        open: schedules.open,
        submitting: schedules.submitting,
    }
}

const mapDispatchToProps = (dispatch) => bindActionCreators({close, change}, dispatch)

export default connect(mapStateToProps, mapDispatchToProps)(ModalSchedules)
