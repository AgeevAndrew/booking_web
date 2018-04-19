import React from 'react'
import map from 'lodash/map'
import PushMessageItem from './message'
import { Card } from 'semantic-ui-react'

class PushMessagesList extends React.Component {
  render() {
    const { pushMessages } = this.props
    return (
      <div>
        <Card.Group itemsPerRow={1}>
            {map(pushMessages, (message) => <PushMessageItem key={message.id} pushMessageId={message.id}/>)}
        </Card.Group>
      </div>
    )
  }
}

import { connect } from 'react-redux'
import { getArrayPushMessagesWithFilter } from 'selectors/push_messages'
import PropTypes from 'prop-types'

PushMessagesList.propTypes = {
  pushMessages: PropTypes.array.isRequired,
}

const mapStateToProps = (state, props) => ({
  pushMessages: getArrayPushMessagesWithFilter(state, props),
})

export default connect(mapStateToProps)(PushMessagesList)
