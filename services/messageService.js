const Nexmo = require('nexmo');

const nexmo = new Nexmo({
  apiKey: '736a402e',
  apiSecret: '3qrT7e7YyNNRxBle',
});

const from = '12262101786';
const to = '12269197946';
const text = 'Hello from Nexmo';
// nexmo.message.sendSms(from, to, text);

module.exports = function(message, to) {
	nexmo.message.sendSms(from, to, message);
}