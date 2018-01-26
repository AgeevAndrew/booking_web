import { createStore, compose, applyMiddleware } from 'redux'
import thunkMiddleware from 'redux-thunk'
import reducers from './reducers'
// import { normalizeEntities } from './normalize'
import getInitialState from './hydrator'

export default (props) => {
  const store = createStore(
    reducers,
    getInitialState(props),
    compose(
      applyMiddleware(thunkMiddleware),
      window.devToolsExtension ? window.devToolsExtension() : (f) => f
    ))

  return store
}
