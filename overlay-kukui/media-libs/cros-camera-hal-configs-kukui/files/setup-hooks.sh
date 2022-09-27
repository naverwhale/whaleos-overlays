#!/bin/bash
# Copyright 2021 The Chromium OS Authors. All rights reserved.
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file.

# get config path for camera
config_path=$(cros_config /camera/config-file system-path)
ln -s "$config_path" /run/camera/camera_config_path
