import PropTypes from 'prop-types';
import React from 'react';
import map from 'lodash/map'
import { getArrayProducts } from 'selectors/products'
import Product from './Product'
import { connect } from 'react-redux';

class ProductsList extends React.Component {


  render() {
    const { products } = this.props

    return (
      <div>
        {products.length}
        <table>
          <thead>
            <tr>
              <td>Id</td>
              <td>Title</td>
              <td>Brief</td>
              <td>Description</td>
              <td>Photo</td>
              <td>Active</td>
            </tr>
          </thead>
          <tbody>
            {
              map(products, (product => (
                <Product key={product.id} id={product.id} />
              )))
            }
          </tbody>
        </table>
      </div>
    )
  }
}

const mapStateToProps = (state, ownProps) => ({ products: getArrayProducts(state, ownProps) });

export default connect(mapStateToProps)(ProductsList);
