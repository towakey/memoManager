require 'bundler/setup'
require 'cgi'
require 'json'
require 'redcarpet'
require 'redcarpet/render_strip'

url = "memo.json"
hash = File.open(url) do |file|
    JSON.load(file)
end

markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML,
    autolink: true,
    tables: true,
    fenced_code_blocks: true,
    highlight: true
)

html = markdown.render(hash["contents"])

cgi = CGI.new "html5"

cgi.out do
    cgi.html do
        cgi.head {
            cgi.title {"memoManager"}
        } +
        cgi.body {
            "<a href='edit?json=#{url}'>EDIT</a>" +
            cgi.hr +
            # cgi.p {hash["contents"]}
            cgi.p {html}
        }
    end
end