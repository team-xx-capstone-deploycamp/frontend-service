module.exports = {
  root: true,
  env: {
    node: true
  },
  plugins: [
    'security',
    'sonarjs'
  ],
  extends: [
    'plugin:vue/vue3-essential',
    'eslint:recommended',
    'plugin:security/recommended',
    'plugin:sonarjs/recommended'
  ],
  parserOptions: {
    parser: '@babel/eslint-parser',
    requireConfigFile: false
  },
  rules: {
    'no-console': 'off',
    'no-debugger': 'off'
  }
}
