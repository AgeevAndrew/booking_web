import * as actionTypes from './constants'
import * as entitiesActions from 'store/entities/actions'
import PushMessagesEndpoint from 'shared/endpoints/push_messages_endpoint'

export const change = (key, value) => ({ type: actionTypes.CHANGE_FORM, key, value })
export const sending = () => ({ type: actionTypes.SENDING })
export const sendSuccess = () => ({ type: actionTypes.SEND_SUCCESS })
export const sendFailure = () => ({ type: actionTypes.SEND_FAILURE })
export const close = () => ({ type: actionTypes.CLOSE })

export const sendPushMessage = (pushMessage) => (dispatch) => {
  dispatch(sending())
  PushMessagesEndpoint.send({ ...pushMessage })
    .then((response) => {
      if (response.success) {
        dispatch(entitiesActions.upsertEntity('pushMessages', { ...response.json }))
        dispatch(sendSuccess())
      } else {
        dispatch(sendFailure())
      }
    })
}
