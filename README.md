# lint-files
通过一条命令为前端项目引入统一的规范，类似 dotfiles。

### 规范列表

```bash
eslint:               规范 JavaScript 语法
typescript-eslint:    在 ESLint 里集成 TS 支持
.editorconfig:        规范编辑器的代码风格
prettier:             规范代码风格并美化
commitlint:           规范 Git Commit 格式
husky:                代码提交时执行以上规范校验
stylelint:            @TODO
```

### 使用

在项目根目录执行下面命令，就会以 `lint-files/eslint-ts` 的规范为项目安装所需依赖及配置。

```bash
curl -sL https://raw.githubusercontent.com/Barrior/lint-files/main/eslint-ts/install.sh | bash
```

命令允许加入参数，如下示例，使用 `npm` 替换默认的 `yarn` 包管理工具进行所需依赖的安装。

```bash
curl -sL https://raw.githubusercontent.com/Barrior/lint-files/main/eslint-ts/install.sh | bash -s -- --use-npm
```

### 参数列表

- `--use-npm`: 使用 npm 安装，默认使用 yarn 安装。
- `--add-gitignore`: 添加 `.gitignore` 规范文件。

### FAQ

如果命令没有执行成功，有可能是 GitHub 的 DNS 被污染了，修正 host 即可，如下。

```bash
199.232.68.133 raw.githubusercontent.com
```
