require 'rspec/expectations'

RSpec::Matchers.define :make_pdf_file do |expected|
  match do |actual|
    File.exists?(expected)
  end
end
