# SQC485Iv2-examples

這個 repo 收集 **SQC485Iv2** 的範例程式與協作指南。

> 新方向：本 repo 以 **我們自己的 Arduino library：`livinghuang/siliqs_esp32`** 為核心，不依賴 Meshtastic-device framework。

## 主要依賴（Key library）

- https://github.com/livinghuang/siliqs_esp32

本 repo 以 git submodule 方式引入：

- `arduino/lib/siliqs_esp32`

## Arduino 範例

在 `arduino/examples/`：

- `00_siliqs_setup_smoke/`：確認 `siliqs_esp32_setup()` 可正常跑
- `01_led_gpio2/`：GPIO2 LED 閃爍（**active-low**）
- `02_button_gpio9/`：GPIO9 按鍵讀取（Serial 印出）

## 協作指南

- `docs/AI_HUMAN_COWORK_GUIDE.md`

## 舊的 Meshtastic 流程

若你需要參考先前 Meshtastic 相關流程/腳本，請看 `legacy_meshtastic/`（如果有）。

## TODO

- [ ] 用 `siliqs_esp32` 寫 SX1262 LoRa ping-pong 範例（待確認 library API）
- [ ] RS485 SN65HVD1780 通訊/Modbus 範例
- [ ] 固定節點（太陽能）實作指南與安全注意事項
