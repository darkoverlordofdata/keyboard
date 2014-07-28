require('coffee-script');
var huginn = require('huginn');
huginn.serve(['--port', process.env.PORT]);