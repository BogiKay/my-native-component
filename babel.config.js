module.exports = {
  presets: ['module:@react-native/babel-preset'],
  plugins: [
       [
         'module-resolver',
         {
           root: [ './' ],
           extensions: [
             '.ios.js',
             '.ios.ts',
             '.ios.tsx',
             '.android.js',
             '.android.ts',
             '.android.tsx',
             '.js',
             '.ts',
             '.tsx',
             '.json',
           ],
         "alias": {
          'custom-switch-package': "./custom-switch-package"
         },
        }
       ],
     [
        '@babel/plugin-transform-react-jsx',
        {
          runtime: 'automatic',
        },
      ],
    ],

};
