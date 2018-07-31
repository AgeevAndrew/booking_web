import React, { Component } from 'react'
import { Segment, Header, Label } from 'semantic-ui-react'
import { tiding_status } from '../../shared/decorators/tiding_status'

export class Tiding extends Component {
    openModal = () => {
        const { toggle, tidings } = this.props
        toggle(tidings)
    }
    render() {
        const { tiding } = this.props
        return (
            <Segment onClick={this.openModal}>
                <Header>
                    {tiding.title}
                </Header>
                <Label corner='right' size='large' color={tiding_status(tiding.active)}></Label>
            </Segment>
        )
    }
}

import { connect } from 'react-redux'
import { bindActionCreators } from 'redux'
import PropTypes from 'prop-types'
import { getTiding } from 'selectors/tidings'
import { toggle } from 'store/ui/tidings/modal/actions'

Tiding.propTypes = {
    tiding: PropTypes.object.isRequired,
    toggle: PropTypes.func.isRequired,
}

const mapStateToProps = (state, props) => ({
    tiding: getTiding(state, props),
})

const mapDispatchToProps = (dispatch) => bindActionCreators({ toggle }, dispatch)

export default connect(mapStateToProps, mapDispatchToProps)(Tiding)
