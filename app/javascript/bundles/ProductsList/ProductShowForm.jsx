import React from 'react'
import { map, includes } from 'lodash'
import { Button, Card } from 'semantic-ui-react'

class ProductShowForm extends React.Component {

  handleActivityButton = () => {
    const { product, updateActivity } = this.props
    updateActivity(product)
  }
  handleEditButton = () => {
    const { product, init } = this.props
    init(product, true)
  }

  handleDelete = () => {
    const { product, setConfirm } = this.props
    setConfirm(product.id)
  }

  render() {
    const { product, sendActivities } = this.props
    return (
      <React.Fragment>
      <Card.Content>
          <Card.Header>
            { product.title }
          </Card.Header>
          <Card.Meta>
            { product.brief }
          </Card.Meta>
          <Card.Description>
            { product.description }
            <div>
              {map(product.mainOptions, (mo, index) =>
                <div key={index}>{mo.name} - {mo.cost} ₽</div>
              )}
            </div>
          </Card.Description>
      </Card.Content>
      <Card.Content extra>
        <Button floated='left'
                loading={includes(sendActivities, product.id)}
                color={product.active ? 'green' : 'red'}
                onClick={this.handleActivityButton}>
          {product.active ? 'On' : 'Off'}
        </Button>
        <Button floated='right'
                color='orange'
                onClick={this.handleEditButton}>
                Редактировать
        </Button>
        <Button floated='right'
                loading={includes(sendActivities, product.id)}
                color='red'
                onClick={this.handleDelete}
                content='Удалить'/>
      </Card.Content>
      </React.Fragment>
    )
  }
}


import { connect } from 'react-redux'
import { getProduct } from 'selectors/products'
import { updateActivity } from 'store/ui/products/activities/actions'
import { init } from 'store/ui/products/row/actions'
import { setConfirm } from 'store/ui/products/confirm/actions'
import { bindActionCreators } from 'redux'
import PropTypes from 'prop-types'

ProductShowForm.propTypes = {
  product: PropTypes.object.isRequired,
  sendActivities: PropTypes.array.isRequired,
  updateActivity: PropTypes.func.isRequired,
  init: PropTypes.func.isRequired,
  setConfirm: PropTypes.func.isRequired,
}

const mapStateToProps = (state, props) => (
  {
    product: getProduct(state, props),
    sendActivities: state.ui.products.activities,
  }
)

const mapDispatchToProps = (dispatch) => bindActionCreators({ init, setConfirm, updateActivity }, dispatch)


export default connect(mapStateToProps, mapDispatchToProps)(ProductShowForm)
