task :default => ["install"]

desc "install dotfiles"
task :install do
  replace_all = false
  Dir["{.*,*}"].each do |file|
    next if %w[. .. .git Rakefile readme.md oh-my-zsh-custom].include? file
    if File.exist?(File.join(ENV['HOME'], file))
      if File.identical? file, File.join(ENV['HOME'], file)
        puts "skipping identical ~/#{file}"
      elsif replace_all
        replace_slink file
      else
        puts "#{file} exists"
        print "overwrite ~/#{file}? [ynaq] "
        case gets.chomp
        when 'y'
          replace_slink file
        when 'n'
          puts "skipping ~/#{file}"
        when 'a'
          replace_all = true
          replace_slink file
        when 'q'
          exit
        else
          puts "skipping ~/#{file}"
        end
      end
    else
      slink file
    end
  end
  Rake::Task[:vim].invoke
  Rake::Task[:ohmyzsh].invoke
end

task :vim => :git do
  system "git clone git://github.com/gmarik/vundle.git ~/.vim/bundle/vundle"
  system "vim +BundleInstall +qall"
  #make sparkup use python 2
  system "sed -i '1 s:.*:#!/usr/bin/env python2:' ~/.vim/bundle/vim-sparkup/ftplugin/html/sparkup.py"
end

task :ohmyzsh => :git do
  system "git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh"
end

task :git do
  system "sudo pacman -S git" unless system "which git"
end

task :curl do
  system "sudo pacman -S curl" unless system "which curl"
end

def slink(file)
  puts "==> linking ~/#{file}"
  system %Q{ln -s "$PWD/#{file}" "$HOME/#{file}"}
end

def replace_slink(file)
  system %Q{rm -rf "$HOME/#{file}"}
  slink file
end
