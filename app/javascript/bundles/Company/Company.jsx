import React from 'react'
import { Container, Card, Item, Header, Segment, List, Popup, Table, Reveal, Icon, Image } from 'semantic-ui-react'
import Schedules from './Schedules'
import ModalScheduler from './Modal'
import { map } from 'lodash'
import './company.css'


class Company extends React.Component {
    render() {
        const { company, categories } = this.props
        return (
            <Container text>
                <Segment>
                    <Header as='h1'>{company.name}</Header>
                    <p>{company.description}</p>
                    <Header as='h3'>Категории</Header>
                        { map(categories, (elem) => {
                           return (
                               <Segment>{elem.name}</Segment>
                           )
                        })
                        }
                    <Card.Group className='center'>
                        <Card color='yellow'>
                            <Card.Content>
                                <Card.Header>Контакты</Card.Header>
                                <Card.Description>
                                    <List>
                                        <List.Item>
                                            <Popup trigger={<List.Icon name='mail'/>}
                                                   content='Почта'/>
                                            <List.Content>
                                                <strong>{company.contactInfo.email}</strong>
                                            </List.Content>
                                    </List.Item>
                                        <List.Item>
                                            <Popup trigger={<List.Icon name='phone'/>}
                                                   content='Телефон'/>
                                            <List.Content>
                                                <strong>{company.contactInfo.phone}</strong>
                                            </List.Content>
                                        </List.Item>
                                        <List.Item>
                                            <Popup trigger={<List.Icon name='marker'/>}
                                                   content='Координаты производства'/>
                                            <List.Content>
                                                <strong>{company.contactInfo.geotag}</strong>
                                            </List.Content>
                                        </List.Item>
                                        <List.Item>
                                            <Popup trigger={<List.Icon name='truck'/>}
                                                   content='Координаты самовывоза'/>
                                            <List.Content>
                                                <strong>{company.contactInfo.geotagCafe}</strong>
                                            </List.Content>
                                        </List.Item>
                                    </List>
                                </Card.Description>
                            </Card.Content>
                        </Card>
                        <Card color='red'>
                            <Card.Content>
                                <Card.Header>Доставка</Card.Header>
                                <Card.Description>
                                    <List>
                                        <List.Item>
                                            <Popup trigger={<List.Icon name='ruble'/>}
                                                   content='Цена доставки'/>
                                            <List.Content>
                                                <strong>{company.delivery.cost}</strong>
                                            </List.Content>
                                        </List.Item>
                                        <List.Item>
                                            <Popup trigger={<List.Icon name='clock'/>} content='Время доставки'/>
                                            <List.Content>
                                                <strong>{company.delivery.period.start}</strong>
                                                &nbsp; - <strong>{company.delivery.period.end}</strong>
                                            </List.Content>
                                        </List.Item>
                                        <List.Item>
                                            <Popup trigger={<List.Icon name='gift'/>}
                                                   content='Бесплатная доставка от'/>
                                            <List.Content>
                                                <strong>{company.delivery.freeShipping}</strong>
                                            </List.Content>
                                        </List.Item>
                                        <List.Item>
                                            <Popup trigger={<List.Icon name='car'/>}
                                                   content='Скидка за самовывоз'/>
                                            <List.Content>
                                                <strong>{company.delivery.pickupDiscount}</strong>
                                            </List.Content>
                                        </List.Item>
                                    </List>
                                </Card.Description>
                            </Card.Content>
                        </Card>
                    </Card.Group>
                    <Header>Время работы</Header>
                    <Schedules { ...company } />
                </Segment>
                <ModalScheduler/>
            </Container>
        )
    }
}
import { connect } from 'react-redux'
import { getArrayCompany } from '../../selectors/companies'
import PropTypes from 'prop-types'
import {getCategories} from '../../selectors/entities';
Company.propTypes = {
    company: PropTypes.object,
    categories: PropTypes.object,
}

const mapStateToProps = (state, props) => {
    return {
        company: getArrayCompany(state, props),
        categories: getCategories(state, props),
    }
}

export default connect(mapStateToProps)(Company)
