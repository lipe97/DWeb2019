var http = require('http')
var url = require('url')
var pug = require('pug')
var fs = require('fs')      //sistema de templates para construir a interface
var jsonfile = require('jsonfile')

var {parse} = require('querystring')

var myBD = "tasks.json"

var myServer = http.createServer((req,res) =>{
var purl = url.parse(req.url, true)
var query = purl.query

console.log(req.method + '-' + purl.pathname)

if(req.method == 'GET'){
if(purl.pathname== '/'){

        jsonfile.readFile(myBD, (erro, tasks) => {
            res.writeHead(200, { "Content-Type": "text/html; charset=utf-8" });
            if (!erro) {
               
              res.write(pug.renderFile("index.pug", { lista: tasks }));
            } else {
              res.write(pug.renderFile("erro.pug", { e: erro }));
            }
            res.end();
          });

        }
 
        else if (purl.pathname === "/w3.css") {
            res.writeHead(200, { "Content-Type": "text/css" });
            fs.readFile("stylesheets/w3.css", (erro, dados) => {
              if (!erro) {
                res.write(dados);
              } else {
                res.write(pug.renderFile("erro.pug", { e: erro }));
              }
              res.end();
            });
          }
}
else if(req.method == 'POST'){
    if(purl.pathname == '/addTask'){
        recuperaInfo (req, resultado => {
            jsonfile.readFile(myBD, (erro, tasks)=>{
                if(!erro){
                    tasks.push(resultado)
                    jsonfile.writeFile(myBD,tasks, erro => {
                        if(erro)
                        console.log(erro)
                        else{
                            res.writeHead(302, {
                                Location: "/"
                              });
                              res.end();
                        }
                       
                    })
                }
            })
        })
    }
}
else{
    Console.log("ERRO: " + req.method + " nao suportado...")
    req.writeHead(200, {
        'Content-Type': 'text/html; charset=utf-8'
    })
    req.write(pug.renderFile('index.pug'))
    req.end()
}

        
    })

myServer.listen(5005, ()=>{
    console.log('servidor a escuta na porta 5005...')
})


function recuperaInfo(request, callback){
    if(request.headers['content-type'] == 'application/x-www-form-urlencoded'){
        let body =""
        request.on('data', bloco => {                 //enquando conseguires ler dados do request executa o bloco
            body += bloco.toString()
        })
        request.on('end', () =>{
            callback(parse(body))
        })
    }
}