import React from 'react'
import map from 'lodash/map'
import { Button, Form, Modal, Dropdown } from 'semantic-ui-react'
import MainOption from './MainOption'

class ProductNewForm extends React.Component {
  handleChange = (e, { name, value }) => this.props.change(name, value)
  handleChangeMainOption = (e, { index, name, value }) => {
    const { productForm, change } = this.props
    const mainOptions = productForm.mainOptions.slice()
    mainOptions[index] = { ...mainOptions[index], [name]: value }
    change('mainOptions', mainOptions)
  }
  handleClose = () => {
    this.props.close()
  }
  handleSubmit = () => {
    const { productForm, create } = this.props
    create(productForm)
  }
  handleCancelButton = () => this.props.cancel()
  handleNewMain = () => {
    this.props.increment()
  }
  getButtonBlock = () => {
    return (
      <Button.Group>
        <Button color='red'
                onClick={this.handleClose}
        >Отмена</Button>
        <Button.Or/>
        <Button color='blue'
                onClick={this.handleSubmit}
        >Сохранить</Button>
      </Button.Group>
    )
  }
  render() {
    const { openNewForm, error, categories, productForm } = this.props
    return (
      <Modal open={openNewForm} closeIcon onClose={this.handleClose}>
        <Modal.Header>
          Добавить новый продукт:
        </Modal.Header>
        <Modal.Content>
          { error && this.getErrorMessage(error) }
          <Form>
            <Form.Field>
              <Form.Input fluid label='Название'
                          name='title'
                          defaultValue={productForm.title}
                          onChange={this.handleChange}
              />
            </Form.Field>
            <Form.Field>
              <label>Категория</label>
              <Dropdown fluid selection
                        options={ categories }
                        name='categoryId'
                        onChange={ this.handleChange }
                        defaultValue={ productForm.categoryId }
              />
            </Form.Field>
            <Form.TextArea label='Краткое описание'
                           name='brief'
                           defaultValue={productForm.brief}
                           onChange={this.handleChange}/>
            <Form.TextArea label='Описание'
                           name='description'
                           defaultValue={productForm.description}
                           onChange={this.handleChange}/>
            {map(productForm.mainOptions, (mainOption, index) =>
              <MainOption key={index} index={index}/>
            )}
            <Button
                  className='fixedButton'
                  circular
                  icon='add'
                  color='green'
                  onClick={ this.handleNewMain }
              />
            { this.getButtonBlock() }
            </Form>
        </Modal.Content>
      </Modal>
    )
  }
}

import { connect } from 'react-redux'
import { bindActionCreators } from 'redux'
import { create, cancel, change, close, increment } from 'store/ui/products/row/actions'
import PropTypes from 'prop-types'
import { getCategoriesSelector } from 'selectors/categories'

ProductNewForm.propTypes = {
  categories: PropTypes.array.isRequired,
  product: PropTypes.object.isRequired,
  productForm: PropTypes.object.isRequired,
  create: PropTypes.func.isRequired,
  error: PropTypes.string.isRequired,
  cancel: PropTypes.func.isRequired,
  close: PropTypes.func.isRequired,
  change: PropTypes.func.isRequired,
  increment: PropTypes.func.isRequired,
  openNewForm: PropTypes.bool.isRequired,
}

const mapStateToProps = (state, ownProps) => {
  return {
    error: '',
    product: state.ui.products.row,
    productForm: state.ui.products.row,
    openNewForm: state.ui.products.row.openNewForm,
    categories: getCategoriesSelector(state, ownProps),
  }
}

const mapDispatchToProps = (dispatch) => bindActionCreators({ create, cancel, close, change, increment }, dispatch)

export default connect(mapStateToProps, mapDispatchToProps)(ProductNewForm)
