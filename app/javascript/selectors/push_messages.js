import { createSelector } from 'reselect'
import { values, filter } from 'lodash'
import { getPushMessages } from './entities'
import { getPushMessageId } from './props'
import { getQueryFilter } from './ui'

export const getArrayPushMessages = createSelector(
  [getPushMessages],
  (pushMessages) => values(pushMessages)
)

export const getPushMessage = createSelector(
  [getPushMessages, getPushMessageId],
  (pushMessages, pushMessageId) => pushMessages[pushMessageId]
)

export const getArrayPushMessagesWithFilter = createSelector(
  [getArrayPushMessages, getQueryFilter],
  (pushMessages, query) => filter(pushMessages, (message) =>
    message.title.includes(query) || message.body.includes(query)
  )
)
