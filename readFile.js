fs = require('fs')
fs.readFile('config', 'utf8', function (err,data) {
  if (err) {
    return console.log(err);
  }
  console.log(data);
});
