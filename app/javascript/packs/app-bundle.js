import ReactOnRails from 'react-on-rails'

import ProductsListApp from 'bundles/ProductsList'
import NavBarApp from 'bundles/NavBar'
import ErrorsApp from 'bundles/Errors'
import SharedReduxStore from 'store'
import Turbolinks from 'turbolinks'
Turbolinks.start()

ReactOnRails.register({
  ProductsListApp,
  NavBarApp,
  ErrorsApp,
})

ReactOnRails.registerStore({
  SharedReduxStore,
})
