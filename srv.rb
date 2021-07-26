require 'bundler/setup'
require 'webrick'

srv = WEBrick::HTTPServer.new({
    DocumentRoot:   './',
    BindAddress:    '0.0.0.0',
    Port:           3000,
    CGIInterpreter: WEBrick::HTTPServlet::CGIHandler::Ruby
})

# srv.mount('/', WEBrick::HTTPServlet::FileHandler, 'index.html')
srv.mount('/', WEBrick::HTTPServlet::CGIHandler, 'index.rb')

srv.start
