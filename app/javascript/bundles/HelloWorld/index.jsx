import React from 'react';
import { Provider } from 'react-redux';
import getStore from 'store/getStore'
import HelloWorld from './HelloWorld';

const HelloWorldApp = (props) => (
  <Provider store={getStore()}>
    <HelloWorld {...props} />
  </Provider>
);

export default HelloWorldApp;
