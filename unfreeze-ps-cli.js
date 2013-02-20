var ps = require('./lib/ps');

ps(function(err, processes) {
  if (err) {
    console.error(err.message);
    process.exit(1);
  }

  // check ps for photoshop
  var photoshop;
  processes.forEach(function(process) {
    if (process.args.indexOf('/Applications/Adobe Photoshop') !== 0) return;
    if (process.args.indexOf('/Contents/MacOS/Adobe Photoshop') === -1) return;
    photoshop = process;
  });

  // photoshop not found
  if (!photoshop) {
    console.log('photoshop not found');
    process.exit(2);
  }

  // found! let's continue it
  console.log('photoshop found');
  console.log(photoshop);
  process.kill(process.pid, 'SIGCONT');
});
