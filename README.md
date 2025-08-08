# installation

Copy contents of ./vim/ to ~/.vim/ and cd into it. (Make a backup of your previous .vim if necessary)
```
cp -r ~/.vim ~/.vim_backup # optional backup
cp -r ./vim ~/.vim
cd ~/.vim
```

If using apt, then you can just run setup.sh for automatic setup.
> ./setup.sh

Otherwise for manual setup, go to coc.nvim folder and run "npm ci"
```
cd ./pack/plugins/start/coc.nvim
npm ci
```
Then install lsp servers through your package manager.  
Current CocConfig has ccls, python3-lsp, rust-analyzer, and haskell-language-server configurations setup.  

You may need to run 
```
CocInstall coc-rust-analyzer 
CocInstall @yaegassy/coc-pylsp
```

From vim for rust and python.
