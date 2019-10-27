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

package C13318

//*** rom field parameters*****
// Base Bits= 29
var Modulus= [...]Chunk {0x1FFFFFED,0x1FFFFFFF,0x1FFFFFFF,0x1FFFFFFF,0x1FFFFFFF,0x1FFFFFFF,0x1FFFFFFF,0x1FFFFFFF,0x7FFFFF}
var R2modp= [...]Chunk {0x169000,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0}
var ROI= [...]Chunk {0xA0EA0B0,0x770D93A,0xBF91E31,0x6300D5A,0x1D7A72F4,0x4C9EFD,0x1C2CAD34,0x1009F83B,0x2B8324}
const MConst Chunk=0x13

//*** rom curve parameters *****
// Base Bits= 29

const CURVE_A int= -3
const CURVE_Cof_I int= 1
var CURVE_Cof= [...]Chunk {0x1,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0}
const CURVE_B_I int= 13318
var CURVE_B= [...]Chunk {0x3406,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0}
var CURVE_Order= [...]Chunk {0xDC2CBE3,0x1BE896E2,0x1AE345BA,0xCA9F07B,0xF4F,0x0,0x0,0x0,0x800000}
var CURVE_Gx= [...]Chunk {0x5,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0}
var CURVE_Gy= [...]Chunk {0xB6EAD0B,0x6469AA3,0x5B6D6E,0x1996099E,0x166369D4,0x18728B34,0x1BC4E058,0x1B24D794,0x6675AA}
