var spawn = require('child_process').spawn;

var args = ["-w", "640", "-h", "480", "-o", "./stream/image_stream_test2.jpg", "-t", "999999999", "-tl", "100"];
var  proc = spawn('raspistill', args);
proc.on('close', (code) => {
  console.log(`child process exited with code ${code}`);
});
