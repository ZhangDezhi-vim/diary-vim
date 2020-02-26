all : diary-vim.zip

remove-zip:
	-rm doc/tags
	-rm diary-vim.zip

diary-vim.zip: remove-zip
	zip -r diary-vim.zip autoload plugin doc

release: diary-vim.zip
	vimup update-script diary.vim
