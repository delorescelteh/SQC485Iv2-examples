# 01 - 逐台燒錄（建議流程）

> 目的：降低刷機失敗率、避免 Port 搞混。

1. 一次只插一台板子
2. 進入 bootloader（按住 BOOT → 點 RST → 放開 BOOT）
3. 使用 `upload_speed=115200`
4. 第一台成功後再換第二台

對應 env（目前）：
- `sqc485iv2-esp32c3-sx1262`（TW 法規預設）
- 或 `heltec-ht62-esp32c3-sx1262`
