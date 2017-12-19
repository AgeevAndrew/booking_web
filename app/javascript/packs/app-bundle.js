import ReactOnRails from 'react-on-rails';

import HelloWorldApp from 'bundles/HelloWorld';
import ProductsListApp from 'bundles/ProductsList';
import SharedReduxStore from 'store'

ReactOnRails.register({
  HelloWorldApp,
  ProductsListApp,
});

ReactOnRails.registerStore({
  SharedReduxStore,
})
