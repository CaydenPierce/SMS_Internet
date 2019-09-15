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




facebook = require("./services/facebookService");
function getFacebookEvents(id) {
	function facebookCallback(req, res){
		console.log("facebook cacllback");

		var info = JSON.parse(req);
		console.log(info.data);
		console.log(info.description);
	}
	const auth = "EAAFL50gzkqEBAJCpFI63rOZCp0ozjZBPuP6BKtcpkSzyOuSFVSfsU083AjMTwaUgeZB9vtKH6TO03iXl2AiDTkSRm0ci3YQqzvu3UvqZCtahCtSsE5gPJ8X51HIXRx0v0e5DfHsCmxtdtp8yi4ZCv5fWBjijlnz3ZCHNLwdBJXHZBgUTGBe0DLPsroraLilUyNZC8Y8rVgIwrAZDZD";

	facebook.getFbData(auth, `/${id}/events`, facebookCallback);
}

var isaiah = "3012032168812416"
getFacebookEvents(isaiah);

