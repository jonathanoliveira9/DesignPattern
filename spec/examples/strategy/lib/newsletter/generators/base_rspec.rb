require './examples/strategy/lib/newsletter/generators/base'
require './examples/strategy/lib/newsletter/generator'
require './examples/strategy/lib/newsletter/generators/html'
require './examples/strategy/lib/newsletter/generators/markdown'

describe Newsletter::Generators::Base do
  let(:file_html) { fixture('newsletter.html').read }
  let(:file_markdown) { fixture('newsletter.markdown').read }

  it 'generates a newsletter in HTML' do
    expect(Newsletter::Generators::Base.new(:html).render).to include(file_html)
  end

  it 'generates a report in Markdown' do
    expect(Newsletter::Generators::Base.new(:markdown).render).to include(file_markdown)
  end

  xit 'fails to render if calling the base generator class' do
    expect { Newsletter::Generator.new.header }.to raise_error(NotImplementedError)
    expect { Newsletter::Generator.new.content }.to raise_error(NotImplementedError)
  end
end
