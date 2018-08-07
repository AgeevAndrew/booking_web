import React from 'react'
import { Provider } from 'react-redux'
import { IntlProvider } from 'react-intl'
import getStore from 'store/getStore'
import TidingsList from './TidingsList'

const TidingsApp = () =>
    <Provider store={getStore()}>
        <IntlProvider locale='en'>
            <TidingsList/>
        </IntlProvider>
    </Provider>

export default TidingsApp
