**SendReceivedPractice**

**目的**

位置情報アプリを作るためにApple WatchとiPhoneの通信を学習する必要があったため。

**めも**

**iPhone側の受信部**

```swift
func session(_ session: WCSession, didReceiveMessage message: [String: Any]) {
  // 受信した値を処理
}
```

AppleWatch側のsendMessageメソッドから受信するために利用します。didReceiveMessageに受信した値が入っています。

**Watch側の受信部**

```swift
func session(_ session: WCSession, didReceiveUserInfo userInfo: [String: Any] = [:]) {
  // 受信した値を処理
}
```

iPhoneからの受信のために利用されます。transferUserInfoで送信した値をdidReceiveUserInfoで受信します。

**transferUserInfo(_:)**

```swift
func transferUserInfo(_ userInfo: [String: Any]) {
  // データを送信
}
```

データの辞書を相手に送信し、それが配信されていることを確認する場合は、このメソッドを呼び出します。

この方法を使用して送信された辞書は、他のデバイスでキューに入れられ、送信された順序で配信されます。
転送が開始された後、アプリが一時停止されても転送操作は継続されます。

**sendMessage(_:replyHandler:errorHandler:)**

```swift
func sendMessage(_ message: [String: Any], replyHandler: ((Data?, Error?) -> Void)?, errorHandler: ((Error?) -> Void)?) {
  // データを送信
}
```

ペアリングされたアクティブなデバイスにすぐにメッセージを送信し、オプションで応答を処理します。

このメッセージを使用して、できるだけ早くデータの辞書を相手に送信します。
メッセージは連続的にキューに入れられ、送信した順序で配信されます。
メッセージの配信は非同期に行われるため、このメソッドはすぐに返されます。

**使い分け**

ユーザーに通知を送信する場合は、sendMessage(_:replyHandler:errorHandler:)を使用します。

コールバックで送信結果を受け取ることで、メッセージが正常に送信されたかどうかを確認することができます。

ユーザーの情報を別のユーザーに共有する場合は、transferUserInfo(_:)を使用します。

転送された情報は、受信ユーザーが自由に使用することができます。

ユーザーのプロフィール情報を別のユーザーと共有する場合などに使用
