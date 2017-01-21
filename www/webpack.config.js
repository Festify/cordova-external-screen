var webpack = require('webpack');

module.exports = {
    entry: './cordova-external-screen.js',
    output: {
        path: __dirname,
        filename: 'build/cordova-external-screen.js',
        library: 'externalScreen',
        libraryTarget: 'commonjs'
    },
    module : {
        externals: [
            "cordova",
            "cordova/exec"
        ],
        loaders: [{
            test: /.js$/,
            exclude: /node_modules/,
            loader: 'babel-loader'
        }]
    },
    plugins: [
        new webpack.optimize.UglifyJsPlugin()
    ]
};
