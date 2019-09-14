const util = require('util');
const exec = util.promisify(require('child_process').exec);

async function runBatchCommand(command) {
	const { stdout, stderr } = await exec(command);
	return stdout;
}


module.exports = runBatchCommand;