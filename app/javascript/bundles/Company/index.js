import React from 'react'
import { Provider } from 'react-redux'

import getStore from 'store/getStore'
import Company from './Company'

const CompanyApp = (props) =>
    <Provider store={getStore()}>
        <Company { ...props }/>
    </Provider>
export default CompanyApp
