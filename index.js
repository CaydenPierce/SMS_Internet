const messageService = require("./services/messageService");
const batchService = require("./services/batchService");
const api = require("./api");

async function command() {
	var out = await batchService("cd node_modules");
	var out2 = await batchService("ls");
	console.log(out2);

};

command();


