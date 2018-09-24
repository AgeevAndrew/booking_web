import React from 'react'
import { Form, Label } from 'semantic-ui-react'

class MainOption extends React.Component {
  handleChange = (e, { name, value }) => {
    const { index, changeMO } = this.props
    changeMO(name, value, index)
  }
  handleNewMain = () => {
    this.props.increment()
  }
  render() {
    return (
              <Form.Group widths='equal'>
                <Form.Input label='Порция'
                            name='name'
                            defaultValue=''
                            onChange={this.handleChange}/>
                <Form.Input label='Цена'
                            name='cost'
                            type='number'
                            step='0.01'
                            labelPosition='left'
                            defaultValue=''
                            onChange={this.handleChange}>
                  <input/>
                    <Label basic>₽</Label>
                </Form.Input>
              </Form.Group>
    )
  }
}

import { connect } from 'react-redux'
import { bindActionCreators } from 'redux'
import { increment, changeMO } from 'store/ui/products/row/actions'
import PropTypes from 'prop-types'

MainOption.propTypes = {
  mainOption: PropTypes.object.isRequired,
  index: PropTypes.number.isRequired,
  changeMO: PropTypes.func.isRequired,
  increment: PropTypes.func.isRequired,
}

const mapStateToProps = (state, props) => {
  return {
    mainOption: state.ui.products.row.mainOptions[props.index],
  }
}

const mapDispatchToProps = (dispatch) => bindActionCreators({ changeMO, increment }, dispatch)

export default connect(mapStateToProps, mapDispatchToProps)(MainOption)
