// Run this example by adding <%= javascript_pack_tag 'hello_react' %> to the head of your layout file,
// like app/views/layouts/application.html.erb. All it does is render <div>Hello React</div> at the bottom
// of the page.

import React, { Component } from 'react';
import PropTypes from 'prop-types';

export default class HelloReact extends Component {
  render () {
    return (
      <h1>Wat?</h1>
    )
  }
}
