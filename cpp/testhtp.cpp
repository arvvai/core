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

/* test driver and function exerciser for HTP API Functions */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include "core.h"
#include "randapi.h"
#include "ecp_NIST256.h"
#include "ecp_ED25519.h"
#include "ecp_GOLDILOCKS.h"
#include "ecp_SECP256K1.h"
#include "ecp_BLS12381.h"
#include "ecp2_BLS12381.h"


using namespace core;

#define CEIL(a,b) (((a)-1)/(b)+1)

/* Select curves 1,3,7,17,28 */

/* https://datatracker.ietf.org/doc/draft-irtf-cfrg-hash-to-curve/ */
static void hash_to_field_ED25519(int hash,int hlen,F25519::FP *u,octet *DST,octet *M, int ctr)
{
    using namespace ED25519;
    using namespace ED25519_BIG;
    using namespace ED25519_FP;
    
    int i,j,L,k,m;
    BIG q,w,r;
    DBIG dx;
    char okm[512],fd[256];
    octet OKM = {0,sizeof(okm),okm};

    BIG_rcopy(q, Modulus);
    k=BIG_nbits(q);
    BIG_rcopy(r, CURVE_Order);
    m=BIG_nbits(r);
    L=CEIL(k+CEIL(m,2),8);

    XMD_Expand(hash,hlen,&OKM,L*ctr,DST,M);
    for (i=0;i<ctr;i++)
    {
        for (j=0;j<L;j++)
            fd[j]=OKM.val[i*L+j];
        
        BIG_dfromBytesLen(dx,fd,L);
        BIG_dmod(w,dx,q);
        FP_nres(&u[i],w);
    }
}

int htp_ED25519(char *mess)
{
    using namespace ED25519;
    using namespace ED25519_BIG;
    using namespace ED25519_FP;
 
    int res=0;
    FP u[2];
    ECP P,P1;
    char dst[50];
    char msg[2000];
    octet MSG = {0,sizeof(msg),msg};
    octet DST = {0,sizeof(dst),dst};

    printf("Random Access - message= %s\n",mess);
    OCT_jstring(&MSG,mess);
    OCT_jstring(&DST,(char *)"edwards25519_XMD:SHA-256_ELL2_RO_TESTGEN");
    hash_to_field_ED25519(MC_SHA2,HASH_TYPE_ED25519,u,&DST,&MSG,2);
    printf("u[0]= "); FP_output(&u[0]); printf("\n");
    printf("u[1]= "); FP_output(&u[1]); printf("\n");
    ECP_map2point(&P,&u[0]);
    printf("Q[0]= "); ECP_output(&P);
    ECP_map2point(&P1,&u[1]);
    printf("Q[1]= "); ECP_output(&P1);
    ECP_add(&P,&P1);
    ECP_cfp(&P);
    ECP_affine(&P);
    printf("P= "); ECP_output(&P); printf("\n");

    printf("Non-Uniform\n");
    OCT_clear(&DST);
    OCT_jstring(&DST,(char *)"edwards25519_XMD:SHA-256_ELL2_NU_TESTGEN");
    hash_to_field_ED25519(MC_SHA2,HASH_TYPE_ED25519,u,&DST,&MSG,1);
    printf("u[0]= "); FP_output(&u[0]); printf("\n");
    ECP_map2point(&P,&u[0]);
    printf("Q= "); ECP_output(&P);

    ECP_cfp(&P);
    ECP_affine(&P);
    printf("P= "); ECP_output(&P); printf("\n");
    return res;
}

/* https://datatracker.ietf.org/doc/draft-irtf-cfrg-hash-to-curve/ */
static void hash_to_field_NIST256(int hash,int hlen,NIST256::FP *u,octet *DST,octet *M, int ctr)
{
    using namespace NIST256;
    using namespace NIST256_BIG;
    using namespace NIST256_FP;
    
    int i,j,L,k,m;
    BIG q,w,r;
    DBIG dx;
    char okm[512],fd[256];
    octet OKM = {0,sizeof(okm),okm};

    BIG_rcopy(q, Modulus);
    k=BIG_nbits(q);
    BIG_rcopy(r, CURVE_Order);
    m=BIG_nbits(r);
    L=CEIL(k+CEIL(m,2),8);

    XMD_Expand(hash,hlen,&OKM,L*ctr,DST,M);
    for (i=0;i<ctr;i++)
    {
        for (j=0;j<L;j++)
            fd[j]=OKM.val[i*L+j];
        
        BIG_dfromBytesLen(dx,fd,L);
        BIG_dmod(w,dx,q);
        FP_nres(&u[i],w);
    }
}

int htp_NIST256(char *mess)
{
    using namespace NIST256;
    using namespace NIST256_BIG;
    using namespace NIST256_FP;
 
    int res=0;
    FP u[2];
    ECP P,P1;
    char dst[50];
    char msg[2000];
    octet MSG = {0,sizeof(msg),msg};
    octet DST = {0,sizeof(dst),dst};

    printf("Random Access - message= %s\n",mess);
    OCT_jstring(&MSG,mess);

    OCT_jstring(&DST,(char *)"P256_XMD:SHA-256_SSWU_RO_TESTGEN");
    hash_to_field_NIST256(MC_SHA2,HASH_TYPE_NIST256,u,&DST,&MSG,2);
    printf("u[0]= "); FP_output(&u[0]); printf("\n");
    printf("u[1]= "); FP_output(&u[1]); printf("\n");
    ECP_map2point(&P,&u[0]);
    printf("Q[0]= "); ECP_output(&P);
    ECP_map2point(&P1,&u[1]);
    printf("Q[1]= "); ECP_output(&P1);
    ECP_add(&P,&P1);
    ECP_cfp(&P);
    ECP_affine(&P);
    printf("P= "); ECP_output(&P); printf("\n");

    printf("Non-Uniform\n");
    OCT_clear(&DST);
    OCT_jstring(&DST,(char *)"P256_XMD:SHA-256_SSWU_NU_TESTGEN");
    hash_to_field_NIST256(MC_SHA2,HASH_TYPE_NIST256,u,&DST,&MSG,1);
    printf("u[0]= "); FP_output(&u[0]); printf("\n");
    ECP_map2point(&P,&u[0]);
    printf("Q= "); ECP_output(&P);
    ECP_cfp(&P);
    ECP_affine(&P);
    printf("P= "); ECP_output(&P); printf("\n");
    return res;
}


/* https://datatracker.ietf.org/doc/draft-irtf-cfrg-hash-to-curve/ */
static void hash_to_field_GOLDILOCKS(int hash,int hlen,GOLDILOCKS::FP *u,octet *DST,octet *M, int ctr)
{
    using namespace GOLDILOCKS;
    using namespace GOLDILOCKS_BIG;
    using namespace GOLDILOCKS_FP;
    
    int i,j,L,k,m;
    BIG q,w,r;
    DBIG dx;
    char okm[512],fd[256];
    octet OKM = {0,sizeof(okm),okm};

    BIG_rcopy(q, Modulus);
    k=BIG_nbits(q);
    BIG_rcopy(r, CURVE_Order);
    m=BIG_nbits(r);
    L=CEIL(k+CEIL(m,2),8);

    XMD_Expand(hash,hlen,&OKM,L*ctr,DST,M);
    for (i=0;i<ctr;i++)
    {
        for (j=0;j<L;j++)
            fd[j]=OKM.val[i*L+j];
        
        BIG_dfromBytesLen(dx,fd,L);
        BIG_dmod(w,dx,q);
        FP_nres(&u[i],w);
    }
}

int htp_GOLDILOCKS(char *mess)
{
    using namespace GOLDILOCKS;
    using namespace GOLDILOCKS_BIG;
    using namespace GOLDILOCKS_FP;
 
    int res=0;
    FP u[2];
    ECP P,P1;
    char dst[50];
    char msg[2000];
    octet MSG = {0,sizeof(msg),msg};
    octet DST = {0,sizeof(dst),dst};

    printf("Random Access - message= %s\n",mess);
    OCT_jstring(&MSG,mess);

    OCT_jstring(&DST,(char *)"edwards448_XMD:SHA-512_ELL2_RO_TESTGEN");
    hash_to_field_GOLDILOCKS(MC_SHA2,HASH_TYPE_GOLDILOCKS,u,&DST,&MSG,2);
    printf("u[0]= "); FP_output(&u[0]); printf("\n");
    printf("u[1]= "); FP_output(&u[1]); printf("\n");
    ECP_map2point(&P,&u[0]);
    printf("Q[0]= "); ECP_output(&P);
    ECP_map2point(&P1,&u[1]);
    printf("Q[1]= "); ECP_output(&P1);
    ECP_add(&P,&P1);
    ECP_cfp(&P);
    ECP_affine(&P);
    printf("P= "); ECP_output(&P); printf("\n");

    printf("Non-Uniform\n");
    OCT_clear(&DST);
    OCT_jstring(&DST,(char *)"edwards448_XMD:SHA-512_ELL2_NU_TESTGEN");
    hash_to_field_GOLDILOCKS(MC_SHA2,HASH_TYPE_GOLDILOCKS,u,&DST,&MSG,1);
    printf("u[0]= "); FP_output(&u[0]); printf("\n");
    ECP_map2point(&P,&u[0]);
    printf("Q= "); ECP_output(&P);

    ECP_cfp(&P);
    ECP_affine(&P);
    printf("P= "); ECP_output(&P); printf("\n");
    return res;
}

/* https://datatracker.ietf.org/doc/draft-irtf-cfrg-hash-to-curve/ */
static void hash_to_field_SECP256K1(int hash,int hlen,SECP256K1::FP *u,octet *DST,octet *M, int ctr)
{
    using namespace SECP256K1;
    using namespace SECP256K1_BIG;
    using namespace SECP256K1_FP;
    
    int i,j,L,k,m;
    BIG q,w,r;
    DBIG dx;
    char okm[512],fd[256];
    octet OKM = {0,sizeof(okm),okm};

    BIG_rcopy(q, Modulus);
    k=BIG_nbits(q);
    BIG_rcopy(r, CURVE_Order);
    m=BIG_nbits(r);
    L=CEIL(k+CEIL(m,2),8);

    XMD_Expand(hash,hlen,&OKM,L*ctr,DST,M);
    for (i=0;i<ctr;i++)
    {
        for (j=0;j<L;j++)
            fd[j]=OKM.val[i*L+j];
        
        BIG_dfromBytesLen(dx,fd,L);
        BIG_dmod(w,dx,q);
        FP_nres(&u[i],w);
    }
}

int htp_SECP256K1(char *mess)
{
    using namespace SECP256K1;
    using namespace SECP256K1_BIG;
    using namespace SECP256K1_FP;
 
    int res=0;
    FP u[2];
    ECP P,P1;
    char dst[50];
    char msg[2000];
    octet MSG = {0,sizeof(msg),msg};
    octet DST = {0,sizeof(dst),dst};

    printf("Random Access - message= %s\n",mess);
    OCT_jstring(&MSG,mess);

    OCT_jstring(&DST,(char *)"secp256k1_XMD:SHA-256_SVDW_RO_TESTGEN");
    hash_to_field_SECP256K1(MC_SHA2,HASH_TYPE_SECP256K1,u,&DST,&MSG,2);
    printf("u[0]= "); FP_output(&u[0]); printf("\n");
    printf("u[1]= "); FP_output(&u[1]); printf("\n");
    ECP_map2point(&P,&u[0]);
    printf("Q[0]= "); ECP_output(&P);
    ECP_map2point(&P1,&u[1]);
    printf("Q[1]= "); ECP_output(&P1);
    ECP_add(&P,&P1);
    ECP_cfp(&P);
    ECP_affine(&P);
    printf("P= "); ECP_output(&P); printf("\n");

    printf("Non-Uniform\n");
    OCT_clear(&DST);
    OCT_jstring(&DST,(char *)"secp256k1_XMD:SHA-256_SVDW_NU_TESTGEN");
    hash_to_field_SECP256K1(MC_SHA2,HASH_TYPE_SECP256K1,u,&DST,&MSG,1);
    printf("u[0]= "); FP_output(&u[0]); printf("\n");
    ECP_map2point(&P,&u[0]);
    printf("Q= "); ECP_output(&P);

    ECP_cfp(&P);
    ECP_affine(&P);
    printf("P= "); ECP_output(&P); printf("\n");
    return res;
}


/* https://datatracker.ietf.org/doc/draft-irtf-cfrg-hash-to-curve/ */
static void hash_to_field_BLS12381(int hash,int hlen,BLS12381::FP *u,octet *DST,octet *M, int ctr)
{
    using namespace BLS12381;
    using namespace BLS12381_BIG;
    using namespace BLS12381_FP;
    
    int i,j,L,k,m;
    BIG q,w,r;
    DBIG dx;
    char okm[512],fd[256];
    octet OKM = {0,sizeof(okm),okm};

    BIG_rcopy(q, Modulus);
    k=BIG_nbits(q);
    BIG_rcopy(r, CURVE_Order);
    m=BIG_nbits(r);
    L=CEIL(k+CEIL(m,2),8);

    //printf("L= %d\n",L);
    XMD_Expand(hash,hlen,&OKM,L*ctr,DST,M);
    for (i=0;i<ctr;i++)
    {
        for (j=0;j<L;j++)
            fd[j]=OKM.val[i*L+j];
        
        BIG_dfromBytesLen(dx,fd,L);
        BIG_dmod(w,dx,q);
        FP_nres(&u[i],w);
    }
}

int htp_BLS12381(char *mess)
{
    using namespace BLS12381;
    using namespace BLS12381_BIG;
    using namespace BLS12381_FP;
 
    int res=0;
    FP u[2];
    ECP P,P1;
    char dst[50];
    char msg[2000];
    octet MSG = {0,sizeof(msg),msg};
    octet DST = {0,sizeof(dst),dst};

    printf("Random Access - message= %s\n",mess);
    OCT_jstring(&MSG,mess);


    OCT_jstring(&DST,(char *)"BLS12381G1_XMD:SHA-256_SVDW_RO_TESTGEN");
    hash_to_field_BLS12381(MC_SHA2,HASH_TYPE_BLS12381,u,&DST,&MSG,2);
    printf("u[0]= "); FP_output(&u[0]); printf("\n");
    printf("u[1]= "); FP_output(&u[1]); printf("\n");
    ECP_map2point(&P,&u[0]);
    printf("Q[0]= "); ECP_output(&P);
    ECP_map2point(&P1,&u[1]);
    printf("Q[1]= "); ECP_output(&P1);
    ECP_add(&P,&P1);
    ECP_cfp(&P);
    ECP_affine(&P);
    printf("P= "); ECP_output(&P); printf("\n");

    printf("Non-Uniform\n");
    OCT_clear(&DST);
    OCT_jstring(&DST,(char *)"BLS12381G1_XMD:SHA-256_SVDW_NU_TESTGEN");
    hash_to_field_BLS12381(MC_SHA2,HASH_TYPE_BLS12381,u,&DST,&MSG,1);
    printf("u[0]= "); FP_output(&u[0]); printf("\n");
    ECP_map2point(&P,&u[0]);
    printf("Q= "); ECP_output(&P);

    ECP_cfp(&P);
    ECP_affine(&P);
    printf("P= "); ECP_output(&P); printf("\n");
    return res;
}

/* https://datatracker.ietf.org/doc/draft-irtf-cfrg-hash-to-curve/ */
static void hash_to_field_BLS12381_G2(int hash,int hlen,BLS12381::FP2 *u,octet *DST,octet *M, int ctr)
{
    using namespace BLS12381;
    using namespace BLS12381_BIG;
    
    int i,j,L,k,m;
    BIG q,w1,w2,r;
    DBIG dx;
    char okm[1024],fd[256];
    octet OKM = {0,sizeof(okm),okm};

    BIG_rcopy(q, Modulus);
    k=BIG_nbits(q);
    BIG_rcopy(r, CURVE_Order);
    m=BIG_nbits(r);
    L=CEIL(k+CEIL(m,2),8);

    //printf("L= %d\n",L);
    XMD_Expand(hash,hlen,&OKM,2*L*ctr,DST,M);
    for (i=0;i<ctr;i++)
    {
        for (j=0;j<L;j++)
            fd[j]=OKM.val[2*i*L+j];
        
        BIG_dfromBytesLen(dx,fd,L);
        BIG_dmod(w1,dx,q);
        
        for (j=0;j<L;j++)
            fd[j]=OKM.val[(2*i+1)*L+j];
        
        BIG_dfromBytesLen(dx,fd,L);
        BIG_dmod(w2,dx,q);

        FP2_from_BIGs(&u[i],w1,w2);
    }
}

int htp_BLS12381_G2(char *mess)
{
    using namespace BLS12381;
    using namespace BLS12381_BIG;

    int res=0;
    FP2 u[2];
    ECP2 P,P1;
    char dst[50];
    char msg[2000];
    octet MSG = {0,sizeof(msg),msg};
    octet DST = {0,sizeof(dst),dst};

    printf("Random Access - message= %s\n",mess);
    OCT_jstring(&MSG,mess);


    OCT_jstring(&DST,(char *)"BLS12381G2_XMD:SHA-256_SVDW_RO_TESTGEN");
    hash_to_field_BLS12381_G2(MC_SHA2,HASH_TYPE_BLS12381,u,&DST,&MSG,2);
    printf("u[0]= "); FP2_output(&u[0]); printf("\n");
    printf("u[1]= "); FP2_output(&u[1]); printf("\n");
    ECP2_map2point(&P,&u[0]);
    printf("Q[0]= "); ECP2_output(&P);
    ECP2_map2point(&P1,&u[1]);
    printf("Q[1]= "); ECP2_output(&P1);
    ECP2_add(&P,&P1);
    ECP2_cfp(&P);
    ECP2_affine(&P);
    printf("P= "); ECP2_output(&P); printf("\n");

    printf("Non-Uniform\n");
    OCT_clear(&DST);
    OCT_jstring(&DST,(char *)"BLS12381G2_XMD:SHA-256_SVDW_NU_TESTGEN");
    hash_to_field_BLS12381_G2(MC_SHA2,HASH_TYPE_BLS12381,u,&DST,&MSG,1);
    printf("u[0]= "); FP2_output(&u[0]); printf("\n");
    ECP2_map2point(&P,&u[0]);
    printf("Q= "); ECP2_output(&P);

    ECP2_cfp(&P);
    ECP2_affine(&P);
    printf("P= "); ECP2_output(&P); printf("\n");
    return res;
}

int main()
{
    int i, res;
    unsigned long ran;

    char raw[100];
    octet RAW = {0, sizeof(raw), raw};
    csprng RNG;                // Crypto Strong RNG

    time((time_t *)&ran);

    RAW.len = 100;              // fake random seed source
    RAW.val[0] = ran;
    RAW.val[1] = ran >> 8;
    RAW.val[2] = ran >> 16;
    RAW.val[3] = ran >> 24;
    for (i = 4; i < 100; i++) RAW.val[i] = i;

    CREATE_CSPRNG(&RNG, &RAW);  // initialise strong RNG

    printf("%d bit build", CHUNK);

    printf("\nTesting HTP for curve ED25519\n");
    htp_ED25519((char *)"");
    htp_ED25519((char *)"abc");
    htp_ED25519((char *)"abcdef0123456789");
    htp_ED25519((char *)"a512_aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");

    printf("\nTesting HTP for curve NIST256\n");
    htp_NIST256((char *)"");
    htp_NIST256((char *)"abc");
    htp_NIST256((char *)"abcdef0123456789");
    htp_NIST256((char *)"a512_aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");

    printf("\nTesting HTP for curve GOLDILOCKS\n");
    htp_GOLDILOCKS((char *)"");
    htp_GOLDILOCKS((char *)"abc");
    htp_GOLDILOCKS((char *)"abcdef0123456789");
    htp_GOLDILOCKS((char *)"a512_aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");

    printf("\nTesting HTP for curve SECP256K1\n");
    htp_SECP256K1((char *)"");
    htp_SECP256K1((char *)"abc");
    htp_SECP256K1((char *)"abcdef0123456789");
    htp_SECP256K1((char *)"a512_aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");

    printf("\nTesting HTP for curve BLS12381_G1\n");
    htp_BLS12381((char *)"");
    htp_BLS12381((char *)"abc");
    htp_BLS12381((char *)"abcdef0123456789");
    htp_BLS12381((char *)"a512_aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");

    printf("\nTesting HTP for curve BLS12381_G2\n");
    htp_BLS12381_G2((char *)"");
    htp_BLS12381_G2((char *)"abc");
    htp_BLS12381_G2((char *)"abcdef0123456789");
    htp_BLS12381_G2((char *)"a512_aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");

    KILL_CSPRNG(&RNG);
}


