# create-reactjs-component

Generate one or multiple boilerplate components within `src`. 

Note that this component uses `.scss` files instead of `.css` files by default. If you do not want to use `.scss` files, simply change the `.scss` file extension to `.css` and ensure that you update the reference in your component file import.

If you do want to use `.scss` files, in order to make those work - assuming you use webpack - you will also need to install `style-loader`, `css-loader`, `sass-loader`, `node-sass`, and `webpack`, as well as configure your webpack (which will require you to eject if you're using CRA). Details on how to do so can be found [here](https://github.com/webpack-contrib/sass-loader).

The test file assumes that you're using Jest and Enzyme for your testing needs.

Note: the scripts are bash scripts and may not run on Windows machines. If that is the case, please use Git Bash.

## Install

```sh
npm install -g create-reactjs-component
```

## Example

```sh
create-react-component MyComponentName
```
or to specify a specific type of component
```sh
create-react-component --template container MyComponentName
```

will create

```
src
├── components
	├── Test
		├── index.js
		├── Test.js
		├── Test.test.js
		├── Test.scss
		├── README.md
```

where the individual files look like the following:

`index.js`

```javascript
import Test from './Test';

export default Test;
```

`Test.scss`

```css
/* todo: delete file if not needed */
```

`Test.js`

```javascript
import React from 'react';
import PropTypes from 'prop-types';
import styles from './Test.scss';

const Test = props => (
	<div>This is a component called Test.</div>
);

// todo: Unless you need to use lifecycle methods or local state,
// write your component in functional form as above and delete
// this section. 
// class Test extends React.Component {
//   render() {
//     return <div>This is a component called Test.</div>;
//   }
// }

const TestPropTypes = {
	// always use prop types!
};

Test.propTypes = TestPropTypes;

export default Test;
```

`Test.test.js`

```javascript
import React from 'react';
import { shallow, render, mount } from 'enzyme';
import Test from './Test';

describe('Test', () => {
  let props;
  let shallowTest;
  let renderedTest;
  let mountedTest;

  const shallowTestComponent = () => {
    if (!shallowTest) {
      shallowTest = shallow(
        <Test {...props}>{props.children}</Test>
      );
    }
    return shallowTest;
  };

  const renderTestComponent = () => {
    if (!renderedTest) {
      renderedTest = render(
        <Test {...props}>{props.children}</Test>
      );
    }
    return renderedTest;
  };

  const mountTestComponent = () => {
    if (!mountedTest) {
      mountedTest = render(
        <Test {...props}>{props.children}</Test>
      );
    }
    return mountedTest;
  };  

  beforeEach(() => {
    props = {};
    shallowTest = undefined;
    renderedTest = undefined;
    mountedTest = undefined;
  });

  // Shallow / unit tests begin here
 
  // Render / mount / integration tests begin here
});
```

## License

MIT © Haldun Anil
