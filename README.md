# lksColors

`lksColors` 是一个 R 语言配色包，总结了俺使用的配色方案(不定期更新新的配色方案)。

## 特性

- 提供多个预设配色方案，涵盖不同主题和视觉风格。
- 简单易用，直接在 R 中调用即可应用配色。
- 支持各种图形和数据可视化库（如 `ggplot2`）。
- 采用 MIT 许可证，免费且开源。
- 目前已有配色4种方案：  
  ```
  default
  venti
  mediterranean
  hsbc
  ```
## 安装

你可以通过以下命令安装 `lksColors` 包：

```r
# 使用 devtools 从 GitHub 安装
devtools::install_github("LiKa-shing/lksColors")
```
## 使用方法
```r
#获取hsbc配色方案
get_palette("hsbc")
#展示hsbc配色方案
show_palette("hsbc")