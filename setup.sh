DOT_FILES=(
    bash/.bashrc
    bash/.bash_profile
    git/.gitconfig
    git/.git-prompt.sh
    git/.git-completion.bash
    tmux/.tmux.conf
    vim/.vimrc
    vim/.gvimrc
    zsh/.zshrc
    zsh/.zprofile
)

for file in ${DOT_FILES[@]}
do
    ln -s $(pwd)/$file $HOME/
done
ln -s $(pwd)/nvim $HOME/.config/
