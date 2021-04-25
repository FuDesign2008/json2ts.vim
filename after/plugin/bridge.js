const json2ts = require("json2ts");
const clipboardy = require("clipboardy");

const text = clipboardy.readSync();
let result = "";
let isValidJSON = true;

try {
  result = json2ts.convert(text);
} catch (ex) {
  isValidJSON = false;
}

console.log(`isValidJSON=${isValidJSON}`);
console.log(result);
