import React from 'react'
import { truncateString } from 'shared/decorators/string'
import { Card, Icon } from 'semantic-ui-react'
import { dateTimeFormat } from 'shared/decorators/date_time'


class PushMessageItem extends React.Component {

  handleOpen = () => {
    const { open, pushMessage } = this.props
    open(pushMessage)
  }

  extra = (success, failure) =>
    <div>
      <Icon circular inverted name='user outline' color='green'/>
      {success}
      &nbsp;&nbsp;
      <Icon circular inverted name='user outline' color='red'/>
      {failure}
    </div>


  render() {
    const { pushMessage } = this.props
    return (
      <Card link
        header={pushMessage.title}
        meta={dateTimeFormat(pushMessage.createdAt)}
        description={truncateString(pushMessage.body, 80)}
        extra={this.extra(pushMessage.success, pushMessage.failure)}
        onClick={this.handleOpen}/>
    )
  }
}


import { connect } from 'react-redux'
import { bindActionCreators } from 'redux'
import { getPushMessage } from 'selectors/push_messages'
import { open } from 'store/ui/push_messages/modal/actions'
import PropTypes from 'prop-types'

PushMessageItem.propTypes = {
  open: PropTypes.func.isRequired,
  pushMessage: PropTypes.object.isRequired,
}

const mapStateToProps = (state, props) => (
  {
    pushMessage: getPushMessage(state, props),
  }
)

const mapDispatchToProps = (dispatch) => bindActionCreators({ open }, dispatch)

export default connect(mapStateToProps, mapDispatchToProps)(PushMessageItem)
