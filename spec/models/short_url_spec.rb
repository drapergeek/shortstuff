require 'spec_helper'

describe ShortUrl do
  describe "#save" do
    context 'when there is not an entry with that name' do
      it "returns false" do
        shorturl = ShortUrl.new(name: "myname", url: "myurl").save
        shorturl = ShortUrl.new(name: "myname", url: "http://www.google.com")
        expect(shorturl.save).to be_false
      end
    end

    context 'when there is not an entry with that name' do
      it 'returns true' do
        shorturl = ShortUrl.new(name: "myname", url: "myurl")
        expect(shorturl.save).to be_true
      end
    end

    it "will set the url and name properly" do
      shorturl = ShortUrl.new(name: "myname", url: "myurl")
      expect(shorturl.name).to eq("myname")
      expect(shorturl.url).to eq("myurl")
    end
  end

  describe "#full_url" do
    it "returns the full path to the short url" do
      shorturl = ShortUrl.new(name: 'mypage', url: 'http://www.url.com')
      expect(shorturl.full_url).to eq('http://example.com/mypage')
    end
  end
end
