# note

## 基本

モジュールが返すべきなのは、普通は `p` と呼ばれるオブジェクトである。これは `{cite = citation}` という風にメソッドを持っていたりする。 `cite` メソッドは `frame` という引数についての情報を持ったオブジェクトを受け取り、文字列を返す。

テンプレートは、 `#invoke` を使いモジュールが返す `p` のメソッドを呼び出す。たとえば、 `{{#invoke:Foo|cite}}` なら `Foo` の `cite` メソッドが呼び出される。

## 引数をそのまま渡す

foo というテンプレートの内部で baa というモジュールを呼び出している時に、 foo に a=3 と b=4 という引数を渡すと、自動的に baa に a=3 と b=4 が渡されるようにするためにはどうすればいいのだろうか。色々なテンプレートの中身を見てみたが、そのための処理は全く書かれていない。 bash であれば `foo "$@"` という風に書く必要があるのに。

[Module:Arguments](https://en.wikipedia.org/wiki/Module:Arguments) ([permalink](https://en.wikipedia.org/w/index.php?oldid=948472485)) によれば、そのような処理は自動的に行われるようである。 "Frames and parent frames" の節にある。
