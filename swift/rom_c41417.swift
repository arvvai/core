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

//
//  rom.swift
//
//  Created by Michael Scott on 12/06/2015.
//  Copyright (c) 2015 Michael Scott. All rights reserved.
//

public struct ROM{
 
#if D32

// Base Bits= 29
//  c41417 Curve Modulus
static let Modulus:[Chunk] = [0x1FFFFFEF,0x1FFFFFFF,0x1FFFFFFF,0x1FFFFFFF,0x1FFFFFFF,0x1FFFFFFF,0x1FFFFFFF,0x1FFFFFFF,0x1FFFFFFF,0x1FFFFFFF,0x1FFFFFFF,0x1FFFFFFF,0x1FFFFFFF,0x1FFFFFFF,0xFF]
static let ROI:[Chunk] = [0x1FFFFFEE,0x1FFFFFFF,0x1FFFFFFF,0x1FFFFFFF,0x1FFFFFFF,0x1FFFFFFF,0x1FFFFFFF,0x1FFFFFFF,0x1FFFFFFF,0x1FFFFFFF,0x1FFFFFFF,0x1FFFFFFF,0x1FFFFFFF,0x1FFFFFFF,0xFF]
static let R2modp:[Chunk] = [0x0,0x242000,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0]
static let MConst:Chunk = 0x11

//  c41417 Curve
static let CURVE_Cof_I:Int = 8
static let CURVE_Cof:[Chunk] = [0x8,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0]
static let CURVE_A:Int = 1
static let CURVE_B_I:Int = 3617
static let CURVE_B:[Chunk] = [0xE21,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0]
static public let CURVE_Order:[Chunk] = [0x106AF79,0x18738D2F,0x18F3C606,0x1806715A,0x22B36F1,0xA67B830,0xCF32490,0x1FFFFFFD,0x1FFFFFFF,0x1FFFFFFF,0x1FFFFFFF,0x1FFFFFFF,0x1FFFFFFF,0x1FFFFFFF,0x1F]
static public let CURVE_Gx:[Chunk] = [0x13CBC595,0x7E9C097,0x14DF1931,0x14E7F550,0x1A111301,0x15A6B6B5,0xD526292,0x18FEAFFE,0x1F44C03E,0x1E6A31B4,0x70C9B97,0x43180C6,0x1443300,0x19A4828A,0x68]
static public let CURVE_Gy:[Chunk] = [0x22,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0]


#endif

#if D64

// Base Bits= 60
//  c41417 Curve Modulus
static let Modulus:[Chunk] = [0xFFFFFFFFFFFFFEF,0xFFFFFFFFFFFFFFF,0xFFFFFFFFFFFFFFF,0xFFFFFFFFFFFFFFF,0xFFFFFFFFFFFFFFF,0xFFFFFFFFFFFFFFF,0x3FFFFFFFFFFFFF]
static let ROI:[Chunk] = [0xFFFFFFFFFFFFFEE,0xFFFFFFFFFFFFFFF,0xFFFFFFFFFFFFFFF,0xFFFFFFFFFFFFFFF,0xFFFFFFFFFFFFFFF,0xFFFFFFFFFFFFFFF,0x3FFFFFFFFFFFFF]
static let R2modp:[Chunk] = [0x121000,0x0,0x0,0x0,0x0,0x0,0x0]
static let MConst:Chunk = 0x11

//  c41417 Curve
static let CURVE_Cof_I:Int = 8
static let CURVE_Cof:[Chunk] = [0x8,0x0,0x0,0x0,0x0,0x0,0x0]
static let CURVE_A:Int = 1
static let CURVE_B_I:Int = 3617
static let CURVE_B:[Chunk] = [0xE21,0x0,0x0,0x0,0x0,0x0,0x0]
static public let CURVE_Order:[Chunk] = [0xB0E71A5E106AF79,0x1C0338AD63CF181,0x414CF706022B36F,0xFFFFFFFFEB3CC92,0xFFFFFFFFFFFFFFF,0xFFFFFFFFFFFFFFF,0x7FFFFFFFFFFFF]
static public let CURVE_Gx:[Chunk] = [0x4FD3812F3CBC595,0x1A73FAA8537C64C,0x4AB4D6D6BA11130,0x3EC7F57FF35498A,0xE5FCD46369F44C0,0x300218C0631C326,0x1A334905141443]
static public let CURVE_Gy:[Chunk] = [0x22,0x0,0x0,0x0,0x0,0x0,0x0]

#endif

}

