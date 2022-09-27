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



STATIC_METADATA2_BEGIN(DEVICE, SENSOR, COMMON)
//------------------------------------------------------------------------------
//  android.sensor
//------------------------------------------------------------------------------
//==========================================================================
CONFIG_METADATA_BEGIN(MTK_SENSOR_BLACK_LEVEL_PATTERN)
CONFIG_ENTRY_VALUE(0, MINT32)
CONFIG_ENTRY_VALUE(0, MINT32)
CONFIG_ENTRY_VALUE(0, MINT32)
CONFIG_ENTRY_VALUE(0, MINT32)
CONFIG_METADATA_END()
//==========================================================================
//------------------------------------------------------------------------------
//  android.sensor.info
//------------------------------------------------------------------------------
//==========================================================================
CONFIG_METADATA_BEGIN(MTK_SENSOR_INFO_ACTIVE_ARRAY_REGION)
CONFIG_ENTRY_VALUE(MRect(MPoint(0, 0), MSize(2560, 1920)), MRect)
CONFIG_METADATA_END()
//==========================================================================
CONFIG_METADATA_BEGIN(MTK_SENSOR_INFO_SENSITIVITY_RANGE)
CONFIG_ENTRY_VALUE(100, MINT32)
CONFIG_ENTRY_VALUE(6400, MINT32)
CONFIG_METADATA_END()
//==========================================================================
CONFIG_METADATA_BEGIN(MTK_SENSOR_INFO_COLOR_FILTER_ARRANGEMENT)
CONFIG_ENTRY_VALUE(MTK_SENSOR_INFO_COLOR_FILTER_ARRANGEMENT_GRBG, MUINT8)
CONFIG_METADATA_END()
//==========================================================================
CONFIG_METADATA_BEGIN(MTK_SENSOR_INFO_EXPOSURE_TIME_RANGE)// 1 us - 30 sec
CONFIG_ENTRY_VALUE(100000L, MINT64)
CONFIG_ENTRY_VALUE(400000000L, MINT64)
CONFIG_METADATA_END()
//==========================================================================
CONFIG_METADATA_BEGIN(MTK_SENSOR_INFO_MAX_FRAME_DURATION)// 30 sec
CONFIG_ENTRY_VALUE(400000000L, MINT64)
CONFIG_METADATA_END()
//==========================================================================
CONFIG_METADATA_BEGIN(MTK_SENSOR_INFO_PHYSICAL_SIZE) // mm
CONFIG_ENTRY_VALUE(4.71f, MFLOAT)
CONFIG_ENTRY_VALUE(3.49f, MFLOAT)
CONFIG_METADATA_END()
//==========================================================================
CONFIG_METADATA_BEGIN(MTK_SENSOR_INFO_PIXEL_ARRAY_SIZE)
CONFIG_ENTRY_VALUE(MSize(2560, 1920), MSize)
CONFIG_METADATA_END()
//==========================================================================
CONFIG_METADATA_BEGIN(MTK_SENSOR_INFO_WHITE_LEVEL)
CONFIG_ENTRY_VALUE(1023, MINT32)
CONFIG_METADATA_END()
//==========================================================================
CONFIG_METADATA_BEGIN(MTK_SENSOR_INFO_TIMESTAMP_SOURCE)
CONFIG_ENTRY_VALUE(MTK_SENSOR_INFO_TIMESTAMP_SOURCE_UNKNOWN, MUINT8)
//CONFIG_ENTRY_VALUE(MTK_SENSOR_INFO_TIMESTAMP_SOURCE_REALTIME, MUINT8)
CONFIG_METADATA_END()
//==========================================================================
CONFIG_METADATA_BEGIN(MTK_SENSOR_MAX_ANALOG_SENSITIVITY)
CONFIG_ENTRY_VALUE(240, MINT32)
CONFIG_METADATA_END()
//==========================================================================
CONFIG_METADATA_BEGIN(MTK_SENSOR_BASE_GAIN_FACTOR)
CONFIG_ENTRY_VALUE(MRational(42, 256), MRational)
CONFIG_METADATA_END()
//==========================================================================
CONFIG_METADATA_BEGIN(MTK_SENSOR_INFO_ORIENTATION)
CONFIG_ENTRY_VALUE(90, MINT32)
CONFIG_METADATA_END()
//==========================================================================
CONFIG_METADATA_BEGIN(MTK_SENSOR_PROFILE_HUE_SAT_MAP_DIMENSIONS)
CONFIG_ENTRY_VALUE(1, MINT32)
CONFIG_ENTRY_VALUE(2, MINT32)
CONFIG_ENTRY_VALUE(1, MINT32)
CONFIG_METADATA_END()
//==========================================================================
CONFIG_METADATA_BEGIN(MTK_SENSOR_AVAILABLE_TEST_PATTERN_MODES)
CONFIG_ENTRY_VALUE(0, MINT32)
CONFIG_METADATA_END()
//==========================================================================
CONFIG_METADATA_BEGIN(MTK_SENSOR_INFO_PACKAGE)
//----------------------------------------------------------------------
CONFIG_ENTRY_METADATA(
    //..................................................................
    CONFIG_METADATA2_BEGIN(MTK_SENSOR_INFO_SCENARIO_ID)
    CONFIG_ENTRY_VALUE(MTK_SENSOR_INFO_SCENARIO_ID_NORMAL_PREVIEW, MINT32)
    CONFIG_METADATA2_END()
    //..................................................................
    CONFIG_METADATA2_BEGIN(MTK_SENSOR_INFO_FRAME_RATE)
    CONFIG_ENTRY_VALUE(30, MINT32)
    CONFIG_METADATA2_END()
    //..................................................................
    CONFIG_METADATA2_BEGIN(MTK_SENSOR_INFO_OUTPUT_REGION_ON_ACTIVE_ARRAY)
    CONFIG_ENTRY_VALUE(MRect(MPoint(0, 0), MSize(2664, 1500)), MRect)
    CONFIG_METADATA2_END()
    //..................................................................
    CONFIG_METADATA2_BEGIN(MTK_SENSOR_INFO_REAL_OUTPUT_SIZE)
    CONFIG_ENTRY_VALUE(MSize(5880, 3168), MSize)
    CONFIG_METADATA2_END()
    //..................................................................
    CONFIG_METADATA2_BEGIN(MTK_SENSOR_ROLLING_SHUTTER_SKEW)
    CONFIG_ENTRY_VALUE(33000000, MINT64) // nanosecond
    CONFIG_METADATA2_END()
    //..................................................................
)
//----------------------------------------------------------------------
CONFIG_ENTRY_METADATA(
    //..................................................................
    CONFIG_METADATA2_BEGIN(MTK_SENSOR_INFO_SCENARIO_ID)
    CONFIG_ENTRY_VALUE(MTK_SENSOR_INFO_SCENARIO_ID_NORMAL_CAPTURE, MINT32)
    CONFIG_METADATA2_END()
    //..................................................................
    CONFIG_METADATA2_BEGIN(MTK_SENSOR_INFO_FRAME_RATE)
    CONFIG_ENTRY_VALUE(30, MINT32)
    CONFIG_METADATA2_END()
    //..................................................................
    CONFIG_METADATA2_BEGIN(MTK_SENSOR_INFO_OUTPUT_REGION_ON_ACTIVE_ARRAY)
    CONFIG_ENTRY_VALUE(MRect(MPoint(0, 0), MSize(5328, 3000)), MRect)
    CONFIG_METADATA2_END()
    //..................................................................
    CONFIG_METADATA2_BEGIN(MTK_SENSOR_INFO_REAL_OUTPUT_SIZE)
    CONFIG_ENTRY_VALUE(MSize(5880, 3174), MSize)
    CONFIG_METADATA2_END()
    //..................................................................
    CONFIG_METADATA2_BEGIN(MTK_SENSOR_ROLLING_SHUTTER_SKEW)
    CONFIG_ENTRY_VALUE(33000000, MINT64) // nanosecond
    CONFIG_METADATA2_END()
    //..................................................................
)
//----------------------------------------------------------------------
CONFIG_ENTRY_METADATA(
    //..................................................................
    CONFIG_METADATA2_BEGIN(MTK_SENSOR_INFO_SCENARIO_ID)
    CONFIG_ENTRY_VALUE(MTK_SENSOR_INFO_SCENARIO_ID_NORMAL_VIDEO, MINT32)
    CONFIG_METADATA2_END()
    //..................................................................
    CONFIG_METADATA2_BEGIN(MTK_SENSOR_INFO_FRAME_RATE)
    CONFIG_ENTRY_VALUE(30, MINT32)
    CONFIG_METADATA2_END()
    //..................................................................
    CONFIG_METADATA2_BEGIN(MTK_SENSOR_INFO_OUTPUT_REGION_ON_ACTIVE_ARRAY)
    CONFIG_ENTRY_VALUE(MRect(MPoint(2, 2), MSize(5328, 3000)), MRect)
    CONFIG_METADATA2_END()
    //..................................................................
    CONFIG_METADATA2_BEGIN(MTK_SENSOR_INFO_REAL_OUTPUT_SIZE)
    CONFIG_ENTRY_VALUE(MSize(5880, 3174), MSize)
    CONFIG_METADATA2_END()
    //..................................................................
    CONFIG_METADATA2_BEGIN(MTK_SENSOR_ROLLING_SHUTTER_SKEW)
    CONFIG_ENTRY_VALUE(33000000, MINT64) // nanosecond
    CONFIG_METADATA2_END()
    //..................................................................
)
//----------------------------------------------------------------------
CONFIG_METADATA_END()
//==========================================================================
CONFIG_METADATA_BEGIN(MTK_SENSOR_REFERENCE_ILLUMINANT1)
CONFIG_ENTRY_VALUE(MTK_SENSOR_REFERENCE_ILLUMINANT1_DAYLIGHT, MUINT8)
CONFIG_METADATA_END()
//==========================================================================
CONFIG_METADATA_BEGIN(MTK_SENSOR_REFERENCE_ILLUMINANT2)
CONFIG_ENTRY_VALUE(MTK_SENSOR_REFERENCE_ILLUMINANT1_DAYLIGHT, MUINT8)
CONFIG_METADATA_END()
//==========================================================================
CONFIG_METADATA_BEGIN(MTK_SENSOR_CALIBRATION_TRANSFORM1)
CONFIG_ENTRY_VALUE(MRational(1, 1), MRational)
CONFIG_ENTRY_VALUE(MRational(0, 1), MRational)
CONFIG_ENTRY_VALUE(MRational(0, 1), MRational)
CONFIG_ENTRY_VALUE(MRational(0, 1), MRational)
CONFIG_ENTRY_VALUE(MRational(1, 1), MRational)
CONFIG_ENTRY_VALUE(MRational(0, 1), MRational)
CONFIG_ENTRY_VALUE(MRational(0, 1), MRational)
CONFIG_ENTRY_VALUE(MRational(0, 1), MRational)
CONFIG_ENTRY_VALUE(MRational(1, 1), MRational)
CONFIG_METADATA_END()
//==========================================================================
CONFIG_METADATA_BEGIN(MTK_SENSOR_CALIBRATION_TRANSFORM2)
CONFIG_ENTRY_VALUE(MRational(1, 1), MRational)
CONFIG_ENTRY_VALUE(MRational(0, 1), MRational)
CONFIG_ENTRY_VALUE(MRational(0, 1), MRational)
CONFIG_ENTRY_VALUE(MRational(0, 1), MRational)
CONFIG_ENTRY_VALUE(MRational(1, 1), MRational)
CONFIG_ENTRY_VALUE(MRational(0, 1), MRational)
CONFIG_ENTRY_VALUE(MRational(0, 1), MRational)
CONFIG_ENTRY_VALUE(MRational(0, 1), MRational)
CONFIG_ENTRY_VALUE(MRational(1, 1), MRational)
CONFIG_METADATA_END()
//==========================================================================
CONFIG_METADATA_BEGIN(MTK_SENSOR_COLOR_TRANSFORM1)
CONFIG_ENTRY_VALUE(MRational(1, 1), MRational)
CONFIG_ENTRY_VALUE(MRational(0, 1), MRational)
CONFIG_ENTRY_VALUE(MRational(0, 1), MRational)
CONFIG_ENTRY_VALUE(MRational(0, 1), MRational)
CONFIG_ENTRY_VALUE(MRational(1, 1), MRational)
CONFIG_ENTRY_VALUE(MRational(0, 1), MRational)
CONFIG_ENTRY_VALUE(MRational(0, 1), MRational)
CONFIG_ENTRY_VALUE(MRational(0, 1), MRational)
CONFIG_ENTRY_VALUE(MRational(1, 1), MRational)
CONFIG_METADATA_END()
//==========================================================================
CONFIG_METADATA_BEGIN(MTK_SENSOR_COLOR_TRANSFORM2)
CONFIG_ENTRY_VALUE(MRational(1, 1), MRational)
CONFIG_ENTRY_VALUE(MRational(0, 1), MRational)
CONFIG_ENTRY_VALUE(MRational(0, 1), MRational)
CONFIG_ENTRY_VALUE(MRational(0, 1), MRational)
CONFIG_ENTRY_VALUE(MRational(1, 1), MRational)
CONFIG_ENTRY_VALUE(MRational(0, 1), MRational)
CONFIG_ENTRY_VALUE(MRational(0, 1), MRational)
CONFIG_ENTRY_VALUE(MRational(0, 1), MRational)
CONFIG_ENTRY_VALUE(MRational(1, 1), MRational)
CONFIG_METADATA_END()
//==========================================================================
CONFIG_METADATA_BEGIN(MTK_SENSOR_FORWARD_MATRIX1)
CONFIG_ENTRY_VALUE(MRational(1, 1), MRational)
CONFIG_ENTRY_VALUE(MRational(0, 1), MRational)
CONFIG_ENTRY_VALUE(MRational(0, 1), MRational)
CONFIG_ENTRY_VALUE(MRational(0, 1), MRational)
CONFIG_ENTRY_VALUE(MRational(1, 1), MRational)
CONFIG_ENTRY_VALUE(MRational(0, 1), MRational)
CONFIG_ENTRY_VALUE(MRational(0, 1), MRational)
CONFIG_ENTRY_VALUE(MRational(0, 1), MRational)
CONFIG_ENTRY_VALUE(MRational(1, 1), MRational)
CONFIG_METADATA_END()
//==========================================================================
CONFIG_METADATA_BEGIN(MTK_SENSOR_FORWARD_MATRIX2)
CONFIG_ENTRY_VALUE(MRational(1, 1), MRational)
CONFIG_ENTRY_VALUE(MRational(0, 1), MRational)
CONFIG_ENTRY_VALUE(MRational(0, 1), MRational)
CONFIG_ENTRY_VALUE(MRational(0, 1), MRational)
CONFIG_ENTRY_VALUE(MRational(1, 1), MRational)
CONFIG_ENTRY_VALUE(MRational(0, 1), MRational)
CONFIG_ENTRY_VALUE(MRational(0, 1), MRational)
CONFIG_ENTRY_VALUE(MRational(0, 1), MRational)
CONFIG_ENTRY_VALUE(MRational(1, 1), MRational)
CONFIG_METADATA_END()
//------------------------------------------------------------------------------
STATIC_METADATA_END()

