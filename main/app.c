#include <esp_log.h>
#include <freertos/FreeRTOS.h>

static const char *TAG = "app-main";

void app_main(void) {
  TickType_t t = xTaskGetTickCount();
  while (true) {
    ESP_LOGI(TAG, "Hearbeat");
    vTaskDelayUntil(&t, pdMS_TO_TICKS(500));
  }
}