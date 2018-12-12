require "scrapbox_client/version"
require 'json'
require 'uri'
require "net/http"

module ScrapboxClient
  class Client
    attr_reader :project_name

    BASE_URI_V1 = "https://scrapbox.io"
    URI_RESOURCE_MAP = {
      page_list: "/api/pages/%{project_name}?skip=%{skip}&limit=%{limit}",
      page: "/api/pages/%{project_name}/%{page_title}",
      page_body: "/api/pages/%{project_name}/%{page_title}/text",
      page_image: "/api/pages/%{project_name}/%{page_title}/icon",
    }

    def initialize(project_name:)
      @project_name = project_name
    end

    def fetch_page_list(skip: skip = 0, limit: limit = 100)
      params = {
        project_name: project_name,
        skip: skip,
        limit: limit,
      }
      res = request_api(resource: URI_RESOURCE_MAP[:page_list], params: params)

      return res
    end

    def fetch_page(page_title:)
      return unless page_title
      params = {
        project_name: project_name,
        page_title: page_title,
      }
      res = request_api(resource: URI_RESOURCE_MAP[:page], params: params)

      return res
    end

    def fetch_page_body(page_title:)
      return unless page_title
      params = {
        project_name: project_name,
        page_title: page_title,
      }
      res = request_api(resource: URI_RESOURCE_MAP[:page_body], params: params)

      return res
    end

    def fetch_page_image(page_title:)
      return unless page_title
      params = {
        project_name: project_name,
        page_title: page_title,
      }
      res = request_api(resource: URI_RESOURCE_MAP[:page_image], params: params)

      return res
    end

    private
    def request_api(resource:, params:)
      uri = URI.parse(BASE_URI_V1 + sprintf(resource, params))
      res = Net::HTTP.start(uri.host, uri.port, use_ssl: uri.scheme == 'https') do |http|
        http.open_timeout = 5
        http.read_timeout = 10
        http.get(uri.request_uri)
      end
      unless res.code == '200' || res.code == '302'
        raise "request failed with status code " + res.code
      end

      return res
    end
  end
end
