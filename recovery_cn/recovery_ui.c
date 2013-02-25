/*
 * Copyright (C) 2009 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <linux/input.h>

#include "recovery_ui.h"
#include "common.h"
#include "extendedcommands.h"

char* MENU_HEADERS[] = { "提示:音量键选择项,开机键确定.",
			 "制作:Focus, 来自:www.gaojiquan.com(搞机圈)",
                         "",
                         NULL };

char* MENU_ITEMS[] = { "重启至...",
                       "从SD卡升级系统",
                       "利用sideload升级系统",
                       "擦除数据/恢复出厂设定",
                       "擦除缓存分区",
                       "备份与恢复",
                       "挂载与存储",
                       "高级选项",
                       "关机",
                       NULL };

void device_ui_init(UIParameters* ui_parameters) {
}

int device_recovery_start() {
    return 0;
}

int device_reboot_now(volatile char* key_pressed, int key_code) {
    return 0;
}

int device_perform_action(int which) {
    return which;
}

int device_wipe_data() {
    return 0;
}
