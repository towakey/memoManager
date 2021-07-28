require 'cgi'
require 'json'

cgi = CGI.new "html5"

url = cgi['json']
hash = File.open(url) do |file|
    JSON.load(file)
end

cgi.out do
    cgi.html do
        cgi.head {
            cgi.title {"EDIT"}
        } +
        cgi.body {
            cgi.h1 {"EDIT[" + url + "]"} +
            cgi.hr +
            cgi.p {hash["contents"]}
        }
    end
end
