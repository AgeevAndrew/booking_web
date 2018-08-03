import React, { Component } from 'react'
import { Segment, Header, Label, Accordion, Icon,
    Radio, Grid, Button, Container, Divider } from 'semantic-ui-react'
import { tidingStatus } from 'shared/decorators/tiding_status'

class Tiding extends Component {
    openModal = () => {
        const { toggle, tiding } = this.props
        toggle(tiding)
    }
    handleClick = (e, titleProps) => {
        const { index } = titleProps
        const { activeIndex, accordionToggle } = this.props
        const newIndex = activeIndex === index ? -1 : index
        accordionToggle(newIndex)

    }
    setActive = (e, checked, index) => {
        const { activate, deactivate } = this.props
        if (checked) {
            activate(index)
        } else {
            deactivate(index)
        }
    }
    removeTiding = (index) => {
        const { remove } = this.props
        if (confirm('Вы действительно хотите удалить новость?')) {
            remove(index)
        }
    }
    render() {
        const { tiding, activeIndex } = this.props
        return (
            <Segment>
                <Accordion fluid>
                    <Grid columns={2}>
                    <Grid.Row>
                        <Grid.Column width={14}>
                            <Accordion.Title
                                index={tiding.id}
                                active={ activeIndex === tiding.id }
                                onClick={ this.handleClick }
                            >
                                <Header as='h3'>
                                    <Icon name='dropdown'></Icon>
                                    {tiding.title}
                                </Header>
                            </Accordion.Title>
                            <Accordion.Content active={activeIndex === tiding.id }>
                                <Container text fluid>
                                    <p>{tiding.body}</p>
                                </Container>
                                <Divider/>
                                <Header as='h4'>
                                    Текст для push-сообщения
                                </Header>
                                <Container text fluid>{tiding.message}</Container>
                                <Button.Group floated='right'>
                                    <Button color='red'
                                            onClick={() => { this.removeTiding(tiding.id) }}
                                    >Удалить</Button>
                                    <Button.Or/>
                                    <Button color='yellow'
                                            onClick={this.openModal}
                                    >Редактировать</Button>
                                </Button.Group>
                            </Accordion.Content>
                        </Grid.Column>
                        <Grid.Column width={1}>
                            <Radio toggle
                                   onClick={ (e, { checked }) => { this.setActive(e, checked, tiding.id) } }
                                   defaultChecked={tiding.active === 'on'}

                            />
                        </Grid.Column>
                    </Grid.Row>
                    </Grid>
                </Accordion>
                <Label corner='right' size='large' color={tidingStatus(tiding.active)}></Label>
            </Segment>
        )
    }
}

import { connect } from 'react-redux'
import { bindActionCreators } from 'redux'
import PropTypes from 'prop-types'
import { getTiding } from 'selectors/tidings'
import { toggle } from 'store/ui/tidings/modal/actions'
import { accordionToggle, activate, deactivate, remove } from 'store/ui/tidings/actions'

Tiding.propTypes = {
    tiding: PropTypes.object.isRequired,
    toggle: PropTypes.func.isRequired,
    activeIndex: PropTypes.number.isRequired,
    accordionToggle: PropTypes.func.isRequired,
    activate: PropTypes.func.isRequired,
    deactivate: PropTypes.func.isRequired,
    remove: PropTypes.func.isRequired,
}

const mapStateToProps = (state, props) => {
    const { activeIndex } = state.ui.tidings.tiding
    return {
        tiding: getTiding(state, props),
        activeIndex,
    }
}

const mapDispatchToProps = (dispatch) => bindActionCreators({ toggle, accordionToggle, activate,
    deactivate, remove }, dispatch)

export default connect(mapStateToProps, mapDispatchToProps)(Tiding)
