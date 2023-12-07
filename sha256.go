package property

import (
	"encoding/binary"
)

func ROTR(n uint32, bits uint) uint32 {
	return (n >> bits) | (n << (32 - bits))
}

func sha256(data []byte) []byte {
	I := []uint32{
		0x6a09e667, 0xbb67ae85, 0x3c6ef372, 0xa54ff53a,
		0x510e527f, 0x9b05688c, 0x1f83d9ab, 0x5be0cd19,
	}
	C := []uint32{
		0x428a2f98, 0x71374491, 0xb5c0fbcf, 0xe9b5dba5,
		0x3956c25b, 0x59f111f1, 0x923f82a4, 0xab1c5ed5,
		0xd807aa98, 0x12835b01, 0x243185be, 0x550c7dc3,
		0x72be5d74, 0x80deb1fe, 0x9bdc06a7, 0xc19bf174,
		0xe49b69c1, 0xefbe4786, 0x0fc19dc6, 0x240ca1cc,
		0x2de92c6f, 0x4a7484aa, 0x5cb0a9dc, 0x76f988da,
		0x983e5152, 0xa831c66d, 0xb00327c8, 0xbf597fc7,
		0xc6e00bf3, 0xd5a79147, 0x06ca6351, 0x14292967,
		0x27b70a85, 0x2e1b2138, 0x4d2c6dfc, 0x53380d13,
		0x650a7354, 0x766a0abb, 0x81c2c92e, 0x92722c85,
		0xa2bfe8a1, 0xa81a664b, 0xc24b8b70, 0xc76c51a3,
		0xd192e819, 0xd6990624, 0xf40e3585, 0x106aa070,
		0x19a4c116, 0x1e376c08, 0x2748774c, 0x34b0bcb5,
		0x391c0cb3, 0x4ed8aa4a, 0x5b9cca4f, 0x682e6ff3,
		0x748f82ee, 0x78a5636f, 0x84c87814, 0x8cc70208,
		0x90befffa, 0xa4506ceb, 0xbef9a3f7, 0xc67178f2,
	}
	padding := []byte{0x80}
	padding = append(padding, make([]byte, (55-len(data))&63)...)
	lengthBits := make([]byte, 8)
	dataLength := uint64(len(data) * 8)
	for i := 0; i < 8; i++ {
		lengthBits[i] = byte(dataLength & 0xFF)
		dataLength >>= 8
	}
	buffer := append(data, padding...)
	buffer = append(buffer, lengthBits...)
	for len(buffer) >= 64 {
		W := make([]uint32, 0, 64)
		for i := 0; i < 16; i++ {
			word := binary.BigEndian.Uint32(buffer[i*4 : (i+1)*4])
			W = append(W, word)
		}
		for i := 16; i < 64; i++ {
			s0 := (ROTR(W[i-15], 7) ^ ROTR(W[i-15], 18) ^ (W[i-15] >> 3))
			s1 := (ROTR(W[i-2], 17) ^ ROTR(W[i-2], 19) ^ (W[i-2] >> 10))
			W = append(W, (W[i-16]+s0+W[i-7]+s1)&0xFFFFFFFF)
		}
		a, b, c, d, e, f, g, h := I[0], I[1], I[2], I[3], I[4], I[5], I[6], I[7]
		for i := 0; i < 64; i++ {
			T1 := h + (ROTR(e, 6) ^ ROTR(e, 11) ^ ROTR(e, 25)) + ((e & f) ^ (^e & g)) + C[i] + W[i]
			T2 := (ROTR(a, 2) ^ ROTR(a, 13) ^ ROTR(a, 22)) + ((a & b) ^ (a & c) ^ (b & c))
			h, g, f, e, d, c, b, a = g, f, e, (d+T1)&0xFFFFFFFF, c, b, a, (T1+T2)&0xFFFFFFFF
		}
		I[0] = (I[0] + a) & 0xFFFFFFFF
		I[1] = (I[1] + b) & 0xFFFFFFFF
		I[2] = (I[2] + c) & 0xFFFFFFFF
		I[3] = (I[3] + d) & 0xFFFFFFFF
		I[4] = (I[4] + e) & 0xFFFFFFFF
		I[5] = (I[5] + f) & 0xFFFFFFFF
		I[6] = (I[6] + g) & 0xFFFFFFFF
		I[7] = (I[7] + h) & 0xFFFFFFFF
		buffer = buffer[64:]
	}
	result := make([]byte, 32)
	for i, val := range I {
		result[i*4] = byte(val >> 24)
		result[i*4+1] = byte(val >> 16)
		result[i*4+2] = byte(val >> 8)
		result[i*4+3] = byte(val)
	}
	return result
}
