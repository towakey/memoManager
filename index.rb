require 'cgi'
require 'json'

hash = File.open('./memo.json') do |file|
    JSON.load(file)
end

cgi = CGI.new "html5"

cgi.out do
    cgi.html do
        cgi.head {
            cgi.title {"memoManager"}
        } +
        cgi.body {
            cgi.h1 {"memoManager"} +
            cgi.hr +
            cgi.p {hash["contents"]}
        }
    end
end