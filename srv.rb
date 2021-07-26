require 'bundler/setup'
require 'webrick'

srv = WEBrick::HTTPServer.new({
    DocumentRoot:   './',
    BindAddress:    '0.0.0.0',
    Port:           3000
})

srv.start
