import React from 'react'
import { map, entries, join } from 'lodash'
import { Container, Message } from 'semantic-ui-react'

class Errors extends React.Component {
  render() {
    const { toogleErrors, errors } = this.props
    return (
      <Container text style={{ paddingTop: '10px' }}>
        <Message error
          floating
          hidden={errors.length === 0}
          onClick={toogleErrors}>
          <Message.Header>Ошибки:</Message.Header>
          <Message.List>
            {map(errors, (error, index) =>
              <Message.Item key={index}>{join(entries(error), '; ')}</Message.Item>
            )}
          </Message.List>
        </Message>
      </Container>
    )
  }
}

import PropTypes from 'prop-types'
import { connect } from 'react-redux'
import { getArrayErrors } from 'selectors/errors'
import { toogleErrors } from 'store/ui/errors/actions'
import { bindActionCreators } from 'redux'

Errors.propTypes = {
  errors: PropTypes.array.isRequired,
  toogleErrors: PropTypes.func.isRequired,
}

const mapStateToProps = (state, props) => (
  {
    errors: getArrayErrors(state, props),
  }
)

const mapDispatchToProps = (dispatch) => bindActionCreators({ toogleErrors }, dispatch)

export default connect(mapStateToProps, mapDispatchToProps)(Errors)
