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

package GOLDILOCKS

// Base Bits= 29
var Modulus = [...]Chunk{0x1FFFFFFF, 0x1FFFFFFF, 0x1FFFFFFF, 0x1FFFFFFF, 0x1FFFFFFF, 0x1FFFFFFF, 0x1FFFFFFF, 0x1FDFFFFF, 0x1FFFFFFF, 0x1FFFFFFF, 0x1FFFFFFF, 0x1FFFFFFF, 0x1FFFFFFF, 0x1FFFFFFF, 0x1FFFFFFF, 0x1FFF}
var ROI = [...]Chunk{0x1FFFFFFE, 0x1FFFFFFF, 0x1FFFFFFF, 0x1FFFFFFF, 0x1FFFFFFF, 0x1FFFFFFF, 0x1FFFFFFF, 0x1FDFFFFF, 0x1FFFFFFF, 0x1FFFFFFF, 0x1FFFFFFF, 0x1FFFFFFF, 0x1FFFFFFF, 0x1FFFFFFF, 0x1FFFFFFF, 0x1FFF}
var R2modp = [...]Chunk{0x0, 0x10, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x3000000, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0}

const MConst Chunk = 0x1

const CURVE_Cof_I int = 4

var CURVE_Cof = [...]Chunk{0x4, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0}

const CURVE_A int = 1
const CURVE_B_I int = -39081

var CURVE_B = [...]Chunk{0x1FFF6756, 0x1FFFFFFF, 0x1FFFFFFF, 0x1FFFFFFF, 0x1FFFFFFF, 0x1FFFFFFF, 0x1FFFFFFF, 0x1FDFFFFF, 0x1FFFFFFF, 0x1FFFFFFF, 0x1FFFFFFF, 0x1FFFFFFF, 0x1FFFFFFF, 0x1FFFFFFF, 0x1FFFFFFF, 0x1FFF}
var CURVE_Order = [...]Chunk{0xB5844F3, 0x1BC61495, 0x1163D548, 0x1984E51B, 0x3690216, 0xDA4D76B, 0xFA7113B, 0x1FEF9944, 0x1FFFFFFF, 0x1FFFFFFF, 0x1FFFFFFF, 0x1FFFFFFF, 0x1FFFFFFF, 0x1FFFFFFF, 0x1FFFFFFF, 0x7FF}
var CURVE_Gx = [...]Chunk{0x15555555, 0xAAAAAAA, 0x15555555, 0xAAAAAAA, 0x15555555, 0xAAAAAAA, 0x15555555, 0x152AAAAA, 0xAAAAAAA, 0x15555555, 0xAAAAAAA, 0x15555555, 0xAAAAAAA, 0x15555555, 0xAAAAAAA, 0x1555}
var CURVE_Gy = [...]Chunk{0xA9386ED, 0x1757DE6F, 0x13681AF6, 0x19657DA3, 0x3098BBB, 0x12C19D15, 0x12E03595, 0xE515B18, 0x17B7E36D, 0x1AC426E, 0xDBB5E8, 0x10D8560, 0x159D6205, 0xB8246D9, 0x17A58D2B, 0x15C0}
