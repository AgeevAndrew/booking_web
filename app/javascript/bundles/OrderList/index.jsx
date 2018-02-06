import React from 'react'
import { Provider } from 'react-redux'
import { IntlProvider } from 'react-intl'

import getStore from 'store/getStore'
import List from './list'

const OrderList = () =>
  <Provider store={getStore()}>
    <IntlProvider locale='en'>
      <List/>
    </IntlProvider>
  </Provider>


export default OrderList
