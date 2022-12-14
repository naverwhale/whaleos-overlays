/*
 * Copyright (C) 2019 MediaTek Inc.
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


STATIC_METADATA2_BEGIN(DEVICE, SCALER, SENSOR_DRVNAME_OV02A10_MIPI_RAW)
//------------------------------------------------------------------------------
//  android.scaler
//------------------------------------------------------------------------------
//==========================================================================
CONFIG_METADATA_BEGIN(MTK_SCALER_AVAILABLE_MAX_DIGITAL_ZOOM)//
CONFIG_ENTRY_VALUE(4, MFLOAT)
CONFIG_METADATA_END()
//==========================================================================
CONFIG_METADATA_BEGIN(MTK_SCALER_AVAILABLE_INPUT_OUTPUT_FORMATS_MAP)//new hidden
CONFIG_ENTRY_VALUE(HAL_PIXEL_FORMAT_IMPLEMENTATION_DEFINED, MINT32)
CONFIG_ENTRY_VALUE(2, MINT32)
CONFIG_ENTRY_VALUE(HAL_PIXEL_FORMAT_YCbCr_420_888, MINT32)
CONFIG_ENTRY_VALUE(HAL_PIXEL_FORMAT_BLOB, MINT32)
CONFIG_ENTRY_VALUE(HAL_PIXEL_FORMAT_YCbCr_420_888, MINT32)
CONFIG_ENTRY_VALUE(2, MINT32)
CONFIG_ENTRY_VALUE(HAL_PIXEL_FORMAT_YCbCr_420_888, MINT32)
CONFIG_ENTRY_VALUE(HAL_PIXEL_FORMAT_BLOB, MINT32)
CONFIG_METADATA_END()
//==========================================================================
CONFIG_METADATA_BEGIN(MTK_SCALER_AVAILABLE_STREAM_CONFIGURATIONS)//new hidden

CONFIG_ENTRY_VALUE(HAL_PIXEL_FORMAT_BLOB, MINT32)
CONFIG_ENTRY_VALUE(1600, MINT32)
CONFIG_ENTRY_VALUE(1200, MINT32)
CONFIG_ENTRY_VALUE(MTK_SCALER_AVAILABLE_STREAM_CONFIGURATIONS_OUTPUT, MINT32)

CONFIG_ENTRY_VALUE(HAL_PIXEL_FORMAT_BLOB, MINT32)
CONFIG_ENTRY_VALUE(1280, MINT32)
CONFIG_ENTRY_VALUE(960, MINT32)
CONFIG_ENTRY_VALUE(MTK_SCALER_AVAILABLE_STREAM_CONFIGURATIONS_OUTPUT, MINT32)

CONFIG_ENTRY_VALUE(HAL_PIXEL_FORMAT_BLOB, MINT32)
CONFIG_ENTRY_VALUE(1280, MINT32)
CONFIG_ENTRY_VALUE(720, MINT32)
CONFIG_ENTRY_VALUE(MTK_SCALER_AVAILABLE_STREAM_CONFIGURATIONS_OUTPUT, MINT32)

CONFIG_ENTRY_VALUE(HAL_PIXEL_FORMAT_BLOB, MINT32)
CONFIG_ENTRY_VALUE(640, MINT32)
CONFIG_ENTRY_VALUE(480, MINT32)
CONFIG_ENTRY_VALUE(MTK_SCALER_AVAILABLE_STREAM_CONFIGURATIONS_OUTPUT, MINT32)

CONFIG_ENTRY_VALUE(HAL_PIXEL_FORMAT_BLOB, MINT32)
CONFIG_ENTRY_VALUE(320, MINT32)
CONFIG_ENTRY_VALUE(240, MINT32)
CONFIG_ENTRY_VALUE(MTK_SCALER_AVAILABLE_STREAM_CONFIGURATIONS_OUTPUT, MINT32)

CONFIG_ENTRY_VALUE(HAL_PIXEL_FORMAT_IMPLEMENTATION_DEFINED, MINT32)
CONFIG_ENTRY_VALUE(1600, MINT32)
CONFIG_ENTRY_VALUE(1200, MINT32)
CONFIG_ENTRY_VALUE(MTK_SCALER_AVAILABLE_STREAM_CONFIGURATIONS_INPUT, MINT32)

CONFIG_ENTRY_VALUE(HAL_PIXEL_FORMAT_YCbCr_420_888, MINT32)
CONFIG_ENTRY_VALUE(1600, MINT32)
CONFIG_ENTRY_VALUE(1200, MINT32)
CONFIG_ENTRY_VALUE(MTK_SCALER_AVAILABLE_STREAM_CONFIGURATIONS_INPUT, MINT32)

CONFIG_ENTRY_VALUE(HAL_PIXEL_FORMAT_YCbCr_420_888, MINT32)
CONFIG_ENTRY_VALUE(1600, MINT32)
CONFIG_ENTRY_VALUE(1200, MINT32)
CONFIG_ENTRY_VALUE(MTK_SCALER_AVAILABLE_STREAM_CONFIGURATIONS_OUTPUT, MINT32)

CONFIG_ENTRY_VALUE(HAL_PIXEL_FORMAT_YCbCr_420_888, MINT32)
CONFIG_ENTRY_VALUE(1280, MINT32)
CONFIG_ENTRY_VALUE(960, MINT32)
CONFIG_ENTRY_VALUE(MTK_SCALER_AVAILABLE_STREAM_CONFIGURATIONS_OUTPUT, MINT32)

CONFIG_ENTRY_VALUE(HAL_PIXEL_FORMAT_YCbCr_420_888, MINT32)
CONFIG_ENTRY_VALUE(1280, MINT32)
CONFIG_ENTRY_VALUE(720, MINT32)
CONFIG_ENTRY_VALUE(MTK_SCALER_AVAILABLE_STREAM_CONFIGURATIONS_OUTPUT, MINT32)

CONFIG_ENTRY_VALUE(HAL_PIXEL_FORMAT_YCbCr_420_888, MINT32)
CONFIG_ENTRY_VALUE(640, MINT32)
CONFIG_ENTRY_VALUE(480, MINT32)
CONFIG_ENTRY_VALUE(MTK_SCALER_AVAILABLE_STREAM_CONFIGURATIONS_OUTPUT, MINT32)

CONFIG_ENTRY_VALUE(HAL_PIXEL_FORMAT_YCbCr_420_888, MINT32)
CONFIG_ENTRY_VALUE(320, MINT32)
CONFIG_ENTRY_VALUE(240, MINT32)
CONFIG_ENTRY_VALUE(MTK_SCALER_AVAILABLE_STREAM_CONFIGURATIONS_OUTPUT, MINT32)

CONFIG_METADATA_END()
//==========================================================================
CONFIG_METADATA_BEGIN(MTK_SCALER_AVAILABLE_MIN_FRAME_DURATIONS)//new hidden

CONFIG_ENTRY_VALUE(HAL_PIXEL_FORMAT_BLOB, MINT64)
CONFIG_ENTRY_VALUE(1600, MINT64)
CONFIG_ENTRY_VALUE(1200, MINT64)
CONFIG_ENTRY_VALUE(33333333, MINT64)

CONFIG_ENTRY_VALUE(HAL_PIXEL_FORMAT_BLOB, MINT64)
CONFIG_ENTRY_VALUE(1280, MINT64)
CONFIG_ENTRY_VALUE(960, MINT64)
CONFIG_ENTRY_VALUE(33333333, MINT64)

CONFIG_ENTRY_VALUE(HAL_PIXEL_FORMAT_BLOB, MINT64)
CONFIG_ENTRY_VALUE(1280, MINT64)
CONFIG_ENTRY_VALUE(720, MINT64)
CONFIG_ENTRY_VALUE(33333333, MINT64)

CONFIG_ENTRY_VALUE(HAL_PIXEL_FORMAT_BLOB, MINT64)
CONFIG_ENTRY_VALUE(640, MINT64)
CONFIG_ENTRY_VALUE(480, MINT64)
CONFIG_ENTRY_VALUE(33333333, MINT64)

CONFIG_ENTRY_VALUE(HAL_PIXEL_FORMAT_BLOB, MINT64)
CONFIG_ENTRY_VALUE(320, MINT64)
CONFIG_ENTRY_VALUE(240, MINT64)
CONFIG_ENTRY_VALUE(33333333, MINT64)

CONFIG_ENTRY_VALUE(HAL_PIXEL_FORMAT_YCbCr_420_888, MINT64)
CONFIG_ENTRY_VALUE(1600, MINT64)
CONFIG_ENTRY_VALUE(1200, MINT64)
CONFIG_ENTRY_VALUE(33333333, MINT64)

CONFIG_ENTRY_VALUE(HAL_PIXEL_FORMAT_YCbCr_420_888, MINT64)
CONFIG_ENTRY_VALUE(1280, MINT64)
CONFIG_ENTRY_VALUE(960, MINT64)
CONFIG_ENTRY_VALUE(33333333, MINT64)

CONFIG_ENTRY_VALUE(HAL_PIXEL_FORMAT_YCbCr_420_888, MINT64)
CONFIG_ENTRY_VALUE(1280, MINT64)
CONFIG_ENTRY_VALUE(720, MINT64)
CONFIG_ENTRY_VALUE(33333333, MINT64)

CONFIG_ENTRY_VALUE(HAL_PIXEL_FORMAT_YCbCr_420_888, MINT64)
CONFIG_ENTRY_VALUE(640, MINT64)
CONFIG_ENTRY_VALUE(480, MINT64)
CONFIG_ENTRY_VALUE(33333333, MINT64)

CONFIG_ENTRY_VALUE(HAL_PIXEL_FORMAT_YCbCr_420_888, MINT64)
CONFIG_ENTRY_VALUE(320, MINT64)
CONFIG_ENTRY_VALUE(240, MINT64)
CONFIG_ENTRY_VALUE(33333333, MINT64)

CONFIG_METADATA_END()
//==========================================================================
CONFIG_METADATA_BEGIN(MTK_SCALER_AVAILABLE_STALL_DURATIONS)//new hidden

CONFIG_ENTRY_VALUE(HAL_PIXEL_FORMAT_BLOB, MINT64)
CONFIG_ENTRY_VALUE(1600, MINT64)
CONFIG_ENTRY_VALUE(1200, MINT64)
CONFIG_ENTRY_VALUE(33333333, MINT64)

CONFIG_ENTRY_VALUE(HAL_PIXEL_FORMAT_BLOB, MINT64)
CONFIG_ENTRY_VALUE(1280, MINT64)
CONFIG_ENTRY_VALUE(960, MINT64)
CONFIG_ENTRY_VALUE(33333333, MINT64)

CONFIG_ENTRY_VALUE(HAL_PIXEL_FORMAT_BLOB, MINT64)
CONFIG_ENTRY_VALUE(1280, MINT64)
CONFIG_ENTRY_VALUE(720, MINT64)
CONFIG_ENTRY_VALUE(33333333, MINT64)

CONFIG_ENTRY_VALUE(HAL_PIXEL_FORMAT_BLOB, MINT64)
CONFIG_ENTRY_VALUE(640, MINT64)
CONFIG_ENTRY_VALUE(480, MINT64)
CONFIG_ENTRY_VALUE(33333333, MINT64)

CONFIG_ENTRY_VALUE(HAL_PIXEL_FORMAT_BLOB, MINT64)
CONFIG_ENTRY_VALUE(320, MINT64)
CONFIG_ENTRY_VALUE(240, MINT64)
CONFIG_ENTRY_VALUE(33333333, MINT64)

CONFIG_ENTRY_VALUE(HAL_PIXEL_FORMAT_YCbCr_420_888, MINT64)
CONFIG_ENTRY_VALUE(1600, MINT64)
CONFIG_ENTRY_VALUE(1200, MINT64)
CONFIG_ENTRY_VALUE(0, MINT64)

CONFIG_ENTRY_VALUE(HAL_PIXEL_FORMAT_YCbCr_420_888, MINT64)
CONFIG_ENTRY_VALUE(1280, MINT64)
CONFIG_ENTRY_VALUE(960, MINT64)
CONFIG_ENTRY_VALUE(0, MINT64)

CONFIG_ENTRY_VALUE(HAL_PIXEL_FORMAT_YCbCr_420_888, MINT64)
CONFIG_ENTRY_VALUE(1280, MINT64)
CONFIG_ENTRY_VALUE(720, MINT64)
CONFIG_ENTRY_VALUE(0, MINT64)

CONFIG_ENTRY_VALUE(HAL_PIXEL_FORMAT_YCbCr_420_888, MINT64)
CONFIG_ENTRY_VALUE(640, MINT64)
CONFIG_ENTRY_VALUE(480, MINT64)
CONFIG_ENTRY_VALUE(0, MINT64)

CONFIG_ENTRY_VALUE(HAL_PIXEL_FORMAT_YCbCr_420_888, MINT64)
CONFIG_ENTRY_VALUE(320, MINT64)
CONFIG_ENTRY_VALUE(240, MINT64)
CONFIG_ENTRY_VALUE(0, MINT64)

CONFIG_METADATA_END()
//==========================================================================
CONFIG_METADATA_BEGIN(MTK_REPROCESS_MAX_CAPTURE_STALL)
CONFIG_ENTRY_VALUE(4 , MINT32)
CONFIG_METADATA_END()
//==========================================================================
CONFIG_METADATA_BEGIN(MTK_SCALER_CROPPING_TYPE)//new
CONFIG_ENTRY_VALUE(MTK_SCALER_CROPPING_TYPE_FREEFORM , MUINT8)
CONFIG_METADATA_END()
//==========================================================================
//------------------------------------------------------------------------------
//  android.jpeg
//------------------------------------------------------------------------------
CONFIG_METADATA_BEGIN(MTK_JPEG_AVAILABLE_THUMBNAIL_SIZES)
CONFIG_ENTRY_VALUE(MSize(0,   0), MSize)
CONFIG_ENTRY_VALUE(MSize(256, 144), MSize)
CONFIG_ENTRY_VALUE(MSize(256, 192), MSize)
CONFIG_METADATA_END()
//==========================================================================
//------------------------------------------------------------------------------
STATIC_METADATA_END()

