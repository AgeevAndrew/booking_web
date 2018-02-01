import React from 'react'
import { Menu } from 'semantic-ui-react'

class NavBar extends React.Component {
  handleItemClick = (e, data) => {
    alert(data.name)
  }
  render() {
    const { logedin } = this.props
    return (
      <Menu size='large'>
        <Menu.Item>
          <img src='/logo.png'/>
        </Menu.Item>
        <Menu.Menu position='right'>
          {
            logedin ?
              <Menu.Item>
                <a className='ui button primary' rel='nofollow' data-method='delete' href='/users/sign_out'>Выйти</a>
              </Menu.Item>
              :
              <Menu.Item name='Войти' onClick={this.handleItemClick}/>
          }
        </Menu.Menu>
      </Menu>
    )
  }
}

import PropTypes from 'prop-types'

NavBar.propTypes = {
  logedin: PropTypes.bool.isRequired,
}

export default NavBar
