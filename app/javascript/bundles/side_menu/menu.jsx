import React from 'react'
import { Menu, Icon } from 'semantic-ui-react'

class LeftSideMenu extends React.Component {
  handleClick = (route) => {
    Turbolinks.visit(route)
  }

  //  onClick={this.handleClick('/products')}
  render() {
    return (
      <Menu icon='labeled' vertical>
        <Menu.Item name='credit card' onClick={() => this.handleClick('/orders')}>
          <Icon name='credit card'/>
          Заказы
        </Menu.Item>
        <Menu.Item name='food' onClick={() => this.handleClick('/products')}>
          <Icon name='food'/>
          Меню
        </Menu.Item>
        <Menu.Item name='star'>
          <Icon name='star'/>
          Акции
        </Menu.Item>
      </Menu>
    )
  }
}

import { connect } from 'react-redux'
import PropTypes from 'prop-types'

LeftSideMenu.propTypes = {}

const mapStateToProps = (state, props) => ({})

export default connect(mapStateToProps)(LeftSideMenu)
