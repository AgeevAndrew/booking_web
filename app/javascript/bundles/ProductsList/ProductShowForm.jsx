import React from 'react'
import { map, includes } from 'lodash'
import { Button, Item } from 'semantic-ui-react'

class ProductShowForm extends React.Component {

  handleActivityButton = () => {
    const { product, updateActivity } = this.props
    updateActivity(product)
  }
  handleEditButton = () => {
    const { product, init } = this.props
    init(product, true)
  }
  render() {
    const { product, sendActivities } = this.props
    return (
      <Item.Content>
          <Item.Header>
            { product.title }
          </Item.Header>
          <Item.Meta>
            { product.brief }
          </Item.Meta>
          <Item.Description>
            { product.description }
            <div>
              {map(product.mainOptions, (mo, index) =>
                <div key={index}>{mo.name} - {mo.cost} ₽</div>
              )}
            </div>
          </Item.Description>
          <Item.Extra>
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
          </Item.Extra>
      </Item.Content>
    )
  }
}


import { connect } from 'react-redux'
import { getProduct } from 'selectors/products'
import { updateActivity } from 'store/ui/products/activities/actions'
import { init } from 'store/ui/products/row/actions'
import { bindActionCreators } from 'redux'
import PropTypes from 'prop-types'

ProductShowForm.propTypes = {
  product: PropTypes.object.isRequired,
  sendActivities: PropTypes.array.isRequired,
  updateActivity: PropTypes.func.isRequired,
  init: PropTypes.func.isRequired,
}

const mapStateToProps = (state, props) => (
  {
    product: getProduct(state, props),
    sendActivities: state.ui.products.activities,
  }
)

const mapDispatchToProps = (dispatch) => bindActionCreators({ init, updateActivity }, dispatch)


export default connect(mapStateToProps, mapDispatchToProps)(ProductShowForm)
