import antfu from '@antfu/eslint-config';

export default antfu({
	stylistic: {
		indent: 'tab',
		quotes: 'single',
		semi: true,
	},
	rules: {
		'import/order': 'off',
		'indent': ['error', 'tab'],
	},
	// vue: {
	// 	overrides: {
	// 	},
	// },
});
