const fs = require('fs');
const pdf = require('pdf-parse');

let dataBuffer = fs.readFileSync('C:/Users/acer/Downloads/Sathish_Full_Stack_developer_20260629_182754_0000.pdf');

console.log(typeof pdf, Object.keys(pdf));
if (typeof pdf === 'function') {
    pdf(dataBuffer).then(function(data) {
        console.log(data.text);
    }).catch(console.error);
}
