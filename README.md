2013_johoriko_poster
====================

2013年に公開された東京大学大学院情報理工学系研究科の募集ポスターを解くコード。
Macの中身を整理したかったのでgithubにコードを退避しておく。

次のコードでバイナリをASCIIに戻せる. このone linerは [hosi_moさん](https://github.com/hosi-mo)さんが使っていたやつ。

    s = File.open("01.txt", "rb") {|f| print [f.read].pack("B*")}

ポスターに書かれているバイナリをASCIIに戻すと, 次のようになる.


    +----+
    |Ipwg|
    |o..u|EFHI KNOR
    |acto||||| ||||
    |usw!|VVVV VVVV
    +----+----+----+----+
    | uil|o  t|hw: |ak.y|->S
    | ft |S-to|nw/r|_/ao|->T
    |scys|iai |o.o |_ttl|->U
    |tuue|nnn.|ojki|lk. |->V,Y
    +----+----+----+----+
    |GTad|
    |h/se|
    |lh r|
    |CSpF|
    +----+

    Rotate this cube by repeating
    T,H,E,U,N,I,V,E,R,S,I,T,Y,O,F,T,O,K,Y,O
    201^^3 times.

    a^^b is up-arrow notation.

つまり, そういうことである。

cube.rb: キューブのジオメトリ状態を保持し, またキューブの回転を実現するメッソドを持つクラス.

poster_restore.rb: 指定された回転シーケンスに従って複数回の回転を繰り返した場合, M回だけ回転シーケンスを試行した時点でキューブのジオメトリ状態は初期状態に戻る. このMを求めるコード.

poster_try_n.rb: N回だけ指定された回転シーケンスを試行し、その結果のキューブのジオメトリを画面に出力するコード。

poster_single_rotate.rb: テスト/・デバッグ用に使ったコード.

上の展開図で示される4*4*4のキューブを THEUNIVERSITYOFTOKYOのシーケンスで示されるとおりに201^(201^201)回だけ回せばいいわけだが, こんな回転をやってたら計算が終わらないので、まず下のposter_restore.rbを使って, キューブが初期状態に戻る試行数Mを求める. すると, 問題はキューブをシーケンスで示されるとおりに 201^(201^201) % M 回だけ回せばいいという事になる. あとは、わかるだろ?

コード自体は非常に汚いです。もっとスマートな実装があるはずなので各自いろいろ試してみてください。

