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
//  ecp4.swift
//
//  Created by Michael Scott on 07/07/2015.
//  Copyright (c) 2015 Michael Scott. All rights reserved.
//

/* CORE Weierstrass elliptic curve functions over FP4 */

public struct ECP4 {
    private var x:FP4
    private var y:FP4
    private var z:FP4

    /* Constructor - set self=O */
    init()
    {
        x=FP4()
        y=FP4(1)
        z=FP4()
    }
    /* Test self=O? */
    public func is_infinity() -> Bool
    {
        return x.iszilch() && z.iszilch()
    }
    /* copy self=P */
    public mutating func copy(_ P:ECP4)
    {
        x.copy(P.x)
        y.copy(P.y)
        z.copy(P.z)
    }
    /* set self=O */
    mutating func inf() {
        x.zero()
        y.one()
        z.zero()
    }

    /* Conditional move of Q to P dependant on d */
    mutating func cmove(_ Q:ECP4,_ d:Int)
    {
        x.cmove(Q.x,d);
        y.cmove(Q.y,d);
        z.cmove(Q.z,d);
    }

    /* return 1 if b==c, no branching */
    private static func teq(_ b:Int32,_ c:Int32) -> Int
    {
        var x=b^c
        x-=1  // if x=0, x now -1
        return Int((x>>31)&1)
    }
    /* Constant time select from pre-computed table */
    mutating func select(_ W:[ECP4],_ b:Int32)
    {
        var MP=ECP4()
        let m=b>>31
        var babs=(b^m)-m

        babs=(babs-1)/2

        cmove(W[0],ECP4.teq(babs,0)) // conditional move
        cmove(W[1],ECP4.teq(babs,1))
        cmove(W[2],ECP4.teq(babs,2))
        cmove(W[3],ECP4.teq(babs,3))
        cmove(W[4],ECP4.teq(babs,4))
        cmove(W[5],ECP4.teq(babs,5))
        cmove(W[6],ECP4.teq(babs,6))
        cmove(W[7],ECP4.teq(babs,7))

        MP.copy(self)
        MP.neg()
        cmove(MP,Int(m&1))
    }

    /* Test if P == Q */
    func equals(_ Q:ECP4) -> Bool
    {

        var a=FP4(x)
        var b=FP4(Q.x)
        a.mul(Q.z); b.mul(z)
        if !a.equals(b) {return false}
        a.copy(y); a.mul(Q.z)
        b.copy(Q.y); b.mul(z)
        if !a.equals(b) {return false}

        return true;
    }
    /* set self=-self */
    mutating func neg()
    {
        y.norm(); y.neg(); y.norm()
        return
    }
    /* set to Affine - (x,y,z) to (x,y) */
    mutating func affine() {
        if is_infinity() {return}
        let one=FP4(1)
        if z.equals(one) {
            x.reduce(); y.reduce()
            return
        }
        z.inverse()

        x.mul(z); x.reduce()
        y.mul(z); y.reduce()
        z.copy(one)
    }

    /* extract affine x as FP4 */
    func getX() -> FP4
    {
        var W=ECP4(); W.copy(self)
        W.affine()
        return W.x
    }
    /* extract affine y as FP4 */
    func getY() -> FP4
    {
        var W=ECP4(); W.copy(self)
        W.affine()
        return W.y
    }
    /* extract projective x */
    func getx() -> FP4
    {
        return x
    }
    /* extract projective y */
    func gety() -> FP4
    {
        return y
    }
    /* extract projective z */
    func getz() -> FP4
    {
        return z
    }

    /* convert to byte array */
    func toBytes(_ b:inout [UInt8],_ compress: Bool)
    {
        let RM=Int(CONFIG_BIG.MODBYTES)
        var t=[UInt8](repeating: 0,count: RM)
        var W=ECP4(); W.copy(self)
        W.affine()
        b[0]=0x06

        W.x.geta().getA().toBytes(&t)
        for i in 0 ..< RM
            {b[i+1]=t[i]}
        W.x.geta().getB().toBytes(&t);
        for i in 0 ..< RM
            {b[i+RM+1]=t[i]}

        W.x.getb().getA().toBytes(&t)
        for i in 0 ..< RM
            {b[i+2*RM+1]=t[i]}
        W.x.getb().getB().toBytes(&t);
        for i in 0 ..< RM
            {b[i+3*RM+1]=t[i]}

        if !compress {
            b[0]=0x04
            W.y.geta().getA().toBytes(&t);
            for i in 0 ..< RM
                {b[i+4*RM+1]=t[i]}
            W.y.geta().getB().toBytes(&t);
            for i in 0 ..< RM
                {b[i+5*RM+1]=t[i]}

            W.y.getb().getA().toBytes(&t);
            for i in 0 ..< RM
                {b[i+6*RM+1]=t[i]}
            W.y.getb().getB().toBytes(&t);
            for i in 0 ..< RM
                {b[i+7*RM+1]=t[i]}
         } else {
            b[0]=0x02
            if W.y.sign() == 1 {
                b[0]=0x03
            }
        }
    }

    /* convert from byte array to point */
    static func fromBytes(_ b:[UInt8]) -> ECP4
    {
        let RM=Int(CONFIG_BIG.MODBYTES)
        var t=[UInt8](repeating: 0,count: RM)
        let typ = Int(b[0])

        for i in 0 ..< RM {t[i]=b[i+1]}
        var ra=BIG.fromBytes(t);
        for i in 0 ..< RM {t[i]=b[i+RM+1]}
        var rb=BIG.fromBytes(t);

        var ra2=FP2(ra,rb)

        for i in 0 ..< RM {t[i]=b[i+2*RM+1]}
        ra.copy(BIG.fromBytes(t));
        for i in 0 ..< RM {t[i]=b[i+3*RM+1]}
        rb.copy(BIG.fromBytes(t));

        var rb2=FP2(ra,rb)

        let rx=FP4(ra2,rb2)

        if typ == 0x04 {
            for i in 0 ..< RM {t[i]=b[i+4*RM+1]}
            ra.copy(BIG.fromBytes(t))
            for i in 0 ..< RM {t[i]=b[i+5*RM+1]}
            rb.copy(BIG.fromBytes(t))

            ra2.copy(FP2(ra,rb))

            for i in 0 ..< RM {t[i]=b[i+6*RM+1]}
            ra.copy(BIG.fromBytes(t))
            for i in 0 ..< RM {t[i]=b[i+7*RM+1]}
            rb.copy(BIG.fromBytes(t))

            rb2.copy(FP2(ra,rb))

            let ry=FP4(ra2,rb2)

            return ECP4(rx,ry)
        } else {
            return ECP4(rx,typ&1)
        }
    }

/* convert self to hex string */
    func toString() -> String
    {
        var W=ECP4(); W.copy(self)
        if W.is_infinity() {return "infinity"}
        W.affine()
        return "("+W.x.toString()+","+W.y.toString()+")"
    }

/* Calculate RHS of twisted curve equation x^3+B/i */
    static func RHS(_ x:FP4) -> FP4
    {
        //x.norm()
        var r=FP4(x)
        r.sqr()
        var b=FP4(FP2(BIG(ROM.CURVE_B)))
        if CONFIG_CURVE.SEXTIC_TWIST == CONFIG_CURVE.D_TYPE {
            b.div_i()
        }
        if CONFIG_CURVE.SEXTIC_TWIST == CONFIG_CURVE.M_TYPE {
            b.times_i()
        }
        r.mul(x)
        r.add(b)

        r.reduce()
        return r
    }
/* construct self from (x,y) - but set to O if not on curve */
    public init(_ ix:FP4,_ iy:FP4)
    {
        x=FP4(ix)
        y=FP4(iy)
        z=FP4(1)
        x.norm()
        let rhs=ECP4.RHS(x)
        var y2=FP4(y)
        y2.sqr()
        if !y2.equals(rhs) {inf()}
    }

    /* construct this from x - but set to O if not on curve */
    init(_ ix:FP4,_ s:Int)
    {
        x=FP4(ix)
        y=FP4(1)
        z=FP4(1)
        x.norm()
        var rhs=ECP4.RHS(x)
 	    if rhs.qr() == 1 {
		    rhs.sqrt()
		    if rhs.sign() != s {
			    rhs.neg()
		    }
		    rhs.reduce()
		    y.copy(rhs)
        }
        else {inf()}
    }

    /* this+=this */
    @discardableResult mutating func dbl() -> Int
    {
        if y.iszilch()
        {
            inf();
            return -1;
        }

        var iy=FP4(y)
        if CONFIG_CURVE.SEXTIC_TWIST == CONFIG_CURVE.D_TYPE {
            iy.times_i();
        }

        var t0=FP4(y)
        t0.sqr();
        if CONFIG_CURVE.SEXTIC_TWIST == CONFIG_CURVE.D_TYPE {
            t0.times_i()
        }
        var t1=FP4(iy)
        t1.mul(z)
        var t2=FP4(z)
        t2.sqr()

        z.copy(t0)
        z.add(t0); z.norm()
        z.add(z)
        z.add(z)
        z.norm()

        t2.imul(3*ROM.CURVE_B_I)
        if CONFIG_CURVE.SEXTIC_TWIST == CONFIG_CURVE.M_TYPE {
            t2.times_i()
        }
        var x3=FP4(t2)
        x3.mul(z)

        var y3=FP4(t0)

        y3.add(t2); y3.norm()
        z.mul(t1)
        t1.copy(t2); t1.add(t2); t2.add(t1); t2.norm()
        t0.sub(t2); t0.norm()                           //y^2-9bz^2
        y3.mul(t0); y3.add(x3)                          //(y^2+3z*2)(y^2-9z^2)+3b.z^2.8y^2
        t1.copy(x); t1.mul(iy)                     //
        x.copy(t0); x.norm(); x.mul(t1); x.add(x)       //(y^2-9bz^2)xy2

        x.norm()
        y.copy(y3); y.norm()
        return 1
    }

/* this+=Q - return 0 for add, 1 for double, -1 for O */
    @discardableResult mutating func add(_ Q:ECP4) -> Int
    {

        let b=3*ROM.CURVE_B_I
        var t0=FP4(x)
        t0.mul(Q.x)         // x.Q.x
        var t1=FP4(y)
        t1.mul(Q.y)         // y.Q.y

        var t2=FP4(z)
        t2.mul(Q.z)
        var t3=FP4(x)
        t3.add(y); t3.norm()          //t3=X1+Y1
        var t4=FP4(Q.x)
        t4.add(Q.y); t4.norm()         //t4=X2+Y2
        t3.mul(t4)                     //t3=(X1+Y1)(X2+Y2)
        t4.copy(t0); t4.add(t1)        //t4=X1.X2+Y1.Y2

        t3.sub(t4); t3.norm();
        if CONFIG_CURVE.SEXTIC_TWIST == CONFIG_CURVE.D_TYPE {
            t3.times_i()         //t3=(X1+Y1)(X2+Y2)-(X1.X2+Y1.Y2) = X1.Y2+X2.Y1
        }
        t4.copy(y)
        t4.add(z); t4.norm()           //t4=Y1+Z1
        var x3=FP4(Q.y)
        x3.add(Q.z); x3.norm()         //x3=Y2+Z2

        t4.mul(x3)                     //t4=(Y1+Z1)(Y2+Z2)
        x3.copy(t1)                    //
        x3.add(t2)                     //X3=Y1.Y2+Z1.Z2

        t4.sub(x3); t4.norm();
        if CONFIG_CURVE.SEXTIC_TWIST == CONFIG_CURVE.D_TYPE {
            t4.times_i()          //t4=(Y1+Z1)(Y2+Z2) - (Y1.Y2+Z1.Z2) = Y1.Z2+Y2.Z1
        }
        x3.copy(x); x3.add(z); x3.norm()   // x3=X1+Z1
        var y3=FP4(Q.x)
        y3.add(Q.z); y3.norm()             // y3=X2+Z2
        x3.mul(y3)                         // x3=(X1+Z1)(X2+Z2)
        y3.copy(t0)
        y3.add(t2)                         // y3=X1.X2+Z1+Z2
        y3.rsub(x3); y3.norm()             // y3=(X1+Z1)(X2+Z2) - (X1.X2+Z1.Z2) = X1.Z2+X2.Z1
        if CONFIG_CURVE.SEXTIC_TWIST == CONFIG_CURVE.D_TYPE {
            t0.times_i() // x.Q.x
            t1.times_i() // y.Q.y
        }
        x3.copy(t0); x3.add(t0)
        t0.add(x3); t0.norm()
        t2.imul(b)
        if CONFIG_CURVE.SEXTIC_TWIST == CONFIG_CURVE.M_TYPE {
            t2.times_i()
        }
        var z3=FP4(t1); z3.add(t2); z3.norm()
        t1.sub(t2); t1.norm()
        y3.imul(b)
        if CONFIG_CURVE.SEXTIC_TWIST == CONFIG_CURVE.M_TYPE {
            y3.times_i()
        }
        x3.copy(y3); x3.mul(t4); t2.copy(t3); t2.mul(t1); x3.rsub(t2)
        y3.mul(t0); t1.mul(z3); y3.add(t1)
        t0.mul(t3); z3.mul(t4); z3.add(t0)

        x.copy(x3); x.norm()
        y.copy(y3); y.norm()
        z.copy(z3); z.norm()

        return 0
    }

    /* set self-=Q */
    @discardableResult mutating func sub(_ Q:ECP4) -> Int
    {
        var NQ=ECP4(); NQ.copy(Q)
        NQ.neg()
        let D=add(NQ)
        return D
    }


    static func frob_constants() -> [FP2]
    {
        let Fra=BIG(ROM.Fra)
        let Frb=BIG(ROM.Frb)
        let X=FP2(Fra,Frb)

        var f0=FP2(X); f0.sqr()
        var f2=FP2(f0)
        f2.mul_ip(); f2.norm()
        var f1=FP2(f2); f1.sqr()
        f2.mul(f1); f1.copy(X)
        if CONFIG_CURVE.SEXTIC_TWIST == CONFIG_CURVE.M_TYPE {
            f1.mul_ip()
            f1.inverse()
            f0.copy(f1); f0.sqr()

        }
        f0.mul_ip(); f0.norm()
        f1.mul(f0)

        let F=[FP2(f0),FP2(f1),FP2(f2)];
        return F;
    }


/* set self*=q, where q is Modulus, using Frobenius */
    mutating func frob(_ F:[FP2],_ n:Int)
    {
        for _ in 0 ..< n {
            x.frob(F[2])
            x.pmul(F[0])

            y.frob(F[2])
            y.pmul(F[1])
            y.times_i()

            z.frob(F[2])
        }
    }

    /* P*=e */
    func mul(_ e:BIG) -> ECP4
    {
    /* fixed size windows */
        var mt=BIG()
        var t=BIG()
        var P=ECP4()
        var Q=ECP4()
        var C=ECP4()

        var W=[ECP4]();
        for _ in 0 ..< 8 {W.append(ECP4())}

        var w=[Int8](repeating: 0,count: 1+(CONFIG_BIG.NLEN*Int(CONFIG_BIG.BASEBITS)+3)/4)

        if is_infinity() {return ECP4()}

    /* precompute table */
        Q.copy(self)
        Q.dbl()
        W[0].copy(self)

        for i in 1 ..< 8
        {
            W[i].copy(W[i-1])
            W[i].add(Q)
        }

    /* make exponent odd - add 2P if even, P if odd */
        t.copy(e)
        let s=t.parity()
        t.inc(1); t.norm(); let ns=t.parity(); mt.copy(t); mt.inc(1); mt.norm()
        t.cmove(mt,s)
        Q.cmove(self,ns)
        C.copy(Q)

        let nb=1+(t.nbits()+3)/4
    /* convert exponent to signed 4-bit window */
        for i in 0 ..< nb
        {
            w[i]=Int8(t.lastbits(5)-16)
            t.dec(Int(w[i])); t.norm()
            t.fshr(4)
        }
        w[nb]=Int8(t.lastbits(5))

        P.copy(W[Int(w[nb]-1)/2])
        for i in (0...nb-1).reversed()
        {
            Q.select(W,Int32(w[i]))
            P.dbl()
            P.dbl()
            P.dbl()
            P.dbl()
            P.add(Q)
        }
        P.sub(C);
        P.affine()
        return P;
    }

    // clear cofactor
    mutating public func cfp()
    {
    // Fast Hashing to G2 - Fuentes-Castaneda, Knapp and Rodriguez-Henriquez
        let F=ECP4.frob_constants()
        let x=BIG(ROM.CURVE_Bnx);

        var xQ=self.mul(x);
        var x2Q=xQ.mul(x)
        var x3Q=x2Q.mul(x)
        var x4Q=x3Q.mul(x)

        if CONFIG_CURVE.SIGN_OF_X == CONFIG_CURVE.NEGATIVEX {
            xQ.neg()
            x3Q.neg()
        }

        x4Q.sub(x3Q)
        x4Q.sub(self)

        x3Q.sub(x2Q)
        x3Q.frob(F,1)

        x2Q.sub(xQ)
        x2Q.frob(F,2)

        xQ.sub(self)
        xQ.frob(F,3)

        self.dbl()
        self.frob(F,4)

        self.add(x4Q)
        self.add(x3Q)
        self.add(x2Q)
        self.add(xQ)

        self.affine()
    }


    /* P=u0.Q0+u1*Q1+u2*Q2+u3*Q3.. */
    // Bos & Costello https://eprint.iacr.org/2013/458.pdf
    // Faz-Hernandez & Longa & Sanchez  https://eprint.iacr.org/2013/158.pdf
    // Side channel attack secure

    static func mul8(_ Q:[ECP4],_ u:[BIG]) -> ECP4
    {
        var W=ECP4()
        var P=ECP4()

        var T1=[ECP4]()
        var T2=[ECP4]()

        for _ in 0 ..< 8 {
            T1.append(ECP4())
            T2.append(ECP4())
        }

        var mt=BIG()
        var t=[BIG]()

        var w1=[Int8](repeating: 0,count: CONFIG_BIG.NLEN*Int(CONFIG_BIG.BASEBITS)+1)
        var s1=[Int8](repeating: 0,count: CONFIG_BIG.NLEN*Int(CONFIG_BIG.BASEBITS)+1)

        var w2=[Int8](repeating: 0,count: CONFIG_BIG.NLEN*Int(CONFIG_BIG.BASEBITS)+1)
        var s2=[Int8](repeating: 0,count: CONFIG_BIG.NLEN*Int(CONFIG_BIG.BASEBITS)+1)

        for i in 0 ..< 8
        {
            t.append(BIG(u[i]))
            t[i].norm()
        }

    // precompute table

        T1[0].copy(Q[0])  // Q[0]
        T1[1].copy(T1[0]); T1[1].add(Q[1])  // Q[0]+Q[1]
        T1[2].copy(T1[0]); T1[2].add(Q[2])  // Q[0]+Q[2]
        T1[3].copy(T1[1]); T1[3].add(Q[2])  // Q[0]+Q[1]+Q[2]
        T1[4].copy(T1[0]); T1[4].add(Q[3])  // Q[0]+Q[3]
        T1[5].copy(T1[1]); T1[5].add(Q[3])  // Q[0]+Q[1]+Q[3]
        T1[6].copy(T1[2]); T1[6].add(Q[3])  // Q[0]+Q[2]+Q[3]
        T1[7].copy(T1[3]); T1[7].add(Q[3])  // Q[0]+Q[1]+Q[2]+Q[3]

        T2[0].copy(Q[4])  // Q[0]
        T2[1].copy(T2[0]); T2[1].add(Q[5])  // Q[0]+Q[1]
        T2[2].copy(T2[0]); T2[2].add(Q[6])  // Q[0]+Q[2]
        T2[3].copy(T2[1]); T2[3].add(Q[6])  // Q[0]+Q[1]+Q[2]
        T2[4].copy(T2[0]); T2[4].add(Q[7])  // Q[0]+Q[3]
        T2[5].copy(T2[1]); T2[5].add(Q[7])  // Q[0]+Q[1]+Q[3]
        T2[6].copy(T2[2]); T2[6].add(Q[7])  // Q[0]+Q[2]+Q[3]
        T2[7].copy(T2[3]); T2[7].add(Q[7])  // Q[0]+Q[1]+Q[2]+Q[3]

// Make it odd
        let pb1=1-t[0].parity()
        t[0].inc(pb1)
        t[0].norm()

        let pb2=1-t[4].parity()
        t[4].inc(pb2)
        t[4].norm()

// Number of bits
        mt.zero();
        for i in 0 ..< 8 {
            mt.or(t[i]);
        }

        let nb=1+mt.nbits()

// Sign pivot

        s1[nb-1]=1
        s2[nb-1]=1
        for i in 0 ..< nb-1 {
            t[0].fshr(1)
            s1[i]=2*Int8(t[0].parity())-1
            t[4].fshr(1)
            s2[i]=2*Int8(t[4].parity())-1
        }

// Recoded exponent
        for i in 0 ..< nb {
            w1[i]=0
            var k=1
            for j in 1 ..< 4 {
                let bt=s1[i]*Int8(t[j].parity())
                t[j].fshr(1)
                t[j].dec(Int(bt>>1))
                t[j].norm()
                w1[i]+=bt*Int8(k)
                k=2*k
            }
            w2[i]=0
            k=1
            for j in 5 ..< 8 {
                let bt=s2[i]*Int8(t[j].parity())
                t[j].fshr(1)
                t[j].dec(Int(bt>>1))
                t[j].norm()
                w2[i]+=bt*Int8(k)
                k=2*k
            }
        }

// Main loop
        P.select(T1,Int32(2*w1[nb-1]+1))
        W.select(T2,Int32(2*w2[nb-1]+1))
        P.add(W)
        for i in (0 ..< nb-1).reversed() {
            P.dbl()
            W.select(T1,Int32(2*w1[i]+s1[i]))
            P.add(W)
            W.select(T2,Int32(2*w2[i]+s2[i]))
            P.add(W)
        }

        W.copy(P)
        W.sub(Q[0])
        P.cmove(W,pb1)

        W.copy(P)
        W.sub(Q[4])
        P.cmove(W,pb2)

        P.affine()
        return P
    }

/* Hunt and Peck a BIG to a curve point */
    static public func hap2point(_ h:BIG) -> ECP4
    {
        let one=BIG(1)
        var Q=ECP4()
        var x=BIG(h)
        while (true)
        {
            let X=FP4(FP2(one,x))
            Q=ECP4(X,0);
            if !Q.is_infinity() {break}
            x.inc(1); x.norm();
        }
        return Q
    }

/* Constant time Map to Point */
    static public func map2point(_ H:FP4) -> ECP4
    { // Shallue and van de Woestijne
        var W=FP4(1)
        var B=FP4(FP2(BIG(ROM.CURVE_B)))
        var T=FP4(H)
//        var s=FP(-3)
//        let one=FP(1)
		if CONFIG_CURVE.SEXTIC_TWIST == CONFIG_CURVE.D_TYPE {
            B.div_i();
        }
		if CONFIG_CURVE.SEXTIC_TWIST == CONFIG_CURVE.M_TYPE {
            B.times_i();
        }
        B.norm()
        let sgn=T.sign()

        var Z=FP4(CONFIG_FIELD.RIADZG2A,CONFIG_FIELD.RIADZG2B);
        var X1=FP4(Z)
        var X3=FP4(X1)
        var A=ECP4.RHS(X1)
        T.sqr()
        var Y=FP4(A); Y.mul(T)
        T.copy(W); T.add(Y); T.norm()
        Y.rsub(W); Y.norm()
        var NY=FP4(T); NY.mul(Y); NY.inverse()
        A.neg(); A.norm()
        W.copy(A); W.imul(3); W.sqrt()
        W.mul(Z)
        W.mul(H); W.mul(Y); W.mul(NY)
        X1.neg(); X1.norm(); X1.div2()
        var X2=FP4(X1)
        X1.sub(W); X1.norm()
        X2.add(W); X2.norm()
        A.add(A); A.add(A); A.norm()
        T.sqr(); T.mul(NY); T.sqr()
        A.mul(T)
        Z.sqr(); Z.imul(3); T.copy(Z)
        T.inverse()
        A.mul(T)
        X3.add(A); X3.norm()
/*
        let w=s.sqrt(nil)
        var j=FP(w); j.sub(one); j.norm(); j.div2()

        var S=FP4(T)
        S.qmul(w)
        var Y=FP4(T)
        Y.sqr()
        Y.add(W)
        B.add(Y); B.norm(); B.inverse()
        B.mul(S)

        var X1=FP4(B); X1.mul(T)
        Y.copy(FP4(j))
        var X2=FP4(X1); X2.sub(Y); X2.norm()
        X1.copy(X2); X1.neg(); X1.norm()
        X2.sub(W); X2.norm()

        B.sqr(); B.inverse()
        var X3=FP4(B); X3.add(W); X3.norm()
*/


        Y.copy(ECP4.RHS(X2))
        X3.cmove(X2,Y.qr())
        Y.copy(ECP4.RHS(X1))
        X3.cmove(X1,Y.qr())
        Y.copy(ECP4.RHS(X3))
        Y.sqrt()

        let ne=Y.sign()^sgn
        W.copy(Y); W.neg(); W.norm()
        Y.cmove(W,ne)

        return ECP4(X3,Y)
    }

/* Map octet string to curve point */
	static public func mapit(_ h:[UInt8]) -> ECP4
	{
		let q=BIG(ROM.Modulus)
		var dx=DBIG.fromBytes(h)
        let x=dx.mod(q)

		var Q=ECP4.hap2point(x);
		Q.cfp()
        return Q
    }

    static public func generator() -> ECP4
    {
        return ECP4(FP4(FP2(BIG(ROM.CURVE_Pxaa),BIG(ROM.CURVE_Pxab)),FP2(BIG(ROM.CURVE_Pxba),BIG(ROM.CURVE_Pxbb))),FP4(FP2(BIG(ROM.CURVE_Pyaa),BIG(ROM.CURVE_Pyab)),FP2(BIG(ROM.CURVE_Pyba),BIG(ROM.CURVE_Pybb))))
    }

}


