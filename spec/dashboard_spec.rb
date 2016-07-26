require "spec_helper"
require "dashboard"

describe Dashboard do
  describe "#posts" do
    it "returns posts created today" do
      posts = double("todays_posts")
      allow(Dashboard).to receive("todays_posts").and_return(posts)
      dashboard = Dashboard.new(posts: posts)

      result = dashboard.todays_posts

      expect(result).to eq(posts)
    end
  end

  around do |example|
    Timecop.freeze { example.run }
  end
end
