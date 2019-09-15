const execSync = require('child_process').execSync;
facebook = require("./services/facebookService");
const process = require('process');

const args = process.argv;
var id1 = args[2];

function friendsList(fbid) {
	cmd = "curl -i -X GET  \"https://graph.facebook.com/v4.0/${fbid}/friends\""
	const stdout = execSync(cmd, { encoding: 'utf-8' });  // the default is 'buffer'
	console.log(stdout);
}

//main

function getFacebookFriends(id) { //find frineds of somones
	function facebookCallback(req, res){

		var info = JSON.parse(req);
		var i = 0;
		var len = info.data.length;
		for (; i < len; i++) {
			console.log(info.data[i]['name']);
		}
	}
	const auth = "EAAHvXA9ZBZB6cBAAvoPrsKAC5DThOSb6kKR1w3rZA4tBWzpZAUDdrhSINjaU2OeNlKpUZCp5dmq7akZApTdgczwGyfmSaqvt2dX3JLXAK3dWDHpSBNXWPbqLC9c4ZAoVZCEQdPWCoYSeVGIvro06QS1HKwMfyMgp9bnOb06lqZAeZAZABjsztIYu5apUTOqzC9HfmXCrjvKGTc2CUqqxLyN6Qz1UsaZAUWsOslQZD"; //Cayden
	facebook.getFbData(auth, '/v4.0/'+id+'/friends', facebookCallback);
}

getFacebookFriends(id1); //get friends list
