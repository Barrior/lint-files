#!/bin/bash

# Declare variable
ADD_GIT_IGNORE=0
INSTALL_CMD='yarn add -D'
ORIGIN_DIR='https://raw.githubusercontent.com/Barrior/lint-files/main/eslint-ts'
DEPENDENCIES='
@commitlint/cli
@commitlint/config-conventional

@typescript-eslint/eslint-plugin
@typescript-eslint/parser

eslint
eslint-config-prettier
eslint-plugin-import
eslint-plugin-prettier
eslint-plugin-simple-import-sort
eslint-plugin-unused-imports

husky
lint-staged
prettier
stylelint
typescript
'
COMMIT_FILES='
.editorconfig
.eslintrc
.prettierrc
commitlint.config.js
package.json
tsconfig.json
'

for arg in "$@"; do
  if [ $arg = '--use-npm' ]; then
    INSTALL_CMD='npm i -D'
  fi

  if [ $arg = '--add-gitignore' ]; then
    ADD_GIT_IGNORE=1
  fi
done

# Install lint dependencies
eval $INSTALL_CMD $DEPENDENCIES --ignore-workspace-root-check

# Download lint files
curl -sLO "$ORIGIN_DIR/.editorconfig" \
  -sLO "$ORIGIN_DIR/.eslintrc" \
  -sLO "$ORIGIN_DIR/.prettierrc" \
  -sLO "$ORIGIN_DIR/commitlint.config.js" \
  -sLO "$ORIGIN_DIR/tsconfig.json"

# Download .gitignore file
if [ $ADD_GIT_IGNORE = 1 ]; then
  curl -sLO "$ORIGIN_DIR/.gitignore"
  COMMIT_FILES=$COMMIT_FILES' .gitignore'
fi

# Get and adjust lint json
PACKAGE_LINT_JSON=$(
  curl -sL "$ORIGIN_DIR/package-lint.json" |
  # Trim "{" in first line and "}" in last line
  sed -e '1a\'$'\n'',' -e '1d' -e '$d' |
  # Delete blank space like newline, tab and so on.
  tr -d '\n\r\f\t\v'
)

# Append lint json to the end of package.json
sed -i '' -e '$a\'$'\n'"$PACKAGE_LINT_JSON""}" -e '$d' package.json

# Pretty package.json
npx prettier --write package.json

# Commit changes
git add $COMMIT_FILES
git commit -m "chore(lint): add lint tools" $COMMIT_FILES
