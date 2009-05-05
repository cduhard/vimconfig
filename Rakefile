require 'rake'
require 'rake/contrib/sshpublisher'

files = ['autoload/rails.vim', 'plugin/rails.vim', 'doc/rails.txt']

desc "Make zip file"
file 'rails.zip' => files do |t|
  File.unlink t.name if File.exists?(t.name)
  system('zip','-q',t.name,*t.prerequisites)
end

desc "Make vimball"
file 'rails.vba' => files do |t|
  File.unlink t.name if File.exists?(t.name)
  File.open(t.name,"w") do |out|
    out.puts '" Vimball Archiver by Charles E. Campbell, Jr., Ph.D.'
    out.puts 'UseVimball'
    out.puts 'finish'
    t.prerequisites.each do |name|
      File.open(name) do |file|
        file.each_line {}
        out.puts name
        out.puts file.lineno
        file.rewind
        file.each_line {|l|out.puts l}
      end
    end

def gemspec
  Gem::Specification.new do |s|
    s.name                  = PACKAGE_NAME
    s.version               = PACKAGE_VERSION
    s.files                 = RELEASE_FILES.to_a
    s.summary               = "Ruby configuration files for Vim.  Run 'vim-ruby-install.rb' to complete installation."
    s.description           = s.summary + "\n\nThis package doesn't contain a Ruby library."
    s.requirements          << 'RubyGems 0.8+' << 'Vim 6.0+'
    s.required_ruby_version = '>= 1.8.0'
    s.require_path          = '.'
    s.bindir                = 'bin'
    s.executables           = ['vim-ruby-install.rb']
    s.author                = 'Gavin Sinclair et al.'
    s.email                 = 'gsinclair@soyabean.com.au'
    s.homepage              = 'http://vim-ruby.rubyforge.org'
    s.rubyforge_project     = 'vim-ruby'
    s.has_rdoc              = false
  end
end

task :publish => [:zip,:vimball] do
  Rake::SshFilePublisher.new("tpope.net","/var/www/railsvim",".","rails.zip","rails.vba").upload
end

desc "Install"
task :install do
  vimfiles = if ENV['VIMFILES']
               ENV['VIMFILES']
             elsif RUBY_PLATFORM =~ /(win|w)32$/
               File.expand_path("~/vimfiles")
             else
               File.expand_path("~/.vim")
             end

  puts "Installing rails.vim"
  files.each do |file|
    target_file = File.join(vimfiles, file)
    FileUtils.mkdir_p(File.dirname(target_file))
    FileUtils.cp(file, target_file)
    puts "  Copied #{file} to #{target_file}"
  end
end

task 'zip' => 'rails.zip'
task 'vimball' => 'rails.vba'
task :default => [:zip, :vimball]
