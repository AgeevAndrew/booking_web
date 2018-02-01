import * as actionTypes from './constants'

const initialState = {
  id: '',
  companyId: '',
  categoryId: '',
  title: '',
  description: '',
  brief: '',
  photo: '',
  mainOptions: {},
  additionalInfo: {},
  isSendFrom: false,
}

export default (productForm = initialState, action) => {
  const { type, key, value, form } = action
  switch (type) {
    case actionTypes.INIT_FORM:
      return { ...form, isSendFrom: false }
    case actionTypes.SEND_FORM:
      return { ...productForm, isSendFrom: true }
    case actionTypes.CANCEL_FORM:
      return { ...initialState }
    case actionTypes.SEND_FINISH:
      return { ...initialState }
    case actionTypes.CHANGE_FORM:
      return { ...productForm, [key]: value }
    default:
      return productForm
  }
}
