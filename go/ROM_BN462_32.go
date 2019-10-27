/*
   Copyright (C) 2019 MIRACL UK Ltd.

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU Affero General Public License as
    published by the Free Software Foundation, either version 3 of the
    License, or (at your option) any later version.


    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU Affero General Public License for more details.

     https://www.gnu.org/licenses/agpl-3.0.en.html

    You should have received a copy of the GNU Affero General Public License
    along with this program.  If not, see <https://www.gnu.org/licenses/>.

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.

   You can be released from the requirements of the license by purchasing     
   a commercial license. Buying such a license is mandatory as soon as you
   develop commercial activities involving the MIRACL Core Crypto SDK
   without disclosing the source code of your own applications, or shipping
   the MIRACL Core Crypto SDK with a closed source product.     
*/

/* Fixed Data in ROM - Field and Curve parameters */

package BN462

// Base Bits= 28
var Modulus= [...]Chunk {0x138013,0x1B0084,0x24,0xF640000,0xC6FF687,0xF6FF66F,0xFFFFFFF,0xC8020FF,0x2908F41,0xD81,0xA000000,0xB7D9BFC,0x6FF0CF6,0xFFFFFFF,0x23FFF,0x8036012,0x2404}
var ROI= [...]Chunk {0x138012,0x1B0084,0x24,0xF640000,0xC6FF687,0xF6FF66F,0xFFFFFFF,0xC8020FF,0x2908F41,0xD81,0xA000000,0xB7D9BFC,0x6FF0CF6,0xFFFFFFF,0x23FFF,0x8036012,0x2404}
var R2modp= [...]Chunk {0x88F9612,0xC8B9999,0x247088C,0xDB3ACD5,0xCA792EF,0x6E92E73,0x34F5999,0x4273E13,0x6714A6A,0xCBFE239,0xA0E2617,0x2487CB3,0xBE0EA3C,0x97791E4,0x8A07DE5,0x56CFA97,0x373}
const MConst Chunk=0x11BB5E5
var Fra= [...]Chunk {0x2575D1A,0xE4BE3FF,0x659DBDE,0xFC7D89,0x93FA118,0xD45D1D,0xCC78D9,0x6217331,0xD547C05,0xC792504,0x9A87E11,0x92ED03A,0x1727085,0xB5A8CC1,0xB40BCFD,0xF4348CB,0x16F}
var Frb= [...]Chunk {0x55FF85B,0x204AE09,0x57BEB62,0x9023886,0xD630A20,0xF94F4B,0x84FF0D0,0x14A1A7A,0xB1DBADB,0xB00D8E4,0x1E85F7,0x7493CA0,0x68325B2,0x2008E6B,0xE90EA88,0x7F80940,0x23C3}

//*** rom curve parameters *****
// Base Bits= 28
// Ate Bits= 118
// G2 Table size= 125

const CURVE_A int= 0
const CURVE_Cof_I int= 1
var CURVE_Cof= [...]Chunk {0x1,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0}
const CURVE_B_I int= 5
var CURVE_B= [...]Chunk {0x5,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0}
var CURVE_Order= [...]Chunk {0x10800D,0x1B007E,0x24,0xF7C0000,0xC7BF717,0xF6FF66F,0xFFFFFFF,0xC201F7F,0x2908EE1,0xD81,0xA000000,0xB7D9BFC,0x6FF0CF6,0xFFFFFFF,0x23FFF,0x8036012,0x2404}
var CURVE_Gx= [...]Chunk {0x6B6980D,0x98D91F3,0xD70113C,0x372E5C,0xE79239C,0x416A0B1,0xBB4E69A,0x689DB1B,0x3CF4B2E,0xB3EDBEC,0x6F95F63,0xAC9264B,0x30160B9,0xBA34A0A,0x191FAD,0xD67EF25,0x21A6}
var CURVE_Gy= [...]Chunk {0x6FB03DE,0xA5734D3,0x22ECAA8,0xC666006,0xF475432,0xE40EB80,0xDF11B8A,0x6E6AF77,0x5965042,0x7D788C6,0x42CCCFA,0x90EEDA8,0xA7432A4,0x2B33676,0x7F7ABB8,0xEA0460F,0x118}

var CURVE_Bnx= [...]Chunk {0xFFFBFFF,0xFFFFFFF,0xFFFFFFF,0x1FFFF,0x4,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0}
var CURVE_Cru= [...]Chunk {0x1A401A,0x1F80A8,0x24,0xF2E0000,0xBBBF3DB,0xF6FF597,0xFFFFFFF,0x22029FF,0x3689F02,0xD81,0x1000000,0x4BD65FC,0x6FF0876,0xFFFFFFF,0x23FFF,0x8036012,0x2404}
var CURVE_Pxa= [...]Chunk {0xAE1E4DF,0x8E3D934,0x769546,0x6A8B488,0xAE1F0AA,0x92E0032,0x2699BAD,0x208F9AD,0x3820408,0xED61C91,0x7C1CD96,0x2E0337E,0xCBDC548,0xB38E3A8,0x8DDA0DF,0xCCC85B5,0x257}
var CURVE_Pxb= [...]Chunk {0xA8CD283,0x108BA6A,0x50E9B73,0x59BF7E8,0xF50AF8B,0xB783718,0x6BAE555,0x8134DD8,0x84058B1,0xED91768,0x54730CB,0xC98E2A3,0x9566BA3,0x8EDCA84,0x99102AF,0x4343E85,0x1D2E}
var CURVE_Pya= [...]Chunk {0xDB7154E,0x5B68DF0,0x7C3376E,0xE7B11D,0x3695A14,0xDAE32E0,0x1F41C9D,0xF1399A,0xB42FE81,0x3FA7A6B,0x706E23C,0xA035634,0x20809EC,0x517427A,0x22C1979,0x50439DA,0xA06}
var CURVE_Pyb= [...]Chunk {0xCA2A93A,0x14CC552,0x93B9EBA,0xD537434,0x387AA68,0xA04EF87,0x7692444,0x725CC64,0xAB370FD,0x7B393F1,0xC69AC5,0x44D5E6B,0x306324D,0x2C8AE37,0x8CBE017,0xF0CBD43,0x73E}
var CURVE_W=[2][17]Chunk {{0x20003,0x6,0x0,0xFF00000,0xFF3FF7F,0xFFFFFFF,0xFFFFFFF,0x60017F,0x60,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0},{0xFFF7FFF,0xFFFFFFF,0xFFFFFFF,0x3FFFF,0x8,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0}}
var CURVE_SB=[2][2][17]Chunk {{{0x28004,0x6,0x0,0xFEC0000,0xFF3FF77,0xFFFFFFF,0xFFFFFFF,0x60017F,0x60,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0},{0x11000E,0x1B007E,0x24,0xF780000,0xC7BF70F,0xF6FF66F,0xFFFFFFF,0xC201F7F,0x2908EE1,0xD81,0xA000000,0xB7D9BFC,0x6FF0CF6,0xFFFFFFF,0x23FFF,0x8036012,0x2404}},{{0xFFF7FFF,0xFFFFFFF,0xFFFFFFF,0x3FFFF,0x8,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0},{0x20003,0x6,0x0,0xFF00000,0xFF3FF7F,0xFFFFFFF,0xFFFFFFF,0x60017F,0x60,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0}}}
var CURVE_WB=[4][17]Chunk {{0x4000,0x2,0x0,0xFFE0000,0xFFBFFDB,0xFFFFFFF,0xFFFFFFF,0x20007F,0x20,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0},{0xFFABFFB,0xFFCFFE3,0xFFFFFFF,0x29FFFF,0x800214,0x90,0x0,0xBFFF900,0xF6FF53F,0xFFFFFFF,0x5FFFFFF,0x4802400,0x300,0x0,0x0,0x0,0x0},{0xFFD3FFD,0xFFE7FF1,0xFFFFFFF,0x15FFFF,0x40010C,0x48,0x0,0xDFFFC80,0xFB7FA9F,0xFFFFFFF,0x2FFFFFF,0x2401200,0x180,0x0,0x0,0x0,0x0},{0xC001,0x2,0x0,0xFFA0000,0xFFBFFD3,0xFFFFFFF,0xFFFFFFF,0x20007F,0x20,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0}}
var CURVE_BB=[4][4][17]Chunk {{{0xFFFC000,0xFFFFFFF,0xFFFFFFF,0x1FFFF,0x4,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0},{0xFFFBFFF,0xFFFFFFF,0xFFFFFFF,0x1FFFF,0x4,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0},{0xFFFBFFF,0xFFFFFFF,0xFFFFFFF,0x1FFFF,0x4,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0},{0x11000F,0x1B007E,0x24,0xF780000,0xC7BF70F,0xF6FF66F,0xFFFFFFF,0xC201F7F,0x2908EE1,0xD81,0xA000000,0xB7D9BFC,0x6FF0CF6,0xFFFFFFF,0x23FFF,0x8036012,0x2404}},{{0xFFF7FFF,0xFFFFFFF,0xFFFFFFF,0x3FFFF,0x8,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0},{0x10C00E,0x1B007E,0x24,0xF7A0000,0xC7BF713,0xF6FF66F,0xFFFFFFF,0xC201F7F,0x2908EE1,0xD81,0xA000000,0xB7D9BFC,0x6FF0CF6,0xFFFFFFF,0x23FFF,0x8036012,0x2404},{0x10C00D,0x1B007E,0x24,0xF7A0000,0xC7BF713,0xF6FF66F,0xFFFFFFF,0xC201F7F,0x2908EE1,0xD81,0xA000000,0xB7D9BFC,0x6FF0CF6,0xFFFFFFF,0x23FFF,0x8036012,0x2404},{0x10C00E,0x1B007E,0x24,0xF7A0000,0xC7BF713,0xF6FF66F,0xFFFFFFF,0xC201F7F,0x2908EE1,0xD81,0xA000000,0xB7D9BFC,0x6FF0CF6,0xFFFFFFF,0x23FFF,0x8036012,0x2404}},{{0xFFF7FFE,0xFFFFFFF,0xFFFFFFF,0x3FFFF,0x8,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0},{0xFFF7FFF,0xFFFFFFF,0xFFFFFFF,0x3FFFF,0x8,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0},{0xFFF7FFF,0xFFFFFFF,0xFFFFFFF,0x3FFFF,0x8,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0},{0xFFF7FFF,0xFFFFFFF,0xFFFFFFF,0x3FFFF,0x8,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0}},{{0x10C00F,0x1B007E,0x24,0xF7A0000,0xC7BF713,0xF6FF66F,0xFFFFFFF,0xC201F7F,0x2908EE1,0xD81,0xA000000,0xB7D9BFC,0x6FF0CF6,0xFFFFFFF,0x23FFF,0x8036012,0x2404},{0x11800F,0x1B007E,0x24,0xF740000,0xC7BF707,0xF6FF66F,0xFFFFFFF,0xC201F7F,0x2908EE1,0xD81,0xA000000,0xB7D9BFC,0x6FF0CF6,0xFFFFFFF,0x23FFF,0x8036012,0x2404},{0xFFF7FFD,0xFFFFFFF,0xFFFFFFF,0x3FFFF,0x8,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0},{0x10C00F,0x1B007E,0x24,0xF7A0000,0xC7BF713,0xF6FF66F,0xFFFFFFF,0xC201F7F,0x2908EE1,0xD81,0xA000000,0xB7D9BFC,0x6FF0CF6,0xFFFFFFF,0x23FFF,0x8036012,0x2404}}}
