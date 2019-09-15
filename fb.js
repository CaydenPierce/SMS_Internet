facebook = require("./services/facebookService");
var id = process.argv.slice[2];

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

// var isaiah = "3012032168812416"
getFacebookEvents(id);