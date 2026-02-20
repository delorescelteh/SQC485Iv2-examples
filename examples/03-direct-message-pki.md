# 03 - 直傳訊息 / ACK 與 PKI_SEND_FAIL_PUBLIC_KEY

在某些情況下，對指定節點 `--dest '!xxxxxxxx'` 直傳文字時會遇到：

- `PKI_SEND_FAIL_PUBLIC_KEY`

這通常代表：
- 直傳/可靠傳輸流程需要對方公鑰或驗證資訊
- 但目前尚未取得/交換完成

## 建議策略

1. **先驗證 LoRa link 沒問題**：用廣播 `^all` 做 A→B、B→A
2. 再用手機 App / Meshtastic Web 查看「安全/金鑰」相關設定
3. 若只是 DIY 固定節點基本聊天：可以先以廣播為主

## 測試指令

廣播（最穩）：

```bash
meshtastic --port /dev/cu.usbserial-21220 --dest '^all' --sendtext "broadcast ok"
```

直傳（可能被 PKI 擋）：

```bash
meshtastic --port /dev/cu.usbserial-21220 --dest '!7d51bb04' --sendtext "direct" --ack --timeout 30
```
