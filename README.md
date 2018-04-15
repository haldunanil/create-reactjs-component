Generate one or multiple boilerplate components within `src` with the following files:

```
src
├── components
	├── <ComponentName>
		├── index.js
		├── <ComponentName>.js
		├── <ComponentName>.css
```

Note: the scripts are bash scripts and may not run on Windows machines. If that is the case, use Git Bash.

# Install

```
npm install -g create-reactjs-component
```

# Example

```
create-reactjs-component Test
```

will create

```
src
├── components
	├── Test
		├── index.js
		├── Test.js
		├── Test.css
```

where the individual files look like the following:

`index.js`

```
import Test from './Test';

export default Test;
```

`Test.css`

```
# empty
```

`Test.js`

```
import React, { Component } from 'react';
import './Test.css';

class Test extends Component {
  render() {
    return <div>This is a component called Test.</div>;
  }
}

export default Test;
```

# License

MIT © Haldun Anil