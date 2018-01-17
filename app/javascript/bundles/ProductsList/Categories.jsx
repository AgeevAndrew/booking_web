import React from 'react'
import map from 'lodash/map'
import first from 'lodash/first'
import { Menu } from 'semantic-ui-react'

class Categories extends React.Component {

  handleCategories = (event, { categoryid }) => {
    const { setActiveCategory } = this.props
    setActiveCategory(categoryid)
  }

  render() {
    const { categories, setActiveCategory, activeCategoryId } = this.props
    if (!activeCategoryId && categories.length) {
      setActiveCategory(first(categories).id)
    }
    return (
      <Menu fluid vertical pointing>
        {
          map(categories, (category) =>
              <Menu.Item key={category.id}
                         categoryid={category.id}
                         name={category.name}
                         active={category.id === activeCategoryId}
                         onClick={this.handleCategories}/>
          )
        }
      </Menu>
    )
  }
}

import { connect } from 'react-redux'
import { setActiveCategory } from 'store/ui/categories/row/actions'
import { getArrayCategories } from 'selectors/categories'
import { bindActionCreators } from 'redux'
import PropTypes from 'prop-types'

Categories.propTypes = {
  categories: PropTypes.array.isRequired,
  activeCategoryId: PropTypes.number,
  setActiveCategory: PropTypes.func.isRequired,
}

const mapStateToProps = (state, props) => (
  {
    activeCategoryId: state.ui.categories.row.activeCategoryId,
    categories: getArrayCategories(state, props),
  }
)

const mapDispatchToProps = (dispatch) => bindActionCreators({ setActiveCategory }, dispatch)

export default connect(mapStateToProps, mapDispatchToProps)(Categories)
