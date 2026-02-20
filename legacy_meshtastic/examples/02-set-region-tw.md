# 02 - 設定 LoRa Region = TW（Taiwan）

> 你的所在地若不是台灣，請改成正確 Region。

## 方法 A：用預設 TW 的韌體（建議）

如果你刷的是 `sqc485iv2-esp32c3-sx1262`（TW regulatory build），通常不需要再手動設定。

## 方法 B：用 CLI 設定

```bash
meshtastic --port /dev/cu.usbserial-21220 --set lora.region TW
meshtastic --port /dev/cu.usbserial-21230 --set lora.region TW

meshtastic --port /dev/cu.usbserial-21220 --reboot
meshtastic --port /dev/cu.usbserial-21230 --reboot
```

確認：

```bash
meshtastic --port /dev/cu.usbserial-21220 --get lora.region
meshtastic --port /dev/cu.usbserial-21230 --get lora.region
```
