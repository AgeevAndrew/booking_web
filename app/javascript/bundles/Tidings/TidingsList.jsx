import React, { Component } from 'react'
import { List, Container } from 'semantic-ui-react'
import Tiding from './Tiding'
import {ModalTiding} from './ModalTiding';

class TidingsList extends Component {
    render() {
        const { tidings } = this.props
        return (
            <Container>
                <List>
                    {tidings.map((elem) => {
                       return (
                           <List.Item>
                                <Tiding key={elem.id} tidingId={elem.id}/>
                            </List.Item>
                       )
                    })}
                </List>
                <ModalTiding/>
            </Container>
        )
    }
}

import { connect } from 'react-redux'
import { getArrayTidings } from 'selectors/tidings'
import PropTypes from 'prop-types'

TidingsList.propTypes = {
    tidings: PropTypes.array,
}

const mapStateToProps = (state, props) => ({
    tidings: getArrayTidings(state, props),
})

export default connect(mapStateToProps)(TidingsList)
