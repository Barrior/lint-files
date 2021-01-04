# lint-files
通过一条命令为前端项目引入统一的规范，类似 dotfiles。

## 使用

在项目根目录执行下面命令，就会以 `lint-files/eslint-ts` 的规范为项目安装所需依赖及配置。

```bash
curl -sL https://raw.githubusercontent.com/Barrior/lint-files/main/eslint-ts/install.sh | bash
```

命令允许加入参数，如下示例，使用 `npm` 替换默认的 `yarn` 包管理工具进行所需依赖的安装。

```bash
curl -sL https://raw.githubusercontent.com/Barrior/lint-files/main/eslint-ts/install.sh | bash -s -- --use-npm
```

## 参数列表

- `--use-npm`: 使用 npm 安装，默认使用 yarn 安装。
- `--add-gitignore`: 添加 `.gitignore` 规范文件。
- `--add-tsconfig`: 添加 `tsconfig.json` 规范文件。

## FAQ

如果命令没有执行成功，有可能是 GitHub 的 DNS 被污染了，修正 host 即可，如下。

```bash
199.232.68.133 raw.githubusercontent.com
```
