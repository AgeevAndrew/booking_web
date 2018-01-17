import React from 'react'
import { Provider } from 'react-redux'

import getStore from 'store/getStore'
import Errors from './Errors'

const ErrorsApp = (props) =>
  <Provider store={getStore()}>
    <Errors {...props}/>
  </Provider>


export default ErrorsApp
