require "spec_helper"

RSpec.describe "module test" do
#  let(:scrapbox_client) { ScrapboxClient::Client.new(project_name: "apisampl") }

  describe "#fetch_page_list" do
    subject(:success_fetch_page_list) { ScrapboxClient::Client.new(project_name: "apisample").fetch_page_list }
    it "request success" do
      expect(success_fetch_page_list.code).to eq "200"
    end
  end
end
