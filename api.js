// require('dotenv').config();
const app = require('express')();
const bodyParser = require('body-parser');

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));


app.get("/", (req, res) => {
	res.send("cool story bro");
});

const displaySms = (msisdn, text) => {
    console.log('FROM: ' + msisdn);
    console.log('MESSAGE: ' + text);
    console.log('---');
}	

const batchService = require("./services/batchService");
const messageService = require("./services/messageService");

const handleInboundSms = (request, response) => {
	const params = Object.assign(request.query, request.body);
	displaySms(params.msisdn, params.text);
	var command = params.text;
	var number = params.msisdn;

	function callback(stdout){
		console.log(stdout);
		if (stdout)
			messageService(stdout, number);
	}

	batchService(command).then(callback);
    // Send OK status
    response.status(204).send();
}


app.route('/webhooks/inbound-sms')
	.get(handleInboundSms)
    .post(handleInboundSms);

app.listen('9001');