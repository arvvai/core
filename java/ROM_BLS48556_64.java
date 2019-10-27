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


package org.miracl.core.BLS48556;

public class ROM
{

// Base Bits= 58
	public static final long[] Modulus= {0x2F6E60FFCF6AC0BL,0x259C02699877E7BL,0x37A9870D4228402L,0x80821A1DACBB04L,0x13016A7C025A415L,0x2BB355ACDE6E250L,0x20536F405DA950L,0x295B219C54AB351L,0x3FCFC5B23729047L,0x3F45F610BL};
	public static final long[] ROI= {0x2F6E60FFCF6AC0AL,0x259C02699877E7BL,0x37A9870D4228402L,0x80821A1DACBB04L,0x13016A7C025A415L,0x2BB355ACDE6E250L,0x20536F405DA950L,0x295B219C54AB351L,0x3FCFC5B23729047L,0x3F45F610BL};
	public static final long[] R2modp= {0x25E03FA0D59D0FAL,0x6B55DC2DE8FD41L,0xA0E01D0B937F48L,0x20336279F50EFCEL,0x2212822A3470A2FL,0xD5A21C4F9FB72DL,0x89E8F0A1CFD9F8L,0x2291DA62B48793L,0x3DC6978EF609E61L,0x1735D29EL};
	public static final long MConst= 0x21BFCBCA9DA805DL;
	public static final long[] Fra= {0x2623CFD9325BF89L,0x341FA8DCCD0A56FL,0x1952FBA0E83BCCAL,0xBE3C26F8D1D297L,0x27F84ABE7AB9F2CL,0x13BDE945C9DECEBL,0x3B3213C83C0F60BL,0x3B7F0411FF27FF7L,0x80089C089BB36CL,0xA62E01EEL};
	public static final long[] Frb= {0x2623CFD9325BF89L,0x341FA8DCCD0A56FL,0x1952FBA0E83BCCAL,0xBE3C26F8D1D297L,0x27F84ABE7AB9F2CL,0x13BDE945C9DECEBL,0x3B3213C83C0F60BL,0x3B7F0411FF27FF7L,0x80089C089BB36CL,0xA62E01EEL};

	public static final int CURVE_A= 0;
	public static final int CURVE_B_I= 17;
	public static final int CURVE_Cof_I= 0;
	public static final long[] CURVE_B= {0x11L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L};
	public static final long[] CURVE_Order= {0x2FFFF0000000001L,0x11550278A769C21L,0x14D1EB162029C21L,0x2309B4A2B6307F4L,0x34790BD26DFED78L,0x2C6FE3F2571037BL,0x1306A973C465FB0L,0x28446ABB18DF17AL,0xC43BF73EL,0x0L};
	public static final long[] CURVE_Gx= {0x3286D2F65D71D33L,0x3601553F8CB783FL,0xFF01647711EE0BL,0x268BC07F29FD8CCL,0xE0702E69A80F66L,0x285003EAC056511L,0x35E130D242B2C3AL,0x107024C87924166L,0x17595DB8957EDD7L,0x26A27A4A1L};
	public static final long[] CURVE_Gy= {0x29A5B3FEA6ED83AL,0x3712E552A29C33DL,0x3391EA8E6958677L,0x29F3C7B9DED7E3EL,0x4E2E3818FB7229L,0x1CC30999551E32DL,0xE67A4086260E3CL,0x2A68CCB8579C437L,0x62C5FAE2B3349DL,0x2B634253L};

	public static final long[] CURVE_Bnx= {0x7DE40020L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L};
	public static final long[] CURVE_Cof= {0x7DE4001FL,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L};
	//public static final long[] CURVE_Cof= {0xA2D10F7F12ABEBL,0x5L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L};
	public static final long[] CURVE_Cru= {0x364E7E6CBBA429L,0x338C28A4D3DD160L,0x28DC3C68308093AL,0x230B290AE0E768L,0x127B0AB9B73BC2DL,0x23192337B1A639CL,0x1E399AEEFF04AE3L,0x20C88F0091318E5L,0x37CEF23203A79F7L,0x3F45F60F3L};
	public static final long[] CURVE_Pxaaa= {0x28D2E8E8923CE4AL,0x2F5C40B4AE04F4AL,0x2165D8A1313A20CL,0x2BFC7FD18DF074FL,0x12B37F0A7C90B98L,0x286ED92CE57BD37L,0x1C416C4ABF57375L,0x39779D0B2EE2172L,0x1A1C0497A5D9487L,0x3995E3602L};
	public static final long[] CURVE_Pxaab= {0x271CDC5AC0A1BE1L,0x2A3F8EC01DF5FDCL,0xAD5478433972C5L,0x22B73FAE2491D8CL,0x30E75C6B40A11FAL,0xE960C8FF259C26L,0x8CE48632D18B04L,0x39549A6BC27F419L,0x274A97B58DB48B6L,0xA5080497L};
	public static final long[] CURVE_Pxaba= {0x23A724C770C5DC4L,0x2A592B776B3BCB6L,0x110934259BEC736L,0x18E2C5A649AB2A8L,0x2B84CB2C58CD55L,0x168195F91EE8B90L,0xF7D917CE233167L,0x2A38FB7729335BDL,0x36D71DDA78B689BL,0x2D4BFBE3DL};
	public static final long[] CURVE_Pxabb= {0xD629669A64B740L,0x47F52632481578L,0x40D7054323ADD1L,0x3F9F4CCCD789E1BL,0x1E3C73C41F4EEA7L,0x15E7D7A61968610L,0x1B4186B40590D3BL,0x19F3BA577306AAFL,0x12DFE5F23F63B1AL,0x24E102A76L};
	public static final long[] CURVE_Pxbaa= {0x1BB0C6172F1E01FL,0x30C4734D2C29802L,0x990FA39218788L,0xEEB80ED6AE2501L,0x34728852870C80BL,0x94841D1637D478L,0x21CBCE27C3AD4D4L,0xA29F9E111E6AD5L,0x18CF1447CC49D3L,0x37787BDFDL};
	public static final long[] CURVE_Pxbab= {0x30A38238637383DL,0x288094FE661F866L,0x135C51ED5D3D212L,0x3C39C57E8051F25L,0x164639D737D882FL,0x312AEC8AA8DB8FCL,0x3FE838885E54DA8L,0x2FC3978BA297414L,0x850556F014F91FL,0x20B6CE9E3L};
	public static final long[] CURVE_Pxbba= {0x1683DB3D711939CL,0x26F9475A69066BAL,0xBCDB572CF2F6C0L,0x128DC8902CE1323L,0x29B3233EF353D1CL,0x342402A46B7046L,0x3187D1A403D6070L,0x3E3466F9F23BA45L,0xD943BE2435A9CCL,0x2A08A9CE1L};
	public static final long[] CURVE_Pxbbb= {0x32D410A856F4899L,0x7147AE4A959750L,0x28AEA57990BC9BCL,0x2807F11E9E26DAL,0x282C5EBA71895E3L,0x2832162D9FEC5FFL,0x33479E30007597CL,0x227A376C26A4B00L,0x1C16F1567857A32L,0x37DD51E0FL};
	public static final long[] CURVE_Pyaaa= {0x2E097CFB4137844L,0x313B1927FD3CCDDL,0x1EB86FABC768851L,0x4156382E29C659L,0x3C10CC7CF8896E0L,0x22FC388FD1D539CL,0x2C3E202F56CDD39L,0x2E9645FB43E8C72L,0x93548FD8706190L,0x1D9BB42E1L};
	public static final long[] CURVE_Pyaab= {0x25E3248EDC83190L,0x2BAABD11AA26424L,0x161D23BAC418D32L,0x5B3258247CBFF7L,0xED295CADE03C1FL,0x3A84758C5C741A2L,0x3D207E205E02B9EL,0x86743E24EA6513L,0x1DAA8E268EFA1C4L,0x9E72CE4FL};
	public static final long[] CURVE_Pyaba= {0x1DC5FD041985C0DL,0x2350136864770FAL,0x3179A5F5483ACE9L,0x2C25AB1A171F32CL,0x397C4403E658341L,0xE7E1C2186E971L,0x15921F60B0A5F40L,0x46E9317635E008L,0x17EF1353F3140D6L,0x35166F259L};
	public static final long[] CURVE_Pyabb= {0x36FE0A8159D42F8L,0x290EBF4445895D7L,0x20273B0FE9E7F2BL,0x23A6E2FF0F3FD7DL,0x1F37678869E5006L,0x2CA2DB53C9ED8DL,0x4E4BFD902F51DEL,0x1FF8649F125B66L,0x382D89BED80731L,0x28383AAA8L};
	public static final long[] CURVE_Pybaa= {0xD512B39F38039FL,0x23BA255F3C68984L,0x390AA14058093CFL,0x1FF0B2F2FFA1622L,0x310C5CC5F2ABB75L,0x3D9016C9EB6A2C9L,0x1CF7EE268EC2F18L,0x338BBB12C36B65AL,0x1EEE591B8A1D1ABL,0xAC11927CL};
	public static final long[] CURVE_Pybab= {0x269E06F295F7865L,0x2FC1D5BA1CE9A0EL,0x3631F3F1DACADD7L,0x30CCF3581D3943L,0x3FBE3B902505BB0L,0x23C4A9D31B36A49L,0x2056135CA438576L,0x2B78046739984F4L,0x12C0AC57B6F180EL,0xC48CA65BL};
	public static final long[] CURVE_Pybba= {0x1D83A9F67CC1979L,0x12ABE71DD89E6F0L,0x247B1C21635FDA9L,0x92880950076209L,0x2ECF179E0D733D7L,0x20D2DFFB53841F9L,0x3441B1645BC9FE8L,0x3089222CE22EC9DL,0x3699AE4108C86C5L,0x320034967L};
	public static final long[] CURVE_Pybbb= {0xFC89562FC9F25BL,0xB13E01AE9AB5D3L,0x18E8F169C9D264FL,0x3A5828D76B24A13L,0x1E8FD9BCEF84D9AL,0x36D20E3DBFEE16AL,0x17D3B3DF1AB4C1CL,0xF190510390F005L,0x12640E61B9BF549L,0x283D84D97L};
	public static final long[][] CURVE_W= {{0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L},{0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L}};
	public static final long[][][] CURVE_SB= {{{0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L},{0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L}},{{0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L},{0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L}}};
	public static final long[][] CURVE_WB= {{0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L},{0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L},{0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L},{0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L}};
	public static final long[][][] CURVE_BB= {{{0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L},{0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L},{0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L},{0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L}},{{0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L},{0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L},{0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L},{0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L}},{{0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L},{0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L},{0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L},{0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L}},{{0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L},{0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L},{0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L},{0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L,0x0L}}};

}

