import React, { Component } from 'react'
import { Table, Icon } from 'semantic-ui-react'
import { getHumanNameWeekDay } from '/shared/decorators/weekDays'

class Schedules extends Component {
    openModal = (elem) => {
        const { toggle } = this.props
        toggle(elem)
    }
    render () {
        const { schedules } = this.props
        return (
                <Table celled>
                    <Table.Header>
                        <Table.Row>
                            <Table.HeaderCell>День недели</Table.HeaderCell>
                            <Table.HeaderCell>Время начала</Table.HeaderCell>
                            <Table.HeaderCell>Время окончания</Table.HeaderCell>
                        </Table.Row>
                    </Table.Header>
                    <Table.Body>
                        {schedules.map((elem) => {
                            return (
                                <Table.Row key={elem.id} onClick={() => this.openModal(elem)}>
                                    <Table.Cell>{getHumanNameWeekDay(elem.weekDay)}</Table.Cell>
                                    <Table.Cell className='workCell'>
                                        {elem.timeStart}
                                        &nbsp;
                                        <Icon className='editIcon' name='pencil'/>
                                    </Table.Cell>
                                    <Table.Cell className='workCell'>
                                        {elem.timeEnd}
                                        &nbsp;
                                        <Icon className='editIcon' name='pencil'/>
                                    </Table.Cell>
                                </Table.Row>
                                )
                        })}
                    </Table.Body>
                </Table>
        )
    }
}

import { connect } from 'react-redux'
import { bindActionCreators } from 'redux'
import { getArraySchedules } from 'selectors/companySchedules'
import { toggle } from 'store/ui/company/modal/actions'
import PropTypes from 'prop-types'

Schedules.propTypes = {
    schedules: PropTypes.array.isRequired,
    toggle: PropTypes.func.isRequired,
}
const mapStateToProps = (state, props) => ({
    schedules: getArraySchedules(state, props),
})

const mapDispatchToProps = (dispatch) => bindActionCreators( { toggle }, dispatch)

export default connect(mapStateToProps, mapDispatchToProps)(Schedules)

