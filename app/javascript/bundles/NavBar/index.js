import React from 'react'
import { Provider } from 'react-redux'

import getStore from 'store/getStore'
import NavBar from './NavBar'

const NavBarApp = (props) =>
  <Provider store={getStore()}>
    <NavBar {...props}/>
  </Provider>


export default NavBarApp
