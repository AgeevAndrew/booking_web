import React from 'react'
import { Provider } from 'react-redux'

import getStore from 'store/getStore'
import LeftSideMenu from './menu'

const SideMenu = () =>
  <Provider store={getStore()}>
    <LeftSideMenu/>
  </Provider>


export default SideMenu
