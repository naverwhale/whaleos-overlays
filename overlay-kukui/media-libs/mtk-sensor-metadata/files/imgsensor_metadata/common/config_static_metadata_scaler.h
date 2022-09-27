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



STATIC_METADATA2_BEGIN(DEVICE, SCALER, COMMON)
//------------------------------------------------------------------------------
//  android.scaler
//------------------------------------------------------------------------------
//==========================================================================
//    [ ANDROID_SCALER_CROP_REGION - ANDROID_SCALER_START ] =
//    { "cropRegion",                    TYPE_INT32  },
//==========================================================================
/*CONFIG_METADATA_BEGIN(MTK_SCALER_AVAILABLE_FORMATS) //remove @ 3.2
    CONFIG_ENTRY_VALUE(HAL_PIXEL_FORMAT_YV12, MINT32)         // YV12
    CONFIG_ENTRY_VALUE(HAL_PIXEL_FORMAT_Y8, MINT32)
    CONFIG_ENTRY_VALUE(HAL_PIXEL_FORMAT_BLOB, MINT32)
    CONFIG_ENTRY_VALUE(HAL_PIXEL_FORMAT_YCrCb_420_SP, MINT32) // NV21
    CONFIG_ENTRY_VALUE(HAL_PIXEL_FORMAT_YCbCr_422_I, MINT32) // YUY2
CONFIG_METADATA_END()
//==========================================================================
CONFIG_METADATA_BEGIN(MTK_SCALER_AVAILABLE_JPEG_MIN_DURATIONS)//remove @ 3.2
    CONFIG_ENTRY_VALUE(33331760L, MINT64)
CONFIG_METADATA_END()*/
//==========================================================================
CONFIG_METADATA_BEGIN(MTK_SCALER_AVAILABLE_JPEG_SIZES)//remove @ 3.2
CONFIG_ENTRY_VALUE(MSize(800,  600), MSize)
CONFIG_ENTRY_VALUE(MSize(1600,  1200), MSize)
CONFIG_ENTRY_VALUE(MSize(2560,  1920), MSize)
CONFIG_METADATA_END()
//==========================================================================
CONFIG_METADATA_BEGIN(MTK_SCALER_AVAILABLE_MAX_DIGITAL_ZOOM)//
CONFIG_ENTRY_VALUE(4, MFLOAT)
CONFIG_METADATA_END()
//==========================================================================
/*CONFIG_METADATA_BEGIN(MTK_SCALER_AVAILABLE_PROCESSED_MIN_DURATIONS)//remove @ 3.2
    CONFIG_ENTRY_VALUE(33331760L, MINT64)
CONFIG_METADATA_END()
//==========================================================================
CONFIG_METADATA_BEGIN(MTK_SCALER_AVAILABLE_PROCESSED_SIZES)//remove @ 3.2
     CONFIG_ENTRY_VALUE(MSize(320,  240), MSize)
     CONFIG_ENTRY_VALUE(MSize(640,  480), MSize)
     CONFIG_ENTRY_VALUE(MSize(1280, 720), MSize)
     CONFIG_ENTRY_VALUE(MSize(1920, 1080), MSize)
     CONFIG_ENTRY_VALUE(MSize(3200, 2400), MSize)
CONFIG_METADATA_END()
//==========================================================================
CONFIG_METADATA_BEGIN(MTK_SCALER_AVAILABLE_RAW_MIN_DURATIONS) //remove @ 3.2
    CONFIG_ENTRY_VALUE(33331760L, MINT64)
CONFIG_METADATA_END()
//==========================================================================
CONFIG_METADATA_BEGIN(MTK_SCALER_AVAILABLE_RAW_SIZES)//remove @ 3.2
    CONFIG_ENTRY_VALUE(MSize(3200,2400), MSize)
CONFIG_METADATA_END()*/
//==========================================================================
/*CONFIG_METADATA_BEGIN(MTK_SCALER_AVAILABLE_INPUT_OUTPUT_FORMATS_MAP)//new hidden
    CONFIG_ENTRY_VALUE( , MINT32)
CONFIG_METADATA_END()*/
//==========================================================================
CONFIG_METADATA_BEGIN(MTK_SCALER_AVAILABLE_STREAM_CONFIGURATIONS)//new hidden
#if 1
CONFIG_ENTRY_VALUE(HAL_PIXEL_FORMAT_BLOB, MINT32)
CONFIG_ENTRY_VALUE(2560, MINT32)
CONFIG_ENTRY_VALUE(1920, MINT32)
CONFIG_ENTRY_VALUE(MTK_SCALER_AVAILABLE_STREAM_CONFIGURATIONS_OUTPUT, MINT32)

CONFIG_ENTRY_VALUE(HAL_PIXEL_FORMAT_BLOB, MINT32)
CONFIG_ENTRY_VALUE(1920, MINT32)
CONFIG_ENTRY_VALUE(1088, MINT32)
CONFIG_ENTRY_VALUE(MTK_SCALER_AVAILABLE_STREAM_CONFIGURATIONS_OUTPUT, MINT32)

CONFIG_ENTRY_VALUE(HAL_PIXEL_FORMAT_BLOB, MINT32)
CONFIG_ENTRY_VALUE(1280, MINT32)
CONFIG_ENTRY_VALUE(720, MINT32)
CONFIG_ENTRY_VALUE(MTK_SCALER_AVAILABLE_STREAM_CONFIGURATIONS_OUTPUT, MINT32)
#endif
CONFIG_ENTRY_VALUE(HAL_PIXEL_FORMAT_BLOB, MINT32)
CONFIG_ENTRY_VALUE(640, MINT32)
CONFIG_ENTRY_VALUE(480, MINT32)
CONFIG_ENTRY_VALUE(MTK_SCALER_AVAILABLE_STREAM_CONFIGURATIONS_OUTPUT, MINT32)

CONFIG_ENTRY_VALUE(HAL_PIXEL_FORMAT_BLOB, MINT32)
CONFIG_ENTRY_VALUE(320, MINT32)
CONFIG_ENTRY_VALUE(240, MINT32)
CONFIG_ENTRY_VALUE(MTK_SCALER_AVAILABLE_STREAM_CONFIGURATIONS_OUTPUT, MINT32)

#if 1
CONFIG_ENTRY_VALUE(HAL_PIXEL_FORMAT_RAW16, MINT32)
CONFIG_ENTRY_VALUE(2560, MINT32)
CONFIG_ENTRY_VALUE(1920, MINT32)
CONFIG_ENTRY_VALUE(MTK_SCALER_AVAILABLE_STREAM_CONFIGURATIONS_OUTPUT, MINT32)

CONFIG_ENTRY_VALUE(HAL_PIXEL_FORMAT_YCbCr_420_888, MINT32)
CONFIG_ENTRY_VALUE(2560, MINT32)
CONFIG_ENTRY_VALUE(1920, MINT32)
CONFIG_ENTRY_VALUE(MTK_SCALER_AVAILABLE_STREAM_CONFIGURATIONS_OUTPUT, MINT32)

CONFIG_ENTRY_VALUE(HAL_PIXEL_FORMAT_YCbCr_420_888, MINT32)
CONFIG_ENTRY_VALUE(1920, MINT32)
CONFIG_ENTRY_VALUE(1088, MINT32)
CONFIG_ENTRY_VALUE(MTK_SCALER_AVAILABLE_STREAM_CONFIGURATIONS_OUTPUT, MINT32)

CONFIG_ENTRY_VALUE(HAL_PIXEL_FORMAT_YCbCr_420_888, MINT32)
CONFIG_ENTRY_VALUE(1920, MINT32)
CONFIG_ENTRY_VALUE(1080, MINT32)
CONFIG_ENTRY_VALUE(MTK_SCALER_AVAILABLE_STREAM_CONFIGURATIONS_OUTPUT, MINT32)

CONFIG_ENTRY_VALUE(HAL_PIXEL_FORMAT_YCbCr_420_888, MINT32)
CONFIG_ENTRY_VALUE(1280, MINT32)
CONFIG_ENTRY_VALUE(720, MINT32)
CONFIG_ENTRY_VALUE(MTK_SCALER_AVAILABLE_STREAM_CONFIGURATIONS_OUTPUT, MINT32)

CONFIG_ENTRY_VALUE(HAL_PIXEL_FORMAT_YCbCr_420_888, MINT32)
CONFIG_ENTRY_VALUE(720, MINT32)
CONFIG_ENTRY_VALUE(480, MINT32)
CONFIG_ENTRY_VALUE(MTK_SCALER_AVAILABLE_STREAM_CONFIGURATIONS_OUTPUT, MINT32)
#endif
CONFIG_ENTRY_VALUE(HAL_PIXEL_FORMAT_YCbCr_420_888, MINT32)
CONFIG_ENTRY_VALUE(640, MINT32)
CONFIG_ENTRY_VALUE(480, MINT32)
CONFIG_ENTRY_VALUE(MTK_SCALER_AVAILABLE_STREAM_CONFIGURATIONS_OUTPUT, MINT32)

CONFIG_ENTRY_VALUE(HAL_PIXEL_FORMAT_YCbCr_420_888, MINT32)
CONFIG_ENTRY_VALUE(352, MINT32)
CONFIG_ENTRY_VALUE(288, MINT32)
CONFIG_ENTRY_VALUE(MTK_SCALER_AVAILABLE_STREAM_CONFIGURATIONS_OUTPUT, MINT32)

CONFIG_ENTRY_VALUE(HAL_PIXEL_FORMAT_YCbCr_420_888, MINT32)
CONFIG_ENTRY_VALUE(320, MINT32)
CONFIG_ENTRY_VALUE(240, MINT32)
CONFIG_ENTRY_VALUE(MTK_SCALER_AVAILABLE_STREAM_CONFIGURATIONS_OUTPUT, MINT32)

CONFIG_ENTRY_VALUE(HAL_PIXEL_FORMAT_YCbCr_420_888, MINT32)
CONFIG_ENTRY_VALUE(176, MINT32)
CONFIG_ENTRY_VALUE(144, MINT32)
CONFIG_ENTRY_VALUE(MTK_SCALER_AVAILABLE_STREAM_CONFIGURATIONS_OUTPUT, MINT32)
#if 1
CONFIG_ENTRY_VALUE(HAL_PIXEL_FORMAT_IMPLEMENTATION_DEFINED, MINT32)
CONFIG_ENTRY_VALUE(2560, MINT32)
CONFIG_ENTRY_VALUE(1920, MINT32)
CONFIG_ENTRY_VALUE(MTK_SCALER_AVAILABLE_STREAM_CONFIGURATIONS_OUTPUT, MINT32)

CONFIG_ENTRY_VALUE(HAL_PIXEL_FORMAT_IMPLEMENTATION_DEFINED, MINT32)
CONFIG_ENTRY_VALUE(1920, MINT32)
CONFIG_ENTRY_VALUE(1088, MINT32)
CONFIG_ENTRY_VALUE(MTK_SCALER_AVAILABLE_STREAM_CONFIGURATIONS_OUTPUT, MINT32)

CONFIG_ENTRY_VALUE(HAL_PIXEL_FORMAT_IMPLEMENTATION_DEFINED, MINT32)
CONFIG_ENTRY_VALUE(1920, MINT32)
CONFIG_ENTRY_VALUE(1080, MINT32)
CONFIG_ENTRY_VALUE(MTK_SCALER_AVAILABLE_STREAM_CONFIGURATIONS_OUTPUT, MINT32)

CONFIG_ENTRY_VALUE(HAL_PIXEL_FORMAT_IMPLEMENTATION_DEFINED, MINT32)
CONFIG_ENTRY_VALUE(1280, MINT32)
CONFIG_ENTRY_VALUE(720, MINT32)
CONFIG_ENTRY_VALUE(MTK_SCALER_AVAILABLE_STREAM_CONFIGURATIONS_OUTPUT, MINT32)

CONFIG_ENTRY_VALUE(HAL_PIXEL_FORMAT_IMPLEMENTATION_DEFINED, MINT32)
CONFIG_ENTRY_VALUE(720, MINT32)
CONFIG_ENTRY_VALUE(480, MINT32)
CONFIG_ENTRY_VALUE(MTK_SCALER_AVAILABLE_STREAM_CONFIGURATIONS_OUTPUT, MINT32)
#endif
CONFIG_ENTRY_VALUE(HAL_PIXEL_FORMAT_IMPLEMENTATION_DEFINED, MINT32)
CONFIG_ENTRY_VALUE(640, MINT32)
CONFIG_ENTRY_VALUE(480, MINT32)
CONFIG_ENTRY_VALUE(MTK_SCALER_AVAILABLE_STREAM_CONFIGURATIONS_OUTPUT, MINT32)

CONFIG_ENTRY_VALUE(HAL_PIXEL_FORMAT_IMPLEMENTATION_DEFINED, MINT32)
CONFIG_ENTRY_VALUE(352, MINT32)
CONFIG_ENTRY_VALUE(288, MINT32)
CONFIG_ENTRY_VALUE(MTK_SCALER_AVAILABLE_STREAM_CONFIGURATIONS_OUTPUT, MINT32)

CONFIG_ENTRY_VALUE(HAL_PIXEL_FORMAT_IMPLEMENTATION_DEFINED, MINT32)
CONFIG_ENTRY_VALUE(320, MINT32)
CONFIG_ENTRY_VALUE(240, MINT32)
CONFIG_ENTRY_VALUE(MTK_SCALER_AVAILABLE_STREAM_CONFIGURATIONS_OUTPUT, MINT32)

CONFIG_ENTRY_VALUE(HAL_PIXEL_FORMAT_IMPLEMENTATION_DEFINED, MINT32)
CONFIG_ENTRY_VALUE(176, MINT32)
CONFIG_ENTRY_VALUE(144, MINT32)
CONFIG_ENTRY_VALUE(MTK_SCALER_AVAILABLE_STREAM_CONFIGURATIONS_OUTPUT, MINT32)

#if 1
CONFIG_ENTRY_VALUE(HAL_PIXEL_FORMAT_YV12, MINT32)
CONFIG_ENTRY_VALUE(2560, MINT32)
CONFIG_ENTRY_VALUE(1920, MINT32)
CONFIG_ENTRY_VALUE(MTK_SCALER_AVAILABLE_STREAM_CONFIGURATIONS_OUTPUT, MINT32)

CONFIG_ENTRY_VALUE(HAL_PIXEL_FORMAT_YV12, MINT32)
CONFIG_ENTRY_VALUE(1920, MINT32)
CONFIG_ENTRY_VALUE(1088, MINT32)
CONFIG_ENTRY_VALUE(MTK_SCALER_AVAILABLE_STREAM_CONFIGURATIONS_OUTPUT, MINT32)

CONFIG_ENTRY_VALUE(HAL_PIXEL_FORMAT_YV12, MINT32)
CONFIG_ENTRY_VALUE(1920, MINT32)
CONFIG_ENTRY_VALUE(1080, MINT32)
CONFIG_ENTRY_VALUE(MTK_SCALER_AVAILABLE_STREAM_CONFIGURATIONS_OUTPUT, MINT32)

CONFIG_ENTRY_VALUE(HAL_PIXEL_FORMAT_YV12, MINT32)
CONFIG_ENTRY_VALUE(1280, MINT32)
CONFIG_ENTRY_VALUE(720, MINT32)
CONFIG_ENTRY_VALUE(MTK_SCALER_AVAILABLE_STREAM_CONFIGURATIONS_OUTPUT, MINT32)

CONFIG_ENTRY_VALUE(HAL_PIXEL_FORMAT_YV12, MINT32)
CONFIG_ENTRY_VALUE(720, MINT32)
CONFIG_ENTRY_VALUE(480, MINT32)
CONFIG_ENTRY_VALUE(MTK_SCALER_AVAILABLE_STREAM_CONFIGURATIONS_OUTPUT, MINT32)
#endif
CONFIG_ENTRY_VALUE(HAL_PIXEL_FORMAT_YV12, MINT32)
CONFIG_ENTRY_VALUE(640, MINT32)
CONFIG_ENTRY_VALUE(480, MINT32)
CONFIG_ENTRY_VALUE(MTK_SCALER_AVAILABLE_STREAM_CONFIGURATIONS_OUTPUT, MINT32)

CONFIG_ENTRY_VALUE(HAL_PIXEL_FORMAT_YV12, MINT32)
CONFIG_ENTRY_VALUE(352, MINT32)
CONFIG_ENTRY_VALUE(288, MINT32)
CONFIG_ENTRY_VALUE(MTK_SCALER_AVAILABLE_STREAM_CONFIGURATIONS_OUTPUT, MINT32)

CONFIG_ENTRY_VALUE(HAL_PIXEL_FORMAT_YV12, MINT32)
CONFIG_ENTRY_VALUE(320, MINT32)
CONFIG_ENTRY_VALUE(240, MINT32)
CONFIG_ENTRY_VALUE(MTK_SCALER_AVAILABLE_STREAM_CONFIGURATIONS_OUTPUT, MINT32)

CONFIG_ENTRY_VALUE(HAL_PIXEL_FORMAT_YV12, MINT32)
CONFIG_ENTRY_VALUE(176, MINT32)
CONFIG_ENTRY_VALUE(144, MINT32)
CONFIG_ENTRY_VALUE(MTK_SCALER_AVAILABLE_STREAM_CONFIGURATIONS_OUTPUT, MINT32)

CONFIG_METADATA_END()
//==========================================================================
CONFIG_METADATA_BEGIN(MTK_SCALER_AVAILABLE_MIN_FRAME_DURATIONS)//new hidden
CONFIG_ENTRY_VALUE(HAL_PIXEL_FORMAT_BLOB, MINT64)
CONFIG_ENTRY_VALUE(2560, MINT64)
CONFIG_ENTRY_VALUE(1920, MINT64)
CONFIG_ENTRY_VALUE(33333333, MINT64)

CONFIG_ENTRY_VALUE(HAL_PIXEL_FORMAT_BLOB, MINT64)
CONFIG_ENTRY_VALUE(1920, MINT64)
CONFIG_ENTRY_VALUE(1088, MINT64)
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

CONFIG_ENTRY_VALUE(HAL_PIXEL_FORMAT_RAW16, MINT64)
CONFIG_ENTRY_VALUE(2560, MINT64)
CONFIG_ENTRY_VALUE(1920, MINT64)
CONFIG_ENTRY_VALUE(33333333, MINT64)

CONFIG_ENTRY_VALUE(HAL_PIXEL_FORMAT_YCbCr_420_888, MINT64)
CONFIG_ENTRY_VALUE(2560, MINT64)
CONFIG_ENTRY_VALUE(1920, MINT64)
CONFIG_ENTRY_VALUE(33333333, MINT64)

CONFIG_ENTRY_VALUE(HAL_PIXEL_FORMAT_YCbCr_420_888, MINT64)
CONFIG_ENTRY_VALUE(1920, MINT64)
CONFIG_ENTRY_VALUE(1088, MINT64)
CONFIG_ENTRY_VALUE(33333333, MINT64)

CONFIG_ENTRY_VALUE(HAL_PIXEL_FORMAT_YCbCr_420_888, MINT64)
CONFIG_ENTRY_VALUE(1920, MINT64)
CONFIG_ENTRY_VALUE(1080, MINT64)
CONFIG_ENTRY_VALUE(33333333, MINT64)

CONFIG_ENTRY_VALUE(HAL_PIXEL_FORMAT_YCbCr_420_888, MINT64)
CONFIG_ENTRY_VALUE(1280, MINT64)
CONFIG_ENTRY_VALUE(720, MINT64)
CONFIG_ENTRY_VALUE(33333333, MINT64)

CONFIG_ENTRY_VALUE(HAL_PIXEL_FORMAT_YCbCr_420_888, MINT64)
CONFIG_ENTRY_VALUE(720, MINT64)
CONFIG_ENTRY_VALUE(480, MINT64)
CONFIG_ENTRY_VALUE(33333333, MINT64)

CONFIG_ENTRY_VALUE(HAL_PIXEL_FORMAT_YCbCr_420_888, MINT64)
CONFIG_ENTRY_VALUE(640, MINT64)
CONFIG_ENTRY_VALUE(480, MINT64)
CONFIG_ENTRY_VALUE(33333333, MINT64)

CONFIG_ENTRY_VALUE(HAL_PIXEL_FORMAT_YCbCr_420_888, MINT64)
CONFIG_ENTRY_VALUE(352, MINT64)
CONFIG_ENTRY_VALUE(288, MINT64)
CONFIG_ENTRY_VALUE(33333333, MINT64)

CONFIG_ENTRY_VALUE(HAL_PIXEL_FORMAT_YCbCr_420_888, MINT64)
CONFIG_ENTRY_VALUE(320, MINT64)
CONFIG_ENTRY_VALUE(240, MINT64)
CONFIG_ENTRY_VALUE(33333333, MINT64)

CONFIG_ENTRY_VALUE(HAL_PIXEL_FORMAT_YCbCr_420_888, MINT64)
CONFIG_ENTRY_VALUE(176, MINT64)
CONFIG_ENTRY_VALUE(144, MINT64)
CONFIG_ENTRY_VALUE(33333333, MINT64)

CONFIG_ENTRY_VALUE(HAL_PIXEL_FORMAT_IMPLEMENTATION_DEFINED, MINT64)
CONFIG_ENTRY_VALUE(2560, MINT64)
CONFIG_ENTRY_VALUE(1920, MINT64)
CONFIG_ENTRY_VALUE(33333333, MINT64)

CONFIG_ENTRY_VALUE(HAL_PIXEL_FORMAT_IMPLEMENTATION_DEFINED, MINT64)
CONFIG_ENTRY_VALUE(1920, MINT64)
CONFIG_ENTRY_VALUE(1088, MINT64)
CONFIG_ENTRY_VALUE(33333333, MINT64)

CONFIG_ENTRY_VALUE(HAL_PIXEL_FORMAT_IMPLEMENTATION_DEFINED, MINT64)
CONFIG_ENTRY_VALUE(1920, MINT64)
CONFIG_ENTRY_VALUE(1080, MINT64)
CONFIG_ENTRY_VALUE(33333333, MINT64)

CONFIG_ENTRY_VALUE(HAL_PIXEL_FORMAT_IMPLEMENTATION_DEFINED, MINT64)
CONFIG_ENTRY_VALUE(1280, MINT64)
CONFIG_ENTRY_VALUE(720, MINT64)
CONFIG_ENTRY_VALUE(33333333, MINT64)

CONFIG_ENTRY_VALUE(HAL_PIXEL_FORMAT_IMPLEMENTATION_DEFINED, MINT64)
CONFIG_ENTRY_VALUE(720, MINT64)
CONFIG_ENTRY_VALUE(480, MINT64)
CONFIG_ENTRY_VALUE(33333333, MINT64)

CONFIG_ENTRY_VALUE(HAL_PIXEL_FORMAT_IMPLEMENTATION_DEFINED, MINT64)
CONFIG_ENTRY_VALUE(640, MINT64)
CONFIG_ENTRY_VALUE(480, MINT64)
CONFIG_ENTRY_VALUE(33333333, MINT64)

CONFIG_ENTRY_VALUE(HAL_PIXEL_FORMAT_IMPLEMENTATION_DEFINED, MINT64)
CONFIG_ENTRY_VALUE(352, MINT64)
CONFIG_ENTRY_VALUE(288, MINT64)
CONFIG_ENTRY_VALUE(33333333, MINT64)

CONFIG_ENTRY_VALUE(HAL_PIXEL_FORMAT_IMPLEMENTATION_DEFINED, MINT64)
CONFIG_ENTRY_VALUE(320, MINT64)
CONFIG_ENTRY_VALUE(240, MINT64)
CONFIG_ENTRY_VALUE(33333333, MINT64)

CONFIG_ENTRY_VALUE(HAL_PIXEL_FORMAT_IMPLEMENTATION_DEFINED, MINT64)
CONFIG_ENTRY_VALUE(176, MINT64)
CONFIG_ENTRY_VALUE(144, MINT64)
CONFIG_ENTRY_VALUE(33333333, MINT64)
CONFIG_ENTRY_VALUE(HAL_PIXEL_FORMAT_IMPLEMENTATION_DEFINED, MINT64)
CONFIG_ENTRY_VALUE(320, MINT64)
CONFIG_ENTRY_VALUE(240, MINT64)
CONFIG_ENTRY_VALUE(33333333, MINT64)

CONFIG_ENTRY_VALUE(HAL_PIXEL_FORMAT_IMPLEMENTATION_DEFINED, MINT64)
CONFIG_ENTRY_VALUE(176, MINT64)
CONFIG_ENTRY_VALUE(144, MINT64)
CONFIG_ENTRY_VALUE(33333333, MINT64)

CONFIG_ENTRY_VALUE(HAL_PIXEL_FORMAT_YV12, MINT64)
CONFIG_ENTRY_VALUE(2560, MINT64)
CONFIG_ENTRY_VALUE(1920, MINT64)
CONFIG_ENTRY_VALUE(33333333, MINT64)

CONFIG_ENTRY_VALUE(HAL_PIXEL_FORMAT_YV12, MINT64)
CONFIG_ENTRY_VALUE(1920, MINT64)
CONFIG_ENTRY_VALUE(1088, MINT64)
CONFIG_ENTRY_VALUE(33333333, MINT64)

CONFIG_ENTRY_VALUE(HAL_PIXEL_FORMAT_YV12, MINT64)
CONFIG_ENTRY_VALUE(1920, MINT64)
CONFIG_ENTRY_VALUE(1080, MINT64)
CONFIG_ENTRY_VALUE(33333333, MINT64)

CONFIG_ENTRY_VALUE(HAL_PIXEL_FORMAT_YV12, MINT64)
CONFIG_ENTRY_VALUE(1280, MINT64)
CONFIG_ENTRY_VALUE(720, MINT64)
CONFIG_ENTRY_VALUE(33333333, MINT64)

CONFIG_ENTRY_VALUE(HAL_PIXEL_FORMAT_YV12, MINT64)
CONFIG_ENTRY_VALUE(720, MINT64)
CONFIG_ENTRY_VALUE(480, MINT64)
CONFIG_ENTRY_VALUE(33333333, MINT64)

CONFIG_ENTRY_VALUE(HAL_PIXEL_FORMAT_YV12, MINT64)
CONFIG_ENTRY_VALUE(640, MINT64)
CONFIG_ENTRY_VALUE(480, MINT64)
CONFIG_ENTRY_VALUE(33333333, MINT64)

CONFIG_ENTRY_VALUE(HAL_PIXEL_FORMAT_YV12, MINT64)
CONFIG_ENTRY_VALUE(352, MINT64)
CONFIG_ENTRY_VALUE(288, MINT64)
CONFIG_ENTRY_VALUE(33333333, MINT64)

CONFIG_ENTRY_VALUE(HAL_PIXEL_FORMAT_YV12, MINT64)
CONFIG_ENTRY_VALUE(320, MINT64)
CONFIG_ENTRY_VALUE(240, MINT64)
CONFIG_ENTRY_VALUE(33333333, MINT64)

CONFIG_ENTRY_VALUE(HAL_PIXEL_FORMAT_YV12, MINT64)
CONFIG_ENTRY_VALUE(176, MINT64)
CONFIG_ENTRY_VALUE(144, MINT64)
CONFIG_ENTRY_VALUE(33333333, MINT64)
CONFIG_ENTRY_VALUE(HAL_PIXEL_FORMAT_YV12, MINT64)
CONFIG_ENTRY_VALUE(320, MINT64)
CONFIG_ENTRY_VALUE(240, MINT64)
CONFIG_ENTRY_VALUE(33333333, MINT64)

CONFIG_ENTRY_VALUE(HAL_PIXEL_FORMAT_YV12, MINT64)
CONFIG_ENTRY_VALUE(176, MINT64)
CONFIG_ENTRY_VALUE(144, MINT64)
CONFIG_ENTRY_VALUE(33333333, MINT64)
CONFIG_METADATA_END()
//==========================================================================
CONFIG_METADATA_BEGIN(MTK_SCALER_AVAILABLE_STALL_DURATIONS)//new hidden
CONFIG_ENTRY_VALUE(HAL_PIXEL_FORMAT_BLOB, MINT64)
CONFIG_ENTRY_VALUE(2560, MINT64)
CONFIG_ENTRY_VALUE(1920, MINT64)
CONFIG_ENTRY_VALUE(33333333, MINT64)

CONFIG_ENTRY_VALUE(HAL_PIXEL_FORMAT_BLOB, MINT64)
CONFIG_ENTRY_VALUE(1920, MINT64)
CONFIG_ENTRY_VALUE(1088, MINT64)
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

CONFIG_ENTRY_VALUE(HAL_PIXEL_FORMAT_RAW16, MINT64)
CONFIG_ENTRY_VALUE(2560, MINT64)
CONFIG_ENTRY_VALUE(1920, MINT64)
CONFIG_ENTRY_VALUE(33333333, MINT64)

CONFIG_ENTRY_VALUE(HAL_PIXEL_FORMAT_YCbCr_420_888, MINT64)
CONFIG_ENTRY_VALUE(2560, MINT64)
CONFIG_ENTRY_VALUE(1920, MINT64)
CONFIG_ENTRY_VALUE(0   , MINT64)

CONFIG_ENTRY_VALUE(HAL_PIXEL_FORMAT_YCbCr_420_888, MINT64)
CONFIG_ENTRY_VALUE(1920, MINT64)
CONFIG_ENTRY_VALUE(1088, MINT64)
CONFIG_ENTRY_VALUE(0   , MINT64)

CONFIG_ENTRY_VALUE(HAL_PIXEL_FORMAT_YCbCr_420_888, MINT64)
CONFIG_ENTRY_VALUE(1920, MINT64)
CONFIG_ENTRY_VALUE(1080, MINT64)
CONFIG_ENTRY_VALUE(0, MINT64)

CONFIG_ENTRY_VALUE(HAL_PIXEL_FORMAT_YCbCr_420_888, MINT64)
CONFIG_ENTRY_VALUE(1280, MINT64)
CONFIG_ENTRY_VALUE(720, MINT64)
CONFIG_ENTRY_VALUE(0, MINT64)

CONFIG_ENTRY_VALUE(HAL_PIXEL_FORMAT_YCbCr_420_888, MINT64)
CONFIG_ENTRY_VALUE(720, MINT64)
CONFIG_ENTRY_VALUE(480, MINT64)
CONFIG_ENTRY_VALUE(0, MINT64)

CONFIG_ENTRY_VALUE(HAL_PIXEL_FORMAT_YCbCr_420_888, MINT64)
CONFIG_ENTRY_VALUE(640, MINT64)
CONFIG_ENTRY_VALUE(480, MINT64)
CONFIG_ENTRY_VALUE(0, MINT64)

CONFIG_ENTRY_VALUE(HAL_PIXEL_FORMAT_YCbCr_420_888, MINT64)
CONFIG_ENTRY_VALUE(352, MINT64)
CONFIG_ENTRY_VALUE(288, MINT64)
CONFIG_ENTRY_VALUE(0, MINT64)

CONFIG_ENTRY_VALUE(HAL_PIXEL_FORMAT_YCbCr_420_888, MINT64)
CONFIG_ENTRY_VALUE(320, MINT64)
CONFIG_ENTRY_VALUE(240, MINT64)
CONFIG_ENTRY_VALUE(0, MINT64)

CONFIG_ENTRY_VALUE(HAL_PIXEL_FORMAT_YCbCr_420_888, MINT64)
CONFIG_ENTRY_VALUE(176, MINT64)
CONFIG_ENTRY_VALUE(144, MINT64)
CONFIG_ENTRY_VALUE(0, MINT64)

CONFIG_ENTRY_VALUE(HAL_PIXEL_FORMAT_IMPLEMENTATION_DEFINED, MINT64)
CONFIG_ENTRY_VALUE(2560, MINT64)
CONFIG_ENTRY_VALUE(1920, MINT64)
CONFIG_ENTRY_VALUE(0   , MINT64)

CONFIG_ENTRY_VALUE(HAL_PIXEL_FORMAT_IMPLEMENTATION_DEFINED, MINT64)
CONFIG_ENTRY_VALUE(1920, MINT64)
CONFIG_ENTRY_VALUE(1088, MINT64)
CONFIG_ENTRY_VALUE(0   , MINT64)

CONFIG_ENTRY_VALUE(HAL_PIXEL_FORMAT_IMPLEMENTATION_DEFINED, MINT64)
CONFIG_ENTRY_VALUE(1920, MINT64)
CONFIG_ENTRY_VALUE(1080, MINT64)
CONFIG_ENTRY_VALUE(0, MINT64)

CONFIG_ENTRY_VALUE(HAL_PIXEL_FORMAT_IMPLEMENTATION_DEFINED, MINT64)
CONFIG_ENTRY_VALUE(1280, MINT64)
CONFIG_ENTRY_VALUE(720, MINT64)
CONFIG_ENTRY_VALUE(0, MINT64)

CONFIG_ENTRY_VALUE(HAL_PIXEL_FORMAT_IMPLEMENTATION_DEFINED, MINT64)
CONFIG_ENTRY_VALUE(720, MINT64)
CONFIG_ENTRY_VALUE(480, MINT64)
CONFIG_ENTRY_VALUE(0, MINT64)

CONFIG_ENTRY_VALUE(HAL_PIXEL_FORMAT_IMPLEMENTATION_DEFINED, MINT64)
CONFIG_ENTRY_VALUE(640, MINT64)
CONFIG_ENTRY_VALUE(480, MINT64)
CONFIG_ENTRY_VALUE(0, MINT64)

CONFIG_ENTRY_VALUE(HAL_PIXEL_FORMAT_IMPLEMENTATION_DEFINED, MINT64)
CONFIG_ENTRY_VALUE(352, MINT64)
CONFIG_ENTRY_VALUE(288, MINT64)
CONFIG_ENTRY_VALUE(0, MINT64)

CONFIG_ENTRY_VALUE(HAL_PIXEL_FORMAT_IMPLEMENTATION_DEFINED, MINT64)
CONFIG_ENTRY_VALUE(320, MINT64)
CONFIG_ENTRY_VALUE(240, MINT64)
CONFIG_ENTRY_VALUE(0, MINT64)

CONFIG_ENTRY_VALUE(HAL_PIXEL_FORMAT_IMPLEMENTATION_DEFINED, MINT64)
CONFIG_ENTRY_VALUE(176, MINT64)
CONFIG_ENTRY_VALUE(144, MINT64)
CONFIG_ENTRY_VALUE(0, MINT64)

CONFIG_ENTRY_VALUE(HAL_PIXEL_FORMAT_YV12, MINT64)
CONFIG_ENTRY_VALUE(2560, MINT64)
CONFIG_ENTRY_VALUE(1920, MINT64)
CONFIG_ENTRY_VALUE(0   , MINT64)

CONFIG_ENTRY_VALUE(HAL_PIXEL_FORMAT_YV12, MINT64)
CONFIG_ENTRY_VALUE(1920, MINT64)
CONFIG_ENTRY_VALUE(1088, MINT64)
CONFIG_ENTRY_VALUE(0   , MINT64)

CONFIG_ENTRY_VALUE(HAL_PIXEL_FORMAT_YV12, MINT64)
CONFIG_ENTRY_VALUE(1920, MINT64)
CONFIG_ENTRY_VALUE(1080, MINT64)
CONFIG_ENTRY_VALUE(0, MINT64)

CONFIG_ENTRY_VALUE(HAL_PIXEL_FORMAT_YV12, MINT64)
CONFIG_ENTRY_VALUE(1280, MINT64)
CONFIG_ENTRY_VALUE(720, MINT64)
CONFIG_ENTRY_VALUE(0, MINT64)

CONFIG_ENTRY_VALUE(HAL_PIXEL_FORMAT_YV12, MINT64)
CONFIG_ENTRY_VALUE(720, MINT64)
CONFIG_ENTRY_VALUE(480, MINT64)
CONFIG_ENTRY_VALUE(0, MINT64)

CONFIG_ENTRY_VALUE(HAL_PIXEL_FORMAT_YV12, MINT64)
CONFIG_ENTRY_VALUE(640, MINT64)
CONFIG_ENTRY_VALUE(480, MINT64)
CONFIG_ENTRY_VALUE(0, MINT64)

CONFIG_ENTRY_VALUE(HAL_PIXEL_FORMAT_YV12, MINT64)
CONFIG_ENTRY_VALUE(352, MINT64)
CONFIG_ENTRY_VALUE(288, MINT64)
CONFIG_ENTRY_VALUE(0, MINT64)

CONFIG_ENTRY_VALUE(HAL_PIXEL_FORMAT_YV12, MINT64)
CONFIG_ENTRY_VALUE(320, MINT64)
CONFIG_ENTRY_VALUE(240, MINT64)
CONFIG_ENTRY_VALUE(0, MINT64)

CONFIG_ENTRY_VALUE(HAL_PIXEL_FORMAT_YV12, MINT64)
CONFIG_ENTRY_VALUE(176, MINT64)
CONFIG_ENTRY_VALUE(144, MINT64)
CONFIG_ENTRY_VALUE(0, MINT64)
CONFIG_METADATA_END()
//==========================================================================
/*CONFIG_METADATA_BEGIN(MTK_SCALER_STREAM_CONFIGURATION_MAP)//new synthetic
    CONFIG_ENTRY_VALUE( , MINT32)
CONFIG_METADATA_END()*/
//==========================================================================
CONFIG_METADATA_BEGIN(MTK_SCALER_CROPPING_TYPE)//new
CONFIG_ENTRY_VALUE(MTK_SCALER_CROPPING_TYPE_FREEFORM , MUINT8)
CONFIG_METADATA_END()
//==========================================================================
//    [ ANDROID_SCALER_MAX_DIGITAL_ZOOM - ANDROID_SCALER_START ] =
//    { "maxDigitalZoom",                TYPE_FLOAT  },
//==========================================================================
//------------------------------------------------------------------------------
//  android.jpeg
//------------------------------------------------------------------------------
CONFIG_METADATA_BEGIN(MTK_JPEG_AVAILABLE_THUMBNAIL_SIZES)
CONFIG_ENTRY_VALUE(MSize(0,   0), MSize)
CONFIG_ENTRY_VALUE(MSize(160, 96), MSize)
CONFIG_ENTRY_VALUE(MSize(192, 108), MSize)
CONFIG_ENTRY_VALUE(MSize(192, 144), MSize)
CONFIG_METADATA_END()
//==========================================================================
CONFIG_METADATA_BEGIN(MTK_JPEG_MAX_SIZE)//
CONFIG_ENTRY_VALUE(5898240, MINT32) //2560*1920*2*0.6
CONFIG_METADATA_END()
//==========================================================================
//    [ ANDROID_JPEG_SIZE - ANDROID_JPEG_START ] =
//    { "size",                          TYPE_INT32  },
//==========================================================================
//------------------------------------------------------------------------------
STATIC_METADATA_END()
