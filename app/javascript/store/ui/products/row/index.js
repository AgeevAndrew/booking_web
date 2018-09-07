import * as actionTypes from './constants'

const initialState = {
  categoryId: '',
  title: '',
  description: '',
  brief: '',
  photo: '',
  mainOptions: [{ cost: '', name: '' }],
  additionalInfo: [],
  isSendFrom: false,
  openNewForm: false,
  mainOptionsCounter: 1,
}

export default (productForm = initialState, action) => {
  const { type, key, value, form } = action
  switch (type) {
    case actionTypes.INIT_FORM:
      return { ...form, isSendFrom: false, openNewForm: false, mainOptionsCounter: 1 }
    case actionTypes.SEND_FORM:
      return { ...productForm, isSendFrom: true }
    case actionTypes.CANCEL_FORM:
      return { ...initialState }
    case actionTypes.SEND_FINISH:
      return { ...initialState }
    case actionTypes.CHANGE_FORM:
      return { ...productForm, [key]: value }
    case actionTypes.OPEN:
      return { ...productForm, openNewForm: true }
    case actionTypes.CLOSE:
      return { ...initialState }
    case actionTypes.INC:
      return { ...productForm, mainOptionsCounter: productForm.mainOptionsCounter + 1 }
    default:
      return productForm
  }
}
