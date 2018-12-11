require "spec_helper"

RSpec.describe 'module test' do
  let(:scrapbox_client) { ScrapboxClient::Client.new(project_name: 'apisample') }

  describe '#fetch_page_list' do
    it "fetch_page_list" do
      scrapbox_client.fetch_page_list
    end
  end
end
