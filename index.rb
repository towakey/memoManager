require 'cgi'

cgi = CGI.new "html5"

cgi.out do
    cgi.html do
        cgi.head {
            cgi.title {"memoManager"}
        } +
        cgi.body {
            cgi.h1 {"memoManager"} +
            cgi.hr
        }
    end
end