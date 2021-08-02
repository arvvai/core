/*
 * Copyright (c) 2012-2020 MIRACL UK Ltd.
 *
 * This file is part of MIRACL Core
 * (see https://github.com/miracl/core).
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/* Fixed Data in ROM - Field and Curve parameters */

package SECP256K1

// Base Bits= 28

var Modulus = [...]Chunk{0xFFFFC2F, 0xFFFFFEF, 0xFFFFFFF, 0xFFFFFFF, 0xFFFFFFF, 0xFFFFFFF, 0xFFFFFFF, 0xFFFFFFF, 0xFFFFFFF, 0xF}
var ROI = [...]Chunk{0xFFFFC2E, 0xFFFFFEF, 0xFFFFFFF, 0xFFFFFFF, 0xFFFFFFF, 0xFFFFFFF, 0xFFFFFFF, 0xFFFFFFF, 0xFFFFFFF, 0xF}
var R2modp = [...]Chunk{0x0, 0xA100000, 0x2000E90, 0x7A, 0x1, 0x0, 0x0, 0x0, 0x0, 0x0}
var SQRTm3 = [...]Chunk{0xCD5F852, 0x8D27AE1, 0x4ECD47D, 0x6D15DA1, 0x62CC61F, 0xC2A7979, 0xF233770, 0x3507F1D, 0xA2D2BA9, 0x0}

const MConst Chunk = 0x2253531

// Base Bits= 28

const CURVE_Cof_I int = 1

var CURVE_Cof = [...]Chunk{0x1, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0}

const CURVE_B_I int = 7

var CURVE_B = [...]Chunk{0x7, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0}
var CURVE_Order = [...]Chunk{0x364141, 0xD25E8CD, 0x8A03BBF, 0xDCE6AF4, 0xFFEBAAE, 0xFFFFFFF, 0xFFFFFFF, 0xFFFFFFF, 0xFFFFFFF, 0xF}
var CURVE_Gx = [...]Chunk{0x6F81798, 0xF2815B1, 0xE28D959, 0xFCDB2DC, 0xB07029B, 0x95CE870, 0xC55A062, 0xF9DCBBA, 0x9BE667E, 0x7}
var CURVE_Gy = [...]Chunk{0xB10D4B8, 0x47D08FF, 0x554199C, 0xB448A68, 0x8A8FD17, 0xFC0E110, 0x55DA4FB, 0x26A3C46, 0x83ADA77, 0x4}
var CURVE_HTPC = [...]Chunk{0xE8624AA, 0xC813789, 0xF508ECD, 0xCA45C23, 0xD8BBBFD, 0x640A39C, 0xF4D5B4, 0x813FFE3, 0xCE8E9E8, 0xC}
var CURVE_Ad = [...]Chunk{0xA444533, 0x5447C01, 0xF0E5D40, 0xD363CB6, 0x272E953, 0x58F0F5D, 0xCA08A55, 0xDD661AD, 0xF8731AB, 0x3}
var CURVE_Bd = [...]Chunk{0x6EB, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0}
var PC = [13][10]Chunk{{0xAAAA88C, 0x38E38DA, 0xE38E38E, 0x8E38E38, 0x38E38E3, 0xE38E38E, 0x8E38E38, 0x38E38E3, 0xE38E38E, 0x8}, {0xD9DD262, 0xCBD0B53, 0xC40314E, 0x6144037, 0xAECE450, 0xDECA25C, 0x6E2A413, 0x23F234E, 0x34C328D, 0x5}, {0x17C6581, 0xFF1044F, 0x63B92DF, 0xD2FC0BF, 0x4C5D595, 0xCEA7FD4, 0x5B9F315, 0xBC321D, 0x7D3D4C8, 0x0}, {0xAAAA8C7, 0x38E38DA, 0xE38E38E, 0x8E38E38, 0x38E38E3, 0xE38E38E, 0x8E38E38, 0x38E38E3, 0xE38E38E, 0x8}, {0xA8C6D14, 0x2A56612, 0xE41BBC5, 0x6B641F5, 0x25406D3, 0xD51B542, 0xDF7C4B2, 0x4383DC1, 0xDADC6F6, 0xE}, {0x81EB49B, 0xE6B7457, 0x8487D9F, 0x409542F, 0xDD86CD, 0xCBB7B64, 0xA9CA34C, 0x3D94918, 0x3577119, 0xD}, {0x8E38D84, 0xBDA12F3, 0xA12F684, 0x2F684BD, 0x684BDA1, 0x4BDA12F, 0xDA12F68, 0x12F684B, 0xF684BDA, 0x2}, {0xECEE931, 0x65E85A9, 0xE2018A7, 0x30A201B, 0x5767228, 0xEF6512E, 0x3715209, 0x91F91A7, 0x9A61946, 0x2}, {0x1D71A3, 0xFC90FC2, 0x6DA6FDF, 0xB046D68, 0x6D5647A, 0x4B12A0A, 0xFA9D0A5, 0xD5CB7C0, 0x75E0C32, 0xC}, {0xE38E23C, 0x2F684B8, 0x684BDA1, 0x4BDA12F, 0xDA12F68, 0x12F684B, 0xF684BDA, 0x84BDA12, 0xBDA12F6, 0x4}, {0xFD2A76F, 0xBF8192B, 0xD6299A7, 0x21162F0, 0x37E0A3D, 0x3FA8FE3, 0xCF3A70C, 0x6545CA2, 0x484AA71, 0x6}, {0x85C2573, 0xB425D26, 0x8D978DF, 0xC1BFC8E, 0x2989467, 0x632722C, 0xFD5E9E6, 0xB8BDB49, 0xA06534B, 0x7}, {0xFFFF93B, 0xFFFFFEF, 0xFFFFFFF, 0xFFFFFFF, 0xFFFFFFF, 0xFFFFFFF, 0xFFFFFFF, 0xFFFFFFF, 0xFFFFFFF, 0xF}}
