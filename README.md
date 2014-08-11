## 使用方法：
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
 git rm .vim/bundle/REPONAME or git rm --cached .vim/bundle/REPONAME
 ```

- ex:<br>

 ```vim
 git submodule deinit .vim/bundle/Align git rm .vim/bundle/Align
 git rm --cached .vim/bundle/Align
 ```
