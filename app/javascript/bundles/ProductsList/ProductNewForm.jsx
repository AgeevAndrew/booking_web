import React from 'react'
import map from 'lodash/map'
import { Button, Item, Input, TextArea, Form, Label, Modal, Dropdown } from 'semantic-ui-react'

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
    productForm.active = true
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
        const { openNewForm, error, categories, mainOptionsCounter, productForm } = this.props
        const finalCategories = []
        for (let elem of categories){
            let category = { key: elem.id, text: elem.name, value: elem.id}
            finalCategories.push(category)
        }
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
                                        placeholder='Название'/>
                            </Form.Field>
                            <Form.Field>
                                <label>Категория</label>
                                <Dropdown fluid selection
                                          options={ finalCategories }
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
                            {[...Array(mainOptionsCounter)].map((mo, index) =>
                                <Form.Group widths='equal' key={index}>
                                  <Form.Input index={index}
                                    name='name'
                                    defaultValue=''
                                    placeholder='Порция'
                                    onChange={this.handleChangeMainOption}/>
                                  <Form.Input index={index}
                                    name='cost'
                                    type='number'
                                    step='0.01'
                                    labelPosition='left'
                                    defaultValue=''
                                    placeholder='Цена'
                                    onChange={this.handleChangeMainOption}>
                                    <input/>
                                    <Label basic>₽</Label>
                                  </Form.Input>
                                   <Button
                                        className='fixedButton'
                                        circular
                                        icon='add'
                                        color='green'
                                        onClick={ this.handleNewMain }
                                   />
                                </Form.Group>
                            )}
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
import { getArrayCategories } from 'selectors/categories'

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
  mainOptionsCounter: PropTypes.number.isRequired,
}

const mapStateToProps = (state, ownProps) => {
    return {
    error: '',
    product: state.ui.products.row,
    productForm: state.ui.products.row,
    mainOptionsCounter: state.ui.products.row.mainOptionsCounter,
    openNewForm: state.ui.products.row.openNewForm,
    categories: getArrayCategories(state, ownProps),
  }
}

const mapDispatchToProps = (dispatch) => bindActionCreators({ create, cancel, close, change, increment }, dispatch)

export default connect(mapStateToProps, mapDispatchToProps)(ProductNewForm)