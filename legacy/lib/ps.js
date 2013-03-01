var exec = require('child_process').exec;

var strsplit = require('strsplit');

var command = 'ps ax -o pid,state,command';

module.exports = ps;

function ps(cb) {
  exec(command, function(err, out, code) {
    if (err) return cb(new Error(err));
    if (code) return cb(new Error('code was ' + code));

    var processes = [];
    var lines = out.split('\n');
    lines.forEach(function(line) {
      if (!line) return;
      var s = strsplit(line.trim(), undefined, 3);
      var p = {
        pid: s[0],
        state: s[1],
        args: s[2]
      };
      processes.push(p);
    });

    cb(null, processes);
  });
}
