import React, { Component } from 'react'
import { List, Container, Button } from 'semantic-ui-react'
import Tiding from './Tiding'
import ModalTiding from './ModalTiding'
import './style.css'

class TidingsList extends Component {
    handleCreate = () => {
        const { toggle, users, tiding } = this.props
        tiding.companyId = users.companyId
        toggle(tiding)
    }
    render() {
        const { tidings } = this.props
        return (
            <Container>
                <List>
                    { tidings.map((elem) => {
                       return (
                           <List.Item key={elem.id}>
                                <Tiding tidingId={elem.id}/>
                            </List.Item>
                       )
                    }) }
                </List>
                <ModalTiding/>
                <Button
                    className='fixedButton'
                    circular
                    icon='add'
                    color='green'
                    onClick={ this.handleCreate }
                />
            </Container>
        )
    }
}

import { connect } from 'react-redux'
import { getArrayTidings, getUsers } from 'selectors/tidings'
import { bindActionCreators } from 'redux'
import PropTypes from 'prop-types'
import { toggle } from 'store/ui/tidings/modal/actions'

TidingsList.propTypes = {
    tidings: PropTypes.array,
    users: PropTypes.object,
    tiding: PropTypes.object,
    toggle: PropTypes.func,
}

const mapStateToProps = (state, props) => {
    const { tiding } = state.ui.tidings.modal
    return {
        tidings: getArrayTidings(state, props),
        tiding,
        users: getUsers(state, props),
    }
}

const mapDispatchToProps = (dispatch) => bindActionCreators({ toggle }, dispatch)

export default connect(mapStateToProps, mapDispatchToProps)(TidingsList)
