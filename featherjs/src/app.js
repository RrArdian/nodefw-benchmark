const feathers = require('@feathersjs/feathers');
const configuration = require('@feathersjs/configuration');
const express = require('@feathersjs/express');

const appHooks = require('./app.hooks');

const app = express(feathers());

// Load app configuration
app.configure(configuration());
app.use('/', function(req, res) {
  res.send('Hello world!');
});

// Set up Plugins and providers
app.configure(express.rest());

app.hooks(appHooks);

module.exports = app;
