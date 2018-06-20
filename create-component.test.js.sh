echo "import React from 'react';
import { shallow, render, mount } from 'enzyme';
import $1 from './$1';

describe('$1', () => {
  let props;
  let shallow$1;
  let rendered$1;
  let mounted$1;

  const shallowTestComponent = () => {
    if (!shallow$1) {
      shallow$1 = shallow(
        <$1 {...props}>{props.children}</$1>
      );
    }
    return shallow$1;
  };

  const renderTestComponent = () => {
    if (!rendered$1) {
      rendered$1 = render(
        <$1 {...props}>{props.children}</$1>
      );
    }
    return rendered$1;
  };

  const mountTestComponent = () => {
    if (!mounted$1) {
      mounted$1 = render(
        <$1 {...props}>{props.children}</$1>
      );
    }
    return mounted$1;
  };  

  beforeEach(() => {
    props = {};
    shallow$1 = undefined;
    rendered$1 = undefined;
    mounted$1 = undefined;
  });

  // Shallow / unit tests begin here
 
  // Render / mount / integration tests begin here
  
});" > src/components/$1/$1.test.js