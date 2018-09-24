import * as actionTypes from './constants'
import { initialMO } from './mainOptions'

const initialState = {
  categoryId: '',
  title: '',
  description: '',
  brief: '',
  photo: '',
  mainOptions: [initialMO],
  additionalInfo: [],
  isSendFrom: false,
  openNewForm: false,
}

export default (productForm = initialState, action) => {
  const { type, key, value, form, index } = action
  switch (type) {
    case actionTypes.INIT_FORM:
      return { ...form, isSendFrom: false, openNewForm: false }
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
      return { ...productForm, mainOptions: productForm.mainOptions.concat({ cost: '', name: '' }) }
    case actionTypes.CHANGE_MO:
      const newMO = [...productForm.mainOptions]
      const item = { ...newMO[index], [key]: value }
      return { ...productForm, mainOptions: [...productForm.mainOptions.slice(0, index),
          item, ...productForm.mainOptions.slice(index + 1)] }
    default:
      return productForm
  }
}
