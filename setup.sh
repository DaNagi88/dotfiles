DOT_FILES=(
    bash/.bashrc
    bash/.bash_profile
    git/.gitconfig
    git/.git-prompt.sh
    git/.git-completion.bash
    tmux/.tmux.conf
    zsh/.zshrc
    zsh/.zprofile
)

for file in ${DOT_FILES[@]}
do
    ln -s $(pwd)/$file $HOME/
done

ln -s $(pwd)/vim $HOME/.vim
ln -s $(pwd)/vim/vimrc $HOME/.vimrc

nvim_config=$HOME/.config/nvim
if [ -d $nvim_config ];then
    mkdir -p $nvim_config
fi
ln -s $(pwd)/vim/vimrc $nvim_config/init.vim
