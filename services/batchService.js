const util = require('util');
const exec = util.promisify(require('child_process').exec);

async function ls() {
  const { stdout, stderr } = await exec('ls');
  console.log('stdout:');
  console.log(stdout);
  console.log('stderr:', stderr);
}

async function runBatchCommand(command) {
	const { stdout, stderr } = await exec(command);
}



module.exports = runBatchCommand;