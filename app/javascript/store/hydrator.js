import { normalizeEntities } from './normalize'
import { initialState } from './reducers'

export default (props) => {
  const { entities } = normalizeEntities(props)

  return {
    ...initialState,
    entities: {
      ...initialState.entities,
      ...entities,
    },
    ui: {
      ...initialState.ui,
    },
  }
}
