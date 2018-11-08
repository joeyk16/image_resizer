import { mountComponents } from 'react-rails-ujs';

import HelloReact from './HelloReact';

const mountReactComponents = () => {
  mountComponents({
    HelloReact,
  });
};

export default mountReactComponents;
