## 使用方法：
- 更新所有 submodule
- 指令：<br>

 ```
 git submodule foreach git pull origin master
 ```

- 抓下來後要 update submodule
- 指令：<br>

 ```
 git submodule update --init
 ```

### 要加入新的 submodule 要用 git submodule add
- 指令：<br>

 ```
 git submodule add REPOURL .vim/bundle/REPONAME
 ```
- ex:<br>

 ```vim
 git submodule add https://github.com/nanotech/jellybeans.vim.git .vim/bundle/jellybeans.vim
 ```

### 要移除 submodule 要用 git submodule deinit
- 指令：<br>

 ```vim
 git submodule deinit .vim/bundle/REPONAME
 or
 git rm .vim/bundle/REPONAME or git rm --cached .vim/bundle/REPONAME
 ```

- ex:<br>

 ```vim
 git submodule deinit .vim/bundle/Align
 git rm .vim/bundle/Align 
 or
 git rm --cached .vim/bundle/Align
 ```

### Vundle 管理方法
 ```
 :PluginList       - lists configured plugins
 :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
 :PluginSearch foo - searches for foo; append `!` to refresh local cache
 :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
 ```
