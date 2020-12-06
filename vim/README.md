# 个人VIM配置 - mac&linux

> mac支持golang相关配置,linux暂未支持(调试未通过,目前仅配置了快捷键、配色等通用插件)

~~~bash
# 使用Plug管理vim插件
$ curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

$ cd ~ && wget && mv linux_.vimrc .vimrc    #linux(win环境通过secureCRT登录后配色仍然生效 - CRT需设置Xterm ANSI颜色)
$ cd ~ && wget && mv mac_.vimrc .vimrc      #mac环境使用的插件多一些,配置起来稍微比较麻烦
$ :PlugInstall                              #拷贝vimrc后安装插件 - linux到这一步就ok了
~~~
