import React from 'react'
import PushForm from './form'
import { Button, Form } from 'semantic-ui-react'

class FilterForm extends React.Component {

  handleChange = (e, { value }) => this.props.changeFilter(value)
  handleClear = () => this.props.clearFilter()

  render() {
    const { query } = this.props.filter
    return (
      <Form>
        <Form.Group>
          <Form.Input width={10} icon='search' placeholder='Поиск...' onChange={this.handleChange} value={query}/>
          <Button color='red' onClick={this.handleClear}>Сброс</Button>
          <PushForm/>
        </Form.Group>
      </Form>
    )
  }
}

import { connect } from 'react-redux'
import { bindActionCreators } from 'redux'
import { changeFilter, clearFilter } from 'store/ui/push_messages/filter/actions'
import PropTypes from 'prop-types'

FilterForm.propTypes = {
  filter: PropTypes.object.isRequired,
  changeFilter: PropTypes.func.isRequired,
  clearFilter: PropTypes.func.isRequired,
}

const mapStateToProps = (state) => (
  {
    filter: state.ui.pushMessages.filter,
  }
)

const mapDispatchToProps = (dispatch) => bindActionCreators({ changeFilter, clearFilter }, dispatch)

export default connect(mapStateToProps, mapDispatchToProps)(FilterForm)
