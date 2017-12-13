import PropTypes from 'prop-types';
import React from 'react';

import Product from './Product'

class ProductsList extends React.Component {


  render() {
    return (
      <div>
        {this.props.products.length}
        <table>
          <thead>
            <tr>
              <td>Id</td>
              <td>Title</td>
              <td>Brief</td>
              <td>Description</td>
              <td>Photo</td>
            </tr>
          </thead>
          <tbody>
            {
              this.props.products.map((product, i)=> (
                <Product i={i} {...product}/>
              ))
            }
          </tbody>
        </table>
      </div>
    )
  }
}

import { connect } from 'react-redux';
const mapStateToProps = (state) => ({ products: state.products });

export default connect(mapStateToProps, null)(ProductsList);
