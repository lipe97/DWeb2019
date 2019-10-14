var http =require ('http');
var fs = require ('fs');

http.createServer(function (Req, res){

    var split = Req.url.split('/');
    var pag = split[split.length - 1 ];
    if(!pag.match(/favicon.ico/)) {
    fs.readFile('arqueo/arq' + pag + '.xml', (err, data) => {

        if(err) throw err;

            res.writeHead(200, {'Content-Type' : 'text/xml'});

        res.write(data);

        res.end();
        
    });
}}).listen(7777);
console.log('servidor a escuta na porta 7777')