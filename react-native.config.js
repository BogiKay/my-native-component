const path = require('path');

module.exports = {
  dependencies: {
    'custom-switch-package': {
      root: path.resolve(__dirname, './custom-switch-package'),
    },
  },
};