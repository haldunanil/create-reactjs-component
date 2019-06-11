echo "import React from 'react';
import PropTypes from 'prop-types';
import {connect} from 'react-redux';

import styles from './$1.scss';

const $1 = props => (
	<div>This is a component called $1.</div>
);

// todo: Unless you need to use lifecycle methods or local state,
// write your component in functional form as above and delete
// this section. 
// class $1 extends React.Component {
//   render() {
//     return <div>This is a component called $1.</div>;
//   }
// }

$1.propTypes = {
	// always use prop types!
};

const mapStateToProps = (state) => {
	return {
		// prop: state.path.to.value,
	};
};

const mapDispatchToProps = (dispatch) => {
	return {
		// prop: () => dispatch(action),
		onChangeObjectClass: (new_class) => dispatch(objectClassChangeHandler(new_class)),
	};
};

export default connect(mapStateToProps, mapDispatchToProps)($1);" > src/components/$1/$1.js
