import React from 'react'
import { Provider } from 'react-redux'
import { Container } from 'semantic-ui-react'

import getStore from 'store/getStore'
import FilterForm from './filter'
import PushMessagesList from './list'
import PushMessageModal from './message_modal'

const PushMessagesApp = () =>
  <Provider store={getStore()}>
    <Container text>
      <FilterForm/>
      <PushMessagesList/>
      <PushMessageModal/>
    </Container>
  </Provider>


export default PushMessagesApp
