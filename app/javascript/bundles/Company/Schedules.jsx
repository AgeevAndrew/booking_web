import React, { Component } from 'react'
import { Table, Icon } from 'semantic-ui-react'

class Schedules extends Component {
    openModal = (elem) => {
        const { toggle } = this.props
        console.log(elem)
        toggle(elem)
    }
    render () {
        const { schedules } = this.props
        schedules.sort((a, b) => {
            if (a.id < b.id){
                return -1
            } else if (a.id > b.id ) {
                return 1
            }
            return 0
        })
        const getHumanNameWeekDay = (weekDay) => {
            switch (weekDay) {
                case 'sun':
                    return 'Воскресенье'
                case 'mon':
                    return 'Понедельник'
                case 'tue':
                    return 'Вторник'
                case 'wed':
                    return 'Среда'
                case 'thu':
                    return 'Четверг'
                case 'fri':
                    return 'Пятница'
                case 'sat':
                    return 'Суббота'
            }
        }
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
                        {schedules.map((key) => {
                            return (
                                <Table.Row key={key.id} onClick={() => this.openModal(key)}>
                                    <Table.Cell>{getHumanNameWeekDay(key.weekDay)}</Table.Cell>
                                    <Table.Cell className='workCell'>
                                        {key.timeStart}
                                        &nbsp;
                                        <Icon className='editIcon' name='pencil'/>
                                    </Table.Cell>
                                    <Table.Cell className='workCell'>
                                        {key.timeEnd}
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
import { getSchedules } from 'selectors/companies'
import { toggle } from 'store/ui/companies/company/modal/actions'
import PropTypes from 'prop-types'

Schedules.propTypes = {
    schedules: PropTypes.array.isRequired,
    toggle: PropTypes.func.isRequired,
}
const mapStateToProps = (state, props) => ({
    schedules: getSchedules(state, props),
})

const mapDispatchToProps = (dispatch) => bindActionCreators( { toggle }, dispatch)

export default connect(mapStateToProps, mapDispatchToProps)(Schedules)

