require "spec_helper"

RSpec.describe "module test" do
#  let(:scrapbox_client) { ScrapboxClient::Client.new(project_name: "apisampl") }

  describe "#fetch_page_list" do
    subject(:success_fetch_page_list) { ScrapboxClient::Client.new(project_name: "apisample").fetch_page_list }
    it "request success" do
      expect(success_fetch_page_list.code).to eq "200"
    end
  end

  describe "#page" do
    subject(:success_fetch_page) { ScrapboxClient::Client.new(project_name: "apisample").fetch_page(page_title: "api_sample_title") }
    it "request success" do
      expect(success_fetch_page.code).to eq "200"
    end
  end

  describe "#page_body" do
    subject(:success_fetch_page_body) { ScrapboxClient::Client.new(project_name: "apisample").fetch_page_body(page_title: "api_sample_title") }
    it "request success" do
      expect(success_fetch_page_body.code).to eq "200"
    end
  end

  describe "#page_image" do
    subject(:success_fetch_page_image) { ScrapboxClient::Client.new(project_name: "apisample").fetch_page_image(page_title: "api_sample_title") }
    it "request success" do
      expect(success_fetch_page_image.code).to eq "302"
    end
  end
end
