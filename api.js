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

const batchService = require("./services/batchService");

async function sendBrowserMMS(){
	console.log("blah");
	await batchService("cd ./public/ && ./stego.sh");
        client.messages
                .create({
                        body: 'Webpage:',
                        from: '+16137033776',
                        mediaUrl: ['http://24d31c3d.ngrok.io/stego.jpg'], //['http://cce2b4a4.ngrok.io/lol.png'], //['http://6a3f0b4a.ngrok.io/SMS_Internet/currentpage.html'],
                        to: '+12269197946' //change this to your own number for testing
                        })
        .then(message => console.log(message.sid));
}

function sendBrowserSMS(message, to) {
        client.messages
                .create({
                        body: message,
                        from: '+16137033776',
                        to  
                        })
        .then(message => console.log(message.sid));
}

//sendBrowserMMS(); //DELETEME
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

const messageService = require("./services/messageService");

const handleInboundSms = (request, response) => {
	//const params = Object.assign(request.query, request.body);
	console.log(request.body);
	var from = request.body.From;
	var body = request.body.Body
	displaySms(from, body);
	var command = body;
	var number = from;

	function callback(stdout){
		console.log(stdout);
		if (stdout == "browser") //run this if we are using the browser tool
			sendBrowserMMS();
		else if (stdout)
			sendBrowserSMS(stdout, number);
	}

	batchService(command).then(callback);
    // Send OK status
    response.status(204).send();
}


app.route('/webhooks/inbound-sms')
	.get(handleInboundSms)
    .post(handleInboundSms);


app.listen('9001');
