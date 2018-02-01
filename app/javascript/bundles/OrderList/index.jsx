import React from 'react'
import { Provider } from 'react-redux'

import getStore from 'store/getStore'
import List from './list'

const OrderList = () =>
  <Provider store={getStore()}>
    <List/>
  </Provider>


export default OrderList
