def fixture_for(fixture)
  Rails.root.join('spec', 'fixtures', "#{fixture}").read
end
