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


package org.miracl.core.BLS12381;

public class ROM
{

// Base Bits= 58
public static final long[] Modulus= {0x1FEFFFFFFFFAAABL,0x2FFFFAC54FFFFEEL,0x12A0F6B0F6241EAL,0x213CE144AFD9CC3L,0x2434BACD764774BL,0x25FF9A692C6E9EDL,0x1A0111EA3L};
public static final long[] ROI= {0x1FEFFFFFFFFAAAAL,0x2FFFFAC54FFFFEEL,0x12A0F6B0F6241EAL,0x213CE144AFD9CC3L,0x2434BACD764774BL,0x25FF9A692C6E9EDL,0x1A0111EA3L};
public static final long[] R2modp= {0x20639A1D5BEF7AEL,0x1244C6462DD93E8L,0x22D09B54E6E2CD2L,0x111C4B63170E5DBL,0x38A6DE8FB366399L,0x4F16CFED1F9CBCL,0x19EA66A2BL};
public static final long MConst= 0x1F3FFFCFFFCFFFDL;

public static final int CURVE_A= 0;
public static final int CURVE_B_I= 4;
public static final int CURVE_Cof_I= 0;
public static final long[] CURVE_B= {0x4L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L};
public static final long[] CURVE_Order= {0x3FFFFFF00000001L,0x36900BFFF96FFBFL,0x180809A1D80553BL,0x14CA675F520CCE7L,0x73EDA7L,0x0L,0x0L};
public static final long[] CURVE_Gx= {0x33AF00ADB22C6BBL,0x17A0FFE5E86BBFEL,0x3A3F171BAC586C5L,0x13E5DD2E4168538L,0x4FA9AC0FC3688CL,0x65F5E509A558E3L,0x17F1D3A73L};
public static final long[] CURVE_Gy= {0xAA232946C5E7E1L,0x331D128A222B903L,0x18CB2C04B3EDD03L,0x25757402BD8036CL,0x1741D8AE4FCF5E0L,0xEAA83C68278C3BL,0x8B3F481EL};


public static final long[] Fra= {0x10775ED92235FB8L,0x3A94F58F9E04F63L,0x3D784BAB9C4F67L,0x3F4F2F57D3DEC91L,0x202C0D1F0FD603L,0xAEC199F08C6FADL,0x1904D3BF0L};
public static final long[] Frb= {0xF78A126DDC4AF3L,0x356B0535B1FB08BL,0xEC971F63C5F282L,0x21EDB1ECDBFB032L,0x2231F9FB854A147L,0x1B1380CA23A7A40L,0xFC3E2B3L};
public static final long[] CURVE_Bnx= {0x201000000010000L,0x34L,0x0L,0x0L,0x0L,0x0L,0x0L};
public static final long[] CURVE_Cof= {0x201000000010001L,0x34L,0x0L,0x0L,0x0L,0x0L,0x0L};
//public static final long[] CURVE_Cof= {0xAAAB0000AAABL,0x3230015557855A3L,0x396L,0x0L,0x0L,0x0L,0x0L};
public static final long[] CURVE_Cru= {0x201FFFFFFFEFFFEL,0x1F604D88280008BL,0x293BE6F89688DE1L,0x1DA83DDFAB76CEL,0x3DF76CE51BA69C6L,0x17C659CBL,0x0L};
public static final long[] CURVE_Pxa= {0x8056C8C121BDB8L,0x300C9AA016EFBF5L,0xB647AE3D1770BAL,0x353E900EC0AD144L,0x32DC51051C6E47AL,0x23C2A449820149L,0x24AA2B2FL};
public static final long[] CURVE_Pxb= {0x1AC7D055D042B7EL,0x33C4484E51755F9L,0x21BBDC7F5049334L,0x3426482D86AD769L,0x88274F65596BD0L,0x9C67D81F6B34E8L,0x13E02B605L};
public static final long[] CURVE_Pya= {0x193548608B82801L,0x2B2730EEB28A278L,0x1A695160D12C923L,0x2AA32F74E9DB50AL,0x2DA2E351AADFD9BL,0x9F5B8463327371L,0xCE5D5277L};
public static final long[] CURVE_Pyb= {0x2A9075FF05F79BEL,0x1C349D73B07686AL,0x12AB572E99AB3F3L,0x1FA169D8EBC99D2L,0x2BC28B99CB3E28L,0x3A9CD330CAB34ACL,0x606C4A02L};
public static final long[][] CURVE_W= {{0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L},{0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L}};
public static final long[][][] CURVE_SB= {{{0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L},{0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L}},{{0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L},{0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L}}};
public static final long[][] CURVE_WB= {{0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L},{0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L},{0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L},{0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L}};
public static final long[][][] CURVE_BB= {{{0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L},{0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L},{0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L},{0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L}},{{0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L},{0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L},{0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L},{0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L}},{{0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L},{0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L},{0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L},{0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L}},{{0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L},{0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L},{0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L},{0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L}}};

}

