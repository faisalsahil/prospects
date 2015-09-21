shared_examples 'an event decorator' do
  it 'has a header' do
    decorator.header.should be
  end

  it 'has an enumerable body' do
    expect(decorator.body).to respond_to(:each)
  end
end
