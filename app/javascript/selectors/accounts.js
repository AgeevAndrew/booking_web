import { createSelector } from 'reselect'
import { values } from 'lodash'
import { getAccounts } from './entities'

export const getArrayAccounts = createSelector(
  [getAccounts],
  (accounts) => values(accounts)
)

const getAccountId = (state) => state.ui.orders.modal.order.accountId

export const getAccount = createSelector(
  [getAccounts, getAccountId],
  (accounts, accountId) => accounts[accountId]
)
