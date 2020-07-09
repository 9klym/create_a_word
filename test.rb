require 'net/http'
require 'cgi'
require 'addressable/uri'
url = "https://ru.wiktionary.org/wiki/собака"

puts CGI.escape(url)

puts Addressable::URI.escape(url)
# puts URI.escape(url)
# file =Net::HTTP.get(URI.parse(CGI.encode(url))).force_encoding('UTF-8')

# CGI.pretty(file)
