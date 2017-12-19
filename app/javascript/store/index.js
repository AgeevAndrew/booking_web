import { createStore, compose, applyMiddleware } from 'redux'
import thunkMiddleware from 'redux-thunk'
import reducers from 'reducers'

export default (props, railsContext) => {

  const store = createStore(reducers, props, compose(applyMiddleware(thunkMiddleware)))

  return store
}
