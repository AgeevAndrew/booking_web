import { createStore, compose, applyMiddleware } from 'redux'
import thunkMiddleware from 'redux-thunk'
import reducers from 'reducers'
import { normalizeEntities } from './normalize'

export default (props, railsContext) => {
  const store = createStore(
    reducers,
    normalizeEntities(props).entities,
    compose(
      applyMiddleware(thunkMiddleware),
      window.devToolsExtension ? window.devToolsExtension() : (f) => f
    ))

  return store
}
