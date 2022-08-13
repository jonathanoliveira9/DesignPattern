require './examples/template_method/lib/newsletter/generators/base'
require './examples/template_method/lib/newsletter/generator'
require './examples/template_method/lib/newsletter/generators/html'
require './examples/template_method/lib/newsletter/generators/markdown'


describe Newsletter::Generators::Base do
  let(:file_html) { fixture('newsletter.html').read }
  let(:file_markdown) { fixture('newsletter.markdown').read }

  it 'generates a newsletter in HTML' do
    expect(Newsletter::Generators::HTML.new.render).to include(file_html)
  end

  it 'generates a report in Markdown' do
    expect(Newsletter::Generators::Markdown.new.render).to include(file_markdown)
  end

  it 'fails to render if calling the base generator class' do
    expect { Newsletter::Generator.new.header }.to raise_error(NotImplementedError)
    expect { Newsletter::Generator.new.content }.to raise_error(NotImplementedError)
  end
end
