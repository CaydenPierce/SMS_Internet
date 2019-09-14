// Download the helper library from https://www.twilio.com/docs/node/install
// Your Account Sid and Auth Token from twilio.com/console
// DANGER! This is insecure. See http://twil.io/secure
const accountSid = 'AC79d0d0aed5450b17d96576211837e35d' //'AC79d0d0aed5450b17d96576211837e35d';
const authToken = 'afc2ec64ed6bcfade503399dcbf585fd';
const client = require('twilio')(accountSid, authToken);

// require('dotenv').config();
const express = require('express');
const app = express();
const bodyParser = require('body-parser');

var staticRoute = express.static("public");
app.use(staticRoute);

function sendBrowserMMS(){
	console.log("blah");
        client.messages
                .create({
                        body: 'Webpage: asdd',
                        from: '+16137033776',
                        mediaUrl: ['http://24d31c3d.ngrok.io/SMS_Internet/currentpage.html.png'], //['http://cce2b4a4.ngrok.io/lol.png'], //['http://6a3f0b4a.ngrok.io/SMS_Internet/currentpage.html'],
                        to: '+12269197946' //change this to your own number for testing
                        })
        .then(message => console.log(message.sid));
}
sendBrowserMMS(); //DELETEME
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
		if (stdout == "browser") //run this if we are using the browser tool
			sendBrowserMMS();
		else if (stdout)
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
