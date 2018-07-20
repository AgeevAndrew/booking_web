import React from 'react'
import { Container, Card, Item, Header, Segment, List, Popup } from 'semantic-ui-react'
import './company.css'

class Company extends React.Component {
    render() {
        const { company} = this.props
        return (
            <Container text>
                <Segment>
                    <Header as='h1'>{company.name}</Header>
                    <p>{company.description}</p>
                    <Header as='h3'>Категории</Header>
                    {company.categories.map(elem => {
                        return (
                            <p>{elem}</p>
                        )
                    })}
                    <Card.Group centered className='center'>
                        <Card color='yellow'>
                            <Card.Content>
                                <Card.Header>Контакты</Card.Header>
                                <Card.Description>
                                    <List>
                                        <List.Item>
                                            <Popup trigger={<List.Icon name='mail'/>} content='Почта'/>
                                            <List.Content><strong>{company.contactInfo.email}</strong></List.Content>
                                    </List.Item>
                                        <List.Item>
                                            <Popup trigger={<List.Icon name='phone'/>} content='Телефон'/>
                                            <List.Content><strong>{company.contactInfo.phone}</strong></List.Content>
                                        </List.Item>
                                        <List.Item>
                                            <Popup trigger={<List.Icon name='marker'/>} content='Координаты производства'/>
                                            <List.Content><strong>{company.contactInfo.geotag}</strong></List.Content>
                                        </List.Item>
                                        <List.Item>
                                            <Popup trigger={<List.Icon name='truck'/>} content='Координаты самовывоза'/>
                                            <List.Content><strong>{company.contactInfo.geotagCafe}</strong></List.Content>
                                        </List.Item>
                                    </List>
                                </Card.Description>
                            </Card.Content>
                        </Card>
                        <Card color='red'>
                            <Card.Content>
                                <Card.Header>Доставка</Card.Header>
                                <Card.Description>
                                    <p>Цена: <strong>{company.delivery.cost}</strong></p>
                                    <p>Начиная с: <strong>{company.delivery.period.start}</strong>
                                        по <strong>{company.delivery.period.end}</strong></p>
                                    <p>Сумма бесплатной доставки: <strong>{company.delivery.freeShipping}</strong></p>
                                    <p>Скида за самовывоз: <strong>{company.delivery.pickupDiscount}</strong></p>
                                </Card.Description>
                            </Card.Content>
                        </Card>
                    </Card.Group>
                    <Header>Время работы</Header>
                </Segment>
            </Container>
        )
    }
}
import { connect } from 'react-redux'
import { getArrayCompany } from '../../selectors/companies'
import PropTypes from 'prop-types'
Company.propTypes = {
    company: PropTypes.array,
}

const mapStateToProps = (state, props) => {
    return {
        company: getArrayCompany(state, props),
    }
}

export default connect(mapStateToProps)(Company)
