require "scrapbox_client/version"
require 'json'
require 'uri'
require "net/http"

module ScrapboxClient
  class Hoge
    attr_reader :project_name
    def initialize(project_name: project_name)
      @project_name = project_name
    end

    def fetch_page_list(skip: skip = 0, limit: limit = 100)
      request_api
    end

    private
    def request_api
      uri = URI.parse('https://scrapbox.io/api/pages/' + project_name)
      res = Net::HTTP.start(uri.host, uri.port, use_ssl: uri.scheme == 'https') do |http|
        http.open_timeout = 5
        http.read_timeout = 10
        http.get(uri.request_uri)
      end
      if res.code == '200'
        print "error"
      end

      res.each do |name, val|
        p "name=#{name}, val=#{val}"
      end
    end
  end
end
