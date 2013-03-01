var gui = require('nw.gui');
var ps = require('./lib/ps');
var photoshop;

var content;
var title;
var unfreezebtn;

function init() {
  var links = document.getElementsByClassName('external');
  for (var i in links) {
    var link = links[i];
    link.onclick = function() {
      gui.Shell.openExternal(this.href);
      return false;
    };
  }
  content = document.getElementById('content');
  title = document.getElementById('title');
  unfreezebtn = document.getElementById('unfreezebtn');
  unfreezebtn.onclick = unfreeze;

  var refresh = document.getElementById('refresh');
  refresh.onclick = run;
  run();
}

window.addEventListener('load', init);

function run() {
  unfreezebtn.style.visibility = 'hidden';
  photoshop = null;
  title.innerHTML = 'loading';
  content.innerHTML = 'looking for running photoshop...';

  ps(function(err, processes) {
    if (err) {
      console.error(err.message);
      title.innerHTML = 'failed';
      content.innerHTML = 'couldn\'t look up running processes';
      return;
    }

    // check ps for photoshop
    processes.forEach(function(proc) {
      if (proc.args.indexOf('/Applications/Adobe Photoshop') !== 0) return;
      if (proc.args.indexOf('/Contents/MacOS/Adobe Photoshop') === -1) return;
      photoshop = proc;
    });

    // photoshop not found
    if (!photoshop) {
      title.innerHTML = 'not found';
      content.innerHTML = 'photoshop is not running';
      return;
    }

    // found! let's continue it
    title.innerHTML = 'photoshop found';
    content.innerHTML = 'pid: ' + photoshop.pid + '<br />' + photoshop.args + '<br /><br />';
    unfreezebtn.style.visibility = 'visible';
  });
}

function unfreeze() {
  if (!photoshop) return;
  console.log('sending SIGCONT to pid ' + photoshop.pid);
  process.kill(photoshop.pid, 'SIGCONT');
  alert('attempting to unfreeze pid ' + photoshop.pid);
}
