#!/usr/bin/env ruby

module DotFile
  GIT_REPO = "git://github.com/mz026/dot_files.git"
  HOME = ENV["HOME"]
  DOT_FILES_PATH = "#{HOME}/.dot_files"

  VIMRC_PATH = "#{HOME}/.vimrc"
  GITCONFIG_PATH = "#{HOME}/.gitconfig"
  TMUX_CONFIG_PATH = "#{HOME}/.tmux.conf"
  INPUTRC_PATH = "#{HOME}/.inputrc"
end

def create_symbolic_link path, name
  if File.exists? path
    system "rm #{path}"
  end

  system "ln -s #{DotFile::DOT_FILES_PATH}/#{name} #{path}"
  puts "update #{path}"
end

def clone_dot_files
  unless Dir.exists? DotFile::DOT_FILES_PATH
    system "git clone #{DotFile::GIT_REPO} #{DotFile::DOT_FILES_PATH}" 
    puts "clone dot_files to #{DotFile::DOT_FILES_PATH}"
  end
end

def install_vundle
  unless Dir.exists? File.join(DotFile::HOME, ".vim/bundle/vundle")
    system "git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle"
  end
end

clone_dot_files
install_vundle

create_symbolic_link DotFile::VIMRC_PATH, "vimrc"
create_symbolic_link DotFile::GITCONFIG_PATH, "gitconfig"
create_symbolic_link DotFile::TMUX_CONFIG_PATH, "tmux.conf"
create_symbolic_link DotFile::INPUTRC_PATH, "inputrc"

system "echo 'source ~/.dot_files/bashrc' >> ~/.bashrc"

puts "OK"
