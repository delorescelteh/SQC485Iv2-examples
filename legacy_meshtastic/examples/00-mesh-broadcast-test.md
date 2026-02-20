# 00 - Mesh 廣播測試（兩台互通）

> 目的：快速驗證兩台節點 LoRa 互通（最少變數）。

## 前置

- 兩台都接好天線
- 兩台 Region 一致（建議 TW）

## 測試（CLI）

B 端 listen：

```bash
meshtastic --port /dev/cu.usbserial-21230 --listen
```

A 端廣播：

```bash
meshtastic --port /dev/cu.usbserial-21220 --dest '^all' --sendtext "hello"
```

看到 `TEXT_MESSAGE_APP` 且 transport 是 `TRANSPORT_LORA` 即代表成功。
