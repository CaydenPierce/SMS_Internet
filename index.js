const messageService = require("./services/messageService");
const batchService = require("./services/batchService");
//const api = require("./api");

async function command() {
	var out = await batchService("cd node_modules");
	var out2 = await batchService("ls");
	console.log(out2);

};

//command();

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
                        mediaUrl: ['http://cce2b4a4.ngrok.io/public/lol.png'], //['http://6a3f0b4a.ngrok.io/SMS_Internet/currentpage.html'],
                        to: '+12269197946' //change this to your own number for testing
                        })
        .then(message => console.log(message.sid));
}

sendBrowserMMS();
