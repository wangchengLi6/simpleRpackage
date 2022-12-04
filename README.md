# simpleRpackage
About how to develop a simple R package.

There are three parts:

- `.md` file is the markdown version of the guidebook.
- `.pdf` file is the pdf version of the guidebook.
- `.ssets` filefolder contain all the png files used in the `.md` file.
- `code.R` is an example material for you to construct a R package.

All of the guide book is written in chinese.

R 包开发的中文教程

包括的文件或文件夹有：
- `.md` 是教程的 markdown 版本
- `.pdf` 是 markdown 文件的 pdf 导出版
- `.ssets` 文件夹中包含了所有被使用到的 png 图片
- `code.R` 是提供的一个案例素材，实现的功能是绘制随机游走链

该示例性的 R 包已经上传至 GitHub，可以使用如下命令安装：
```{R}
devtools::install_github("wangchengLi6/randomwalkli")
```