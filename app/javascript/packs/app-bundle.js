import ReactOnRails from 'react-on-rails'

import ProductsListApp from 'bundles/ProductsList'
import NavBarApp from 'bundles/NavBar'
import ErrorsApp from 'bundles/Errors'
import OrderList from 'bundles/OrderList'
import PushMessages from 'bundles/PushMessages'
import CompanyApp from 'bundles/Company'
import TidingsApp from 'bundles/Tidings'
import SharedReduxStore from 'store'
import Turbolinks from 'turbolinks'
Turbolinks.start()

ReactOnRails.register({
  ProductsListApp,
  NavBarApp,
  ErrorsApp,
  OrderList,
  PushMessages,
  CompanyApp,
  TidingsApp,
})

ReactOnRails.registerStore({
  SharedReduxStore,
})
