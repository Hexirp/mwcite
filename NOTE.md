# note

## 基本

モジュールが返すべきなのは、普通は `p` と呼ばれるオブジェクトである。これは `{cite = citation}` という風にメソッドを持っていたりする。 `cite` メソッドは `frame` という引数についての情報を持ったオブジェクトを受け取り、文字列を返す。

テンプレートは、 `#invoke` を使いモジュールが返す `p` のメソッドを呼び出す。たとえば、 `{{#invoke:Foo|cite}}` なら `Foo` の `cite` メソッドが呼び出される。

## オブジェクト

```lua
function p.hello( frame )
    return "Hello, world!"
end
```

上記のように書くと、 `p` オブジェクトに `hello` メソッドを追加する。このように Lua はマップを基本とした JavaScript に似たオブジェクト指向のようだ。

## 引数をそのまま渡す

foo というテンプレートの内部で baa というモジュールを呼び出している時に、 foo に a=3 と b=4 という引数を渡すと、自動的に baa に a=3 と b=4 が渡されるようにするためにはどうすればいいのだろうか。色々なテンプレートの中身を見てみたが、そのための処理は全く書かれていない。 bash であれば `foo "$@"` という風に書く必要があるのに。

[Module:Arguments](https://en.wikipedia.org/wiki/Module:Arguments) ([permalink](https://en.wikipedia.org/w/index.php?oldid=948472485)) によれば、そのような処理を行うためのモジュールが Module:Arguments のようである。 "Frames and parent frames" の節にある。

## switch 文

Lua に switch 文はないが、 [luaでswitch～caseぽいことをやる – のらくるノート](https://noracle.jp/lua-switch-case/) ([archive](https://web.archive.org/web/20201030165854/https://noracle.jp/lua-switch-case/)) にあるように、そのまねごとはできる。

## 文字列への埋め込み

[Luaスクリプトの文法](http://www.rtpro.yamaha.co.jp/RT/docs/lua/tutorial/syntax.html) ([archive](https://web.archive.org/web/20190916124025/http://www.rtpro.yamaha.co.jp/RT/docs/lua/tutorial/syntax.html)) にあるように、 `$` を使って式を文字列の中に埋め込める。
