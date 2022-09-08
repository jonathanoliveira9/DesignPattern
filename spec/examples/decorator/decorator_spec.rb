require './examples/decorator/lib/product'

describe Product do
  let(:product) { Product.new("Tomato", :fruit, %w(red salad sour)) }
  let(:expected_result) { <<EOF
    <tr>
      <th>Tomato</th>
      <td>fruit</td>
      <td>
        <ul>
          <li>red</li>
          <li>salad</li>
          <li>sour</li>
        </ul>
      </td>
    </tr>
EOF
}

  it 'can be printed as a HTML table row' do
    product_decorator = ProductDecorator.new product
    as_html_row_row = product_decorator.as_html_row.strip.gsub(/(^\s+)|\n/, '')
    expect(as_html_row_row).to eq(expected_result.strip.gsub(/(^\s+)|\n/, ''))
  end
end
