### automating component generate by hygen

**setup**

1. install hygen

```
yarn add hygen -DP
```

2. generate template

```
yarn hygen init self
```

[tips] Directory Structure

```
_templates
└── generator
    ├── help
    │   └── index.ejs.t
    ├── new
    │   └── hello.ejs.t
    └── with-prompt
        ├── hello.ejs.t
        └── prompt.ejs.t
```

**file configuration**

`_template/generator/new/hello.ejs.t`

```js
// NOTE: ファイルに関するメタ情報を記述する場所（yaml形式で記述）
---
to: _templates/<%= name %>/<%= action || 'new' %>/hello.ejs.t
---
---
to: app/hello.js
---

// NOTE: body部分はファイルの内容を記述（ejs形式で記述）
// FYI: https://qiita.com/y_hokkey/items/31f1daa6cecb5f4ea4c9

const hello = `
Hello!
This is your first hygen template.

Learn what it can do here:

https://github.com/jondot/hygen
`

console.log(hello)
```

**generate new**

```js
// NOTE: hygenを使ってgeneratorという名のジェネレータでnewアクションを使用しファイルを作成する。（nameの変数に「Component Name」を含める。）
yarn hygen generator new --name ${Component Name}
```

[tips] so generate like below!!!
```
_templates
├── ${Component Name}
│   └── new
│       └── hello.ejs.t
└── generator
    ├── help
    │   └── index.ejs.t
    ├── new
    │   └── hello.ejs.t
    └── with-prompt
        ├── hello.ejs.t
        └── prompt.ejs.t
```

**generate new component**

```
yarn hygen ${Component Name} new
```
[tips] so generate like below!!!

```
.
├── _templates
│   ├── Card
│   └── generator
└── app
    └── hello.js
```


**generator help**

[tips] messageプロパティはコマンド上にメッセージを表示させるために使用する。

```
---
to: _templates/<%= name %>/<%= action || 'new' %>/hello.ejs.t
message: |
  --nameには<%= name %>が入りました。
---
---
to: app/hello.js
---
const hello = `
Hello!
This is your first hygen template.

Learn what it can do here:

https://github.com/jondot/hygen
`

console.log(hello)
```

[tips] so generate like below!!!

```
Loaded templates: _templates
       added: _templates/Card/new/hello.ejs.t
new:
--nameにはCardが入りました。
```

**generator with-prompt**

...Comming Soon...


**config file**
`.hygen.js`

```
module.exports = {
  templates: `${__dirname}/_templates`,
  helpers: {
    img: name => `src/assets/img/${name}`
  }
}
```
`templates`はテンプレートディレクトリの場所を指す。
上記の例だとhygenコマンドを実行するとプロジェクト直下の_templatesを見ます。 helpersオブジェクトにはejs.t内でhでアクセス可能です。


**more info**
- automating creating testing file
- automating story file



**reference**
http://www.hygen.io/
https://tyankatsu.hatenablog.com/entry/2018/11/18/151433
