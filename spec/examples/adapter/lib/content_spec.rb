require './examples/adapter/lib/newsletter/content'
require './examples/adapter/lib/newsletter/adapters/xml'
require './examples/adapter/lib/newsletter/adapters/json'

describe Newsletter::Content do
  describe 'parsing content from JSON' do
    before do
      @json = fixture('newsletter.json').read
      @content = described_class.parse(@json, :json)
    end

    it 'parses the title' do
      expect(@content.title).to eq('Hello World!')
    end

    it 'parses the body' do
      expect(@content.body).to eq('lorem ipsum')
    end
  end

  describe 'parsing content from an XML file' do
    before do
      @xml = fixture('newsletter.xml').read
      @content = described_class.parse(@xml, :xml)
    end

    it 'parses the title' do
      expect(@content.title).to eq('Hello World!')
    end

    it 'parses the body' do
      expect(@content.body).to eq('lorem ipsum')
    end
  end
end
