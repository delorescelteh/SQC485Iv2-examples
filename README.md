# SQC485Iv2 examples

這個專案用來收集 **SQC485Iv2** 的「可重現範例」與「DIY 固定節點（太陽能）最佳實務」。

## Repo / Docs

- 文件（GitBook）：https://github.com/delorescelteh/SQC485Iv2-meshtastic
- 韌體（fork + releases）：https://github.com/delorescelteh/SQC485Iv2-Meshtastic-device

## 內容結構

- `examples/`：示例（例如：出廠刷機、Region/Channel 設定、廣播/直傳測試、RS485/IO 範例等）
- `hardware/`：硬體相關筆記（接線、接口定義、供電/充電注意事項）
- `firmware/`：韌體相關（env、build/release 指令、版本策略）
- `tools/`：實用腳本（例如：一鍵燒錄、多節點測試腳本）
- `docs/`：可對外文件草稿/圖表

## TODO

- [ ] 收斂一套「固定節點」建議：防水盒、天線、走線、供電/電池安全
- [ ] 補上 RS485 端口範例（若要提供 Modbus/感測器）
- [ ] 補上 WiFi/OTA 策略（若需要）
