# NotificationDispatcherSample

## 何？

Objective-C で Notification を `addObserver` したものの `dealloc` で `removeObserver` し忘れるのを防ぐ１つの手法の紹介.

ViewController で通知を受けて何かするという処理は多いけど、 しょっちゅう `dealloc` 忘れるし、 ViewController はテストしにくい.

実行時にエラー起きて辛い.

- あと ViewController はテストしにくい.
- あと ViewController はテストしにくい.

## どうやるの？

- Notification を Delegate に変換する Dispatcher クラスを作る
- Dispatcher クラスで `addObserver` と `removeObserver` を管理する
- コード見たほうが早い

## 利点

- Dispatcher クラスの `dealloc` で `removeObserver` されていれば他の場所で考える必要がなくなる
- ViewController はテストしにくいけど Dispatcher クラス単体ならテスト簡単 (OCMock とか使う)
- どんな通知が来るか分からなくても Delegate が実装されてないと警告が出るので思考停止してても実装できる
- userInfo は何が入ってるかよくわからないけど、 Delegate のメソッドの引数になってれば何が入ってるか一目瞭然

```obj-c
note.userInfo[kHogeHogeUserInfoKey]: // 何が入ってるかわからん
```

```obj-c
- (void)dispatcher:(Dispatcher *)dispatcher didChangeHogehoge:(NSString *)hogehoge {

  // NSString の hogehgoe ってやつが入ってることが分かる

}
```

## 欠点

- コード増える

## サンプルコードの見方

上から順にコードを追いかけて行くと分かると思います.

### HogeNotificator

- 通知を発行しているクラス

### HogeNotificationDispatcher

- 通知を Delegate に変換しているクラス

### ViewController

- HogeNotificator が発行する通知を受け取って何かしたいクラス

