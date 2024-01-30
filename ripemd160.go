package core

import (
	"math/bits"
)

var (
	K = [10]uint32{
		0x00000000, 0x5a827999, 0x6ed9eba1, 0x8f1bbcdc, 0xa953fd4e,
		0x50a28be6, 0x5c4dd124, 0x6d703ef3, 0x7a6d76e9, 0x00000000,
	}
	H = [5]uint32{
		0x67452301, 0xefcdab89, 0x98badcfe, 0x10325476, 0xc3d2e1f0,
	}
	x = [16]uint32{
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00,
	}
	r = [80]int{
		0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15,
		7, 4, 13, 1, 10, 6, 15, 3, 12, 0, 9, 5, 2, 14, 11, 8,
		3, 10, 14, 4, 9, 15, 8, 1, 2, 7, 0, 6, 13, 11, 5, 12,
		1, 9, 11, 10, 0, 8, 12, 4, 13, 3, 7, 15, 14, 5, 6, 2,
		4, 0, 5, 9, 7, 12, 2, 10, 14, 1, 3, 8, 11, 6, 15, 13,
	}

	r1 = [80]int{
		5, 14, 7, 0, 9, 2, 11, 4, 13, 6, 15, 8, 1, 10, 3, 12,
		6, 11, 3, 7, 0, 13, 5, 10, 14, 15, 8, 12, 4, 9, 1, 2,
		15, 5, 1, 3, 7, 14, 6, 9, 11, 8, 12, 2, 10, 0, 4, 13,
		8, 6, 4, 1, 3, 11, 15, 0, 5, 12, 2, 13, 9, 7, 10, 14,
		12, 15, 10, 4, 1, 5, 8, 7, 6, 2, 13, 14, 0, 3, 9, 11,
	}

	s = [80]int{
		11, 14, 15, 12, 5, 8, 7, 9, 11, 13, 14, 15, 6, 7, 9, 8,
		7, 6, 8, 13, 11, 9, 7, 15, 7, 12, 15, 9, 11, 7, 13, 12,
		11, 13, 6, 7, 14, 9, 13, 15, 14, 8, 13, 6, 5, 12, 7, 5,
		11, 12, 14, 15, 14, 15, 9, 8, 9, 14, 5, 6, 8, 6, 5, 12,
		9, 15, 5, 11, 6, 8, 13, 12, 5, 12, 13, 14, 11, 8, 5, 6,
	}

	s1 = [80]int{
		8, 9, 9, 11, 13, 15, 15, 5, 7, 7, 8, 11, 14, 14, 12, 6,
		9, 13, 15, 7, 12, 8, 9, 11, 7, 7, 12, 7, 6, 15, 13, 11,
		9, 7, 15, 11, 8, 6, 6, 14, 12, 13, 5, 14, 13, 13, 7, 5,
		15, 5, 8, 11, 14, 14, 6, 14, 6, 9, 12, 9, 12, 5, 15, 8,
		8, 5, 12, 9, 12, 5, 14, 6, 8, 13, 6, 5, 15, 13, 11, 11,
	}
)

type digest struct {
	h  [5]uint32
	x  [64]byte
	nx int
	tc uint64
}

func (d *digest) Size() int { return 20 }

func (d *digest) BlockSize() int { return 64 }

func RIPEMD160(data []byte) []byte {
	d := &digest{
		h:  [5]uint32{H[0], H[1], H[2], H[3], H[4]},
		nx: 0,
		tc: 0,
	}
	d.Write(data)
	return d.Sum(nil)
}

func (d *digest) Write(p []byte) (err error) {
	if d.tc += uint64(len(p)); d.nx > 0 {
		n := len(p)
		if n > 64-d.nx {
			n = 64 - d.nx
		}
		copy(d.x[d.nx:], p[:n])
		if d.nx += n; d.nx == 64 {
			block(d, d.x[:])
			d.nx = 0
		}
		p = p[n:]
	}
	for len(p) >= 64 {
		block(d, p[:64])
		p = p[64:]
	}
	if len(p) > 0 {
		d.nx = copy(d.x[:], p)
	}
	return
}

func (d0 *digest) Sum(in []byte) []byte {
	d := *d0
	tc := d.tc
	padding := make([]byte, 64)
	padding[0] = 0x80
	paddingSize := 56 - tc%64
	if tc%64 >= 56 {
		paddingSize = 64 + paddingSize
	}
	d.Write(padding[:paddingSize])
	tc <<= 3
	for i := 0; i < 8; i++ {
		padding[i] = byte(tc >> (8 * i))
	}
	d.Write(padding[:8])
	if d.nx != 0 {
		panic("d.nx != 0")
	}
	digest := make([]byte, 20)
	for i, s := range d.h {
		digest[i*4] = byte(s)
		digest[i*4+1] = byte(s >> 8)
		digest[i*4+2] = byte(s >> 16)
		digest[i*4+3] = byte(s >> 24)
	}
	return append(in, digest...)
}

func block(md *digest, p []byte) int {
	n := 0
	for len(p) >= 64 {
		a, b, c, d, e := md.h[0], md.h[1], md.h[2], md.h[3], md.h[4]
		aa, bb, cc, dd, ee := a, b, c, d, e
		for i := 0; i <= 15; i++ {
			x[i] = uint32(p[i*4]) | uint32(p[i*4+1])<<8 | uint32(p[i*4+2])<<16 | uint32(p[i*4+3])<<24
		}
		for i := 0; i <= 79; i++ {
			switch {
			case i <= 15:
				a, b, c, d, e = e, bits.RotateLeft32(a+(b^c^d)+x[r[i]]+K[0], s[i])+e, b, bits.RotateLeft32(c, 10), d
				aa, bb, cc, dd, ee = ee, bits.RotateLeft32(aa+(bb^(cc|^dd))+x[r1[i]]+K[5], s1[i])+ee, bb, bits.RotateLeft32(cc, 10), dd
			case i <= 31:
				a, b, c, d, e = e, bits.RotateLeft32(a+(b&c|^b&d)+x[r[i]]+K[1], s[i])+e, b, bits.RotateLeft32(c, 10), d
				aa, bb, cc, dd, ee = ee, bits.RotateLeft32(aa+(bb&dd|cc&^dd)+x[r1[i]]+K[6], s1[i])+ee, bb, bits.RotateLeft32(cc, 10), dd
			case i <= 47:
				a, b, c, d, e = e, bits.RotateLeft32(a+(b|^c^d)+x[r[i]]+K[2], s[i])+e, b, bits.RotateLeft32(c, 10), d
				aa, bb, cc, dd, ee = ee, bits.RotateLeft32(aa+(bb|^cc^dd)+x[r1[i]]+K[7], s1[i])+ee, bb, bits.RotateLeft32(cc, 10), dd
			case i <= 63:
				a, b, c, d, e = e, bits.RotateLeft32(a+(b&d|c&^d)+x[r[i]]+K[3], s[i])+e, b, bits.RotateLeft32(c, 10), d
				aa, bb, cc, dd, ee = ee, bits.RotateLeft32(aa+(bb&cc|^bb&dd)+x[r1[i]]+K[8], s1[i])+ee, bb, bits.RotateLeft32(cc, 10), dd
			case i <= 79:
				a, b, c, d, e = e, bits.RotateLeft32(a+(b^(c|^d))+x[r[i]]+K[4], s[i])+e, b, bits.RotateLeft32(c, 10), d
				aa, bb, cc, dd, ee = ee, bits.RotateLeft32(aa+(bb^cc^dd)+x[r1[i]]+K[9], s1[i])+ee, bb, bits.RotateLeft32(cc, 10), dd
			}
		}
		dd += c + md.h[1]
		md.h[1], md.h[2], md.h[3], md.h[4], md.h[0] = md.h[2]+d+ee, md.h[3]+e+aa, md.h[4]+a+bb, md.h[0]+b+cc, dd
		p = p[64:]
		n += 64
	}
	return n
}
