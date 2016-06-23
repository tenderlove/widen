# -*- ruby -*-

require 'rubygems'
require 'hoe'

Hoe.plugins.delete :rubyforge
Hoe.plugin :minitest
Hoe.plugin :gemspec # `gem install hoe-gemspec`
Hoe.plugin :git     # `gem install hoe-git`

Hoe.spec 'widen' do
  developer('Aaron Patterson', 'tenderlove@ruby-lang.org')
  self.readme_file   = 'README.md'
  self.history_file  = 'CHANGELOG.md'
  self.extra_rdoc_files  = FileList['*.rdoc']
  license 'MIT'
end

def parse list
  list.map { |from,_,_,_,_,size| [from.to_i(16), size[/[0-9A-F]*$/].to_i(16)] }
end

file 'lib/widen.rb' do |t|
  require 'erb'
  narrows, wides = File.open 'UnicodeData.txt', 'r' do |f|
    f.each_line.map do |line|
      if line =~ /^FF01/ .. line =~ /^FFEE/
        line.split(';')
      end
    end.compact.partition { |row| row[5] =~ /narrow/ }
  end

  small_to_big = parse(narrows) + parse(wides).map(&:reverse)
  narrow = small_to_big.map(&:first).pack('U*').gsub(/\\/, "\\\\\\\\")
  wide   = small_to_big.map(&:last).pack 'U*'
  File.write 'lib/widen.rb', ERB.new(File.read('lib/widen.rb.erb')).result(binding)
end

# vim: syntax=ruby
