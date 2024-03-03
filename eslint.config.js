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
		'curly': ['error', 'multi', 'consistent'],
		'style/brace-style': ['error', '1tbs', { allowSingleLine: true }],
		'jsonc/comma-dangle': ['error', 'always-multiline'],
	},
	// vue: {
	// 	overrides: {
	// 	},
	// },
});
