import { createStore } from 'redux';
const configureStore = (railsProps) => (
  createStore(state => state, railsProps)
);

export default configureStore;
