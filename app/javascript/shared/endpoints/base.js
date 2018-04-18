import ReactOnRails from 'react-on-rails'
import QueryString from 'query-string'
import includes from 'lodash/includes'
import { camelizeKeys, decamelizeKeys } from 'humps'
import fetch from 'cross-fetch'

function requestParams(json, method) {
  return {
    method,
    credentials: 'same-origin',
    headers: ReactOnRails.authenticityHeaders({
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    }),
    body: method === 'get' ? null : JSON.stringify(json),
  }
}

function handleResponse(response) {
  const { status, headers } = response
  if (includes([200, 201, 204, 422], status)) {
    return Promise.resolve(
      status === 204
        ? { success: true, json: {}, location: headers.get('Location') }
        : response.json().then((json) => ({
            success: status !== 422,
            location: headers.get('Location'),
            json: camelizeKeys(json),
          }))
    )
  }
  return Promise.resolve({ success: false, json: {}, location: headers.get('Location') })
}

function handleError(error) {
  alert(error)
}

export function railsRequest(options) {
  const { uri, params: params = {}, method: method = 'post' } = options
  const decamelizedParams = decamelizeKeys(params)
  const queryString = method === 'get' ? `?${QueryString.stringify(decamelizedParams)}` : ''
  const url = uri + queryString

  return fetch(url, requestParams(decamelizedParams, method))
    .then(handleResponse, handleError)
}
