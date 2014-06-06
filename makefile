install: install-bash install-vim -install-tmux \
		 install-colors install-terminal install-awesome \
		 install-asound


install-bash:
	rm -f ~/.bashrc ~/.bash_aliases
	ln -s `pwd`/.bashrc ~/.bashrc
	ln -s `pwd`/.bash_aliases ~/.bash_aliases

install-vim:
	rm -rf ~/.vimrc
	ln -s `pwd`/.vimrc ~/.vimrc
	ln -s ~/.vim/vimrc ~/.vimrc

install-tmux:
	rm -f ~/.tmux.conf
	ln -s `pwd`/.tmux.conf ~/.tmux.conf

install-colors:
	rm -f ~/.dircolors
	ln -s `pwd`/.dircolors ~/.dircolors

install-terminal:
	rm -f ~/.Xdefaults
	ln -s `pwd`/.Xdefaults ~/.Xdefaults

install-awesome:
	rm -rf ~/.config/awesome
	ln -s `pwd`/awesome ~/.config/awesome

install-asound:
	ln -s `pwd`/.asroundrcTV ~/.asoundrcTV
	ln -s `pwd`/.asroundrcHEAD ~/.asoundrcHEAD
