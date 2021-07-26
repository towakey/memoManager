require 'cgi'
require 'json'

url = "memo.json"
hash = File.open(url) do |file|
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
            # cgi.a({href: "edit?json=#{url}"}) +
            cgi.hr +
            cgi.p {hash["contents"]}
        }
    end
end