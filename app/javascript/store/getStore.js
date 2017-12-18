import ReactOnRails from 'react-on-rails'

const SHARED_REDUX_STORE = 'SharedReduxStore'

export default function getStore() {
  return ReactOnRails.getStore(SHARED_REDUX_STORE)
}
