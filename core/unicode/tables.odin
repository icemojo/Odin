package unicode

@(private) pC     :: 1<<0 // a control character.
@(private) pP     :: 1<<1 // a punctuation character.
@(private) pN     :: 1<<2 // a numeral.
@(private) pS     :: 1<<3 // a symbolic character.
@(private) pZ     :: 1<<4 // a spacing character.
@(private) pLu    :: 1<<5 // an upper-case letter.
@(private) pLl    :: 1<<6 // a lower-case letter.
@(private) pp     :: 1<<7 // a printable character according to Go's definition.
@(private) pg     :: pp | pZ   // a graphical character according to the Unicode definition.
@(private) pLo    :: pLl | pLu // a letter that is neither upper nor lower case.
@(private) pLmask :: pLo

@(rodata)
char_properties := [MAX_LATIN1+1]u8{
	0x00 = pC,       // '\x00'
	0x01 = pC,       // '\x01'
	0x02 = pC,       // '\x02'
	0x03 = pC,       // '\x03'
	0x04 = pC,       // '\x04'
	0x05 = pC,       // '\x05'
	0x06 = pC,       // '\x06'
	0x07 = pC,       // '\a'
	0x08 = pC,       // '\b'
	0x09 = pC,       // '\t'
	0x0A = pC,       // '\n'
	0x0B = pC,       // '\v'
	0x0C = pC,       // '\f'
	0x0D = pC,       // '\r'
	0x0E = pC,       // '\x0e'
	0x0F = pC,       // '\x0f'
	0x10 = pC,       // '\x10'
	0x11 = pC,       // '\x11'
	0x12 = pC,       // '\x12'
	0x13 = pC,       // '\x13'
	0x14 = pC,       // '\x14'
	0x15 = pC,       // '\x15'
	0x16 = pC,       // '\x16'
	0x17 = pC,       // '\x17'
	0x18 = pC,       // '\x18'
	0x19 = pC,       // '\x19'
	0x1A = pC,       // '\x1a'
	0x1B = pC,       // '\x1b'
	0x1C = pC,       // '\x1c'
	0x1D = pC,       // '\x1d'
	0x1E = pC,       // '\x1e'
	0x1F = pC,       // '\x1f'
	0x20 = pZ | pp,  // ' '
	0x21 = pP | pp,  // '!'
	0x22 = pP | pp,  // '"'
	0x23 = pP | pp,  // '#'
	0x24 = pS | pp,  // '$'
	0x25 = pP | pp,  // '%'
	0x26 = pP | pp,  // '&'
	0x27 = pP | pp,  // '\''
	0x28 = pP | pp,  // '('
	0x29 = pP | pp,  // ')'
	0x2A = pP | pp,  // '*'
	0x2B = pS | pp,  // '+'
	0x2C = pP | pp,  // ','
	0x2D = pP | pp,  // '-'
	0x2E = pP | pp,  // '.'
	0x2F = pP | pp,  // '/'
	0x30 = pN | pp,  // '0'
	0x31 = pN | pp,  // '1'
	0x32 = pN | pp,  // '2'
	0x33 = pN | pp,  // '3'
	0x34 = pN | pp,  // '4'
	0x35 = pN | pp,  // '5'
	0x36 = pN | pp,  // '6'
	0x37 = pN | pp,  // '7'
	0x38 = pN | pp,  // '8'
	0x39 = pN | pp,  // '9'
	0x3A = pP | pp,  // ':'
	0x3B = pP | pp,  // ';'
	0x3C = pS | pp,  // '<'
	0x3D = pS | pp,  // '='
	0x3E = pS | pp,  // '>'
	0x3F = pP | pp,  // '?'
	0x40 = pP | pp,  // '@'
	0x41 = pLu | pp, // 'A'
	0x42 = pLu | pp, // 'B'
	0x43 = pLu | pp, // 'C'
	0x44 = pLu | pp, // 'D'
	0x45 = pLu | pp, // 'E'
	0x46 = pLu | pp, // 'F'
	0x47 = pLu | pp, // 'G'
	0x48 = pLu | pp, // 'H'
	0x49 = pLu | pp, // 'I'
	0x4A = pLu | pp, // 'J'
	0x4B = pLu | pp, // 'K'
	0x4C = pLu | pp, // 'L'
	0x4D = pLu | pp, // 'M'
	0x4E = pLu | pp, // 'N'
	0x4F = pLu | pp, // 'O'
	0x50 = pLu | pp, // 'P'
	0x51 = pLu | pp, // 'Q'
	0x52 = pLu | pp, // 'R'
	0x53 = pLu | pp, // 'S'
	0x54 = pLu | pp, // 'T'
	0x55 = pLu | pp, // 'U'
	0x56 = pLu | pp, // 'V'
	0x57 = pLu | pp, // 'W'
	0x58 = pLu | pp, // 'X'
	0x59 = pLu | pp, // 'Y'
	0x5A = pLu | pp, // 'Z'
	0x5B = pP | pp,  // '['
	0x5C = pP | pp,  // '\\'
	0x5D = pP | pp,  // ']'
	0x5E = pS | pp,  // '^'
	0x5F = pP | pp,  // '_'
	0x60 = pS | pp,  // '`'
	0x61 = pLl | pp, // 'a'
	0x62 = pLl | pp, // 'b'
	0x63 = pLl | pp, // 'c'
	0x64 = pLl | pp, // 'd'
	0x65 = pLl | pp, // 'e'
	0x66 = pLl | pp, // 'f'
	0x67 = pLl | pp, // 'g'
	0x68 = pLl | pp, // 'h'
	0x69 = pLl | pp, // 'i'
	0x6A = pLl | pp, // 'j'
	0x6B = pLl | pp, // 'k'
	0x6C = pLl | pp, // 'l'
	0x6D = pLl | pp, // 'm'
	0x6E = pLl | pp, // 'n'
	0x6F = pLl | pp, // 'o'
	0x70 = pLl | pp, // 'p'
	0x71 = pLl | pp, // 'q'
	0x72 = pLl | pp, // 'r'
	0x73 = pLl | pp, // 's'
	0x74 = pLl | pp, // 't'
	0x75 = pLl | pp, // 'u'
	0x76 = pLl | pp, // 'v'
	0x77 = pLl | pp, // 'w'
	0x78 = pLl | pp, // 'x'
	0x79 = pLl | pp, // 'y'
	0x7A = pLl | pp, // 'z'
	0x7B = pP | pp,  // '{'
	0x7C = pS | pp,  // '|'
	0x7D = pP | pp,  // '}'
	0x7E = pS | pp,  // '~'
	0x7F = pC,       // '\u007f'
	0x80 = pC,       // '\u0080'
	0x81 = pC,       // '\u0081'
	0x82 = pC,       // '\u0082'
	0x83 = pC,       // '\u0083'
	0x84 = pC,       // '\u0084'
	0x85 = pC,       // '\u0085'
	0x86 = pC,       // '\u0086'
	0x87 = pC,       // '\u0087'
	0x88 = pC,       // '\u0088'
	0x89 = pC,       // '\u0089'
	0x8A = pC,       // '\u008a'
	0x8B = pC,       // '\u008b'
	0x8C = pC,       // '\u008c'
	0x8D = pC,       // '\u008d'
	0x8E = pC,       // '\u008e'
	0x8F = pC,       // '\u008f'
	0x90 = pC,       // '\u0090'
	0x91 = pC,       // '\u0091'
	0x92 = pC,       // '\u0092'
	0x93 = pC,       // '\u0093'
	0x94 = pC,       // '\u0094'
	0x95 = pC,       // '\u0095'
	0x96 = pC,       // '\u0096'
	0x97 = pC,       // '\u0097'
	0x98 = pC,       // '\u0098'
	0x99 = pC,       // '\u0099'
	0x9A = pC,       // '\u009a'
	0x9B = pC,       // '\u009b'
	0x9C = pC,       // '\u009c'
	0x9D = pC,       // '\u009d'
	0x9E = pC,       // '\u009e'
	0x9F = pC,       // '\u009f'
	0xA0 = pZ,       // '\u00a0'
	0xA1 = pP | pp,  // '¡'
	0xA2 = pS | pp,  // '¢'
	0xA3 = pS | pp,  // '£'
	0xA4 = pS | pp,  // '¤'
	0xA5 = pS | pp,  // '¥'
	0xA6 = pS | pp,  // '¦'
	0xA7 = pP | pp,  // '§'
	0xA8 = pS | pp,  // '¨'
	0xA9 = pS | pp,  // '©'
	0xAA = pLo | pp, // 'ª'
	0xAB = pP | pp,  // '«'
	0xAC = pS | pp,  // '¬'
	0xAD = 0,        // '\u00ad'
	0xAE = pS | pp,  // '®'
	0xAF = pS | pp,  // '¯'
	0xB0 = pS | pp,  // '°'
	0xB1 = pS | pp,  // '±'
	0xB2 = pN | pp,  // '²'
	0xB3 = pN | pp,  // '³'
	0xB4 = pS | pp,  // '´'
	0xB5 = pLl | pp, // 'µ'
	0xB6 = pP | pp,  // '¶'
	0xB7 = pP | pp,  // '·'
	0xB8 = pS | pp,  // '¸'
	0xB9 = pN | pp,  // '¹'
	0xBA = pLo | pp, // 'º'
	0xBB = pP | pp,  // '»'
	0xBC = pN | pp,  // '¼'
	0xBD = pN | pp,  // '½'
	0xBE = pN | pp,  // '¾'
	0xBF = pP | pp,  // '¿'
	0xC0 = pLu | pp, // 'À'
	0xC1 = pLu | pp, // 'Á'
	0xC2 = pLu | pp, // 'Â'
	0xC3 = pLu | pp, // 'Ã'
	0xC4 = pLu | pp, // 'Ä'
	0xC5 = pLu | pp, // 'Å'
	0xC6 = pLu | pp, // 'Æ'
	0xC7 = pLu | pp, // 'Ç'
	0xC8 = pLu | pp, // 'È'
	0xC9 = pLu | pp, // 'É'
	0xCA = pLu | pp, // 'Ê'
	0xCB = pLu | pp, // 'Ë'
	0xCC = pLu | pp, // 'Ì'
	0xCD = pLu | pp, // 'Í'
	0xCE = pLu | pp, // 'Î'
	0xCF = pLu | pp, // 'Ï'
	0xD0 = pLu | pp, // 'Ð'
	0xD1 = pLu | pp, // 'Ñ'
	0xD2 = pLu | pp, // 'Ò'
	0xD3 = pLu | pp, // 'Ó'
	0xD4 = pLu | pp, // 'Ô'
	0xD5 = pLu | pp, // 'Õ'
	0xD6 = pLu | pp, // 'Ö'
	0xD7 = pS | pp,  // '×'
	0xD8 = pLu | pp, // 'Ø'
	0xD9 = pLu | pp, // 'Ù'
	0xDA = pLu | pp, // 'Ú'
	0xDB = pLu | pp, // 'Û'
	0xDC = pLu | pp, // 'Ü'
	0xDD = pLu | pp, // 'Ý'
	0xDE = pLu | pp, // 'Þ'
	0xDF = pLl | pp, // 'ß'
	0xE0 = pLl | pp, // 'à'
	0xE1 = pLl | pp, // 'á'
	0xE2 = pLl | pp, // 'â'
	0xE3 = pLl | pp, // 'ã'
	0xE4 = pLl | pp, // 'ä'
	0xE5 = pLl | pp, // 'å'
	0xE6 = pLl | pp, // 'æ'
	0xE7 = pLl | pp, // 'ç'
	0xE8 = pLl | pp, // 'è'
	0xE9 = pLl | pp, // 'é'
	0xEA = pLl | pp, // 'ê'
	0xEB = pLl | pp, // 'ë'
	0xEC = pLl | pp, // 'ì'
	0xED = pLl | pp, // 'í'
	0xEE = pLl | pp, // 'î'
	0xEF = pLl | pp, // 'ï'
	0xF0 = pLl | pp, // 'ð'
	0xF1 = pLl | pp, // 'ñ'
	0xF2 = pLl | pp, // 'ò'
	0xF3 = pLl | pp, // 'ó'
	0xF4 = pLl | pp, // 'ô'
	0xF5 = pLl | pp, // 'õ'
	0xF6 = pLl | pp, // 'ö'
	0xF7 = pS | pp,  // '÷'
	0xF8 = pLl | pp, // 'ø'
	0xF9 = pLl | pp, // 'ù'
	0xFA = pLl | pp, // 'ú'
	0xFB = pLl | pp, // 'û'
	0xFC = pLl | pp, // 'ü'
	0xFD = pLl | pp, // 'ý'
	0xFE = pLl | pp, // 'þ'
	0xFF = pLl | pp, // 'ÿ'
}


@(rodata)
alpha_ranges := [?]i32{
	0x00d8,  0x00f6,
	0x00f8,  0x01f5,
	0x0250,  0x02a8,
	0x038e,  0x03a1,
	0x03a3,  0x03ce,
	0x03d0,  0x03d6,
	0x03e2,  0x03f3,
	0x0490,  0x04c4,
	0x0561,  0x0587,
	0x05d0,  0x05ea,
	0x05f0,  0x05f2,
	0x0621,  0x063a,
	0x0640,  0x064a,
	0x0671,  0x06b7,
	0x06ba,  0x06be,
	0x06c0,  0x06ce,
	0x06d0,  0x06d3,
	0x0905,  0x0939,
	0x0958,  0x0961,
	0x0985,  0x098c,
	0x098f,  0x0990,
	0x0993,  0x09a8,
	0x09aa,  0x09b0,
	0x09b6,  0x09b9,
	0x09dc,  0x09dd,
	0x09df,  0x09e1,
	0x09f0,  0x09f1,
	0x0a05,  0x0a0a,
	0x0a0f,  0x0a10,
	0x0a13,  0x0a28,
	0x0a2a,  0x0a30,
	0x0a32,  0x0a33,
	0x0a35,  0x0a36,
	0x0a38,  0x0a39,
	0x0a59,  0x0a5c,
	0x0a85,  0x0a8b,
	0x0a8f,  0x0a91,
	0x0a93,  0x0aa8,
	0x0aaa,  0x0ab0,
	0x0ab2,  0x0ab3,
	0x0ab5,  0x0ab9,
	0x0b05,  0x0b0c,
	0x0b0f,  0x0b10,
	0x0b13,  0x0b28,
	0x0b2a,  0x0b30,
	0x0b32,  0x0b33,
	0x0b36,  0x0b39,
	0x0b5c,  0x0b5d,
	0x0b5f,  0x0b61,
	0x0b85,  0x0b8a,
	0x0b8e,  0x0b90,
	0x0b92,  0x0b95,
	0x0b99,  0x0b9a,
	0x0b9e,  0x0b9f,
	0x0ba3,  0x0ba4,
	0x0ba8,  0x0baa,
	0x0bae,  0x0bb5,
	0x0bb7,  0x0bb9,
	0x0c05,  0x0c0c,
	0x0c0e,  0x0c10,
	0x0c12,  0x0c28,
	0x0c2a,  0x0c33,
	0x0c35,  0x0c39,
	0x0c60,  0x0c61,
	0x0c85,  0x0c8c,
	0x0c8e,  0x0c90,
	0x0c92,  0x0ca8,
	0x0caa,  0x0cb3,
	0x0cb5,  0x0cb9,
	0x0ce0,  0x0ce1,
	0x0d05,  0x0d0c,
	0x0d0e,  0x0d10,
	0x0d12,  0x0d28,
	0x0d2a,  0x0d39,
	0x0d60,  0x0d61,
	0x0e01,  0x0e30,
	0x0e32,  0x0e33,
	0x0e40,  0x0e46,
	0x0e5a,  0x0e5b,
	0x0e81,  0x0e82,
	0x0e87,  0x0e88,
	0x0e94,  0x0e97,
	0x0e99,  0x0e9f,
	0x0ea1,  0x0ea3,
	0x0eaa,  0x0eab,
	0x0ead,  0x0eae,
	0x0eb2,  0x0eb3,
	0x0ec0,  0x0ec4,
	0x0edc,  0x0edd,
	0x0f18,  0x0f19,
	0x0f40,  0x0f47,
	0x0f49,  0x0f69,
	0x10d0,  0x10f6,
	0x1100,  0x1159,
	0x115f,  0x11a2,
	0x11a8,  0x11f9,
	0x1e00,  0x1e9b,
	0x1f50,  0x1f57,
	0x1f80,  0x1fb4,
	0x1fb6,  0x1fbc,
	0x1fc2,  0x1fc4,
	0x1fc6,  0x1fcc,
	0x1fd0,  0x1fd3,
	0x1fd6,  0x1fdb,
	0x1fe0,  0x1fec,
	0x1ff2,  0x1ff4,
	0x1ff6,  0x1ffc,
	0x210a,  0x2113,
	0x2115,  0x211d,
	0x2120,  0x2122,
	0x212a,  0x2131,
	0x2133,  0x2138,
	0x3041,  0x3094,
	0x30a1,  0x30fa,
	0x3105,  0x312c,
	0x3131,  0x318e,
	0x3192,  0x319f,
	0x3260,  0x327b,
	0x328a,  0x32b0,
	0x32d0,  0x32fe,
	0x3300,  0x3357,
	0x3371,  0x3376,
	0x337b,  0x3394,
	0x3399,  0x339e,
	0x33a9,  0x33ad,
	0x33b0,  0x33c1,
	0x33c3,  0x33c5,
	0x33c7,  0x33d7,
	0x33d9,  0x33dd,
	0x4e00,  0x9fff,
	0xac00,  0xd7a3,
	0xf900,  0xfb06,
	0xfb13,  0xfb17,
	0xfb1f,  0xfb28,
	0xfb2a,  0xfb36,
	0xfb38,  0xfb3c,
	0xfb40,  0xfb41,
	0xfb43,  0xfb44,
	0xfb46,  0xfbb1,
	0xfbd3,  0xfd3d,
	0xfd50,  0xfd8f,
	0xfd92,  0xfdc7,
	0xfdf0,  0xfdf9,
	0xfe70,  0xfe72,
	0xfe76,  0xfefc,
	0xff66,  0xff6f,
	0xff71,  0xff9d,
	0xffa0,  0xffbe,
	0xffc2,  0xffc7,
	0xffca,  0xffcf,
	0xffd2,  0xffd7,
	0xffda,  0xffdc,
}

@(rodata)
alpha_singlets := [?]i32{
	0x00aa,
	0x00b5,
	0x00ba,
	0x03da,
	0x03dc,
	0x03de,
	0x03e0,
	0x06d5,
	0x09b2,
	0x0a5e,
	0x0a8d,
	0x0ae0,
	0x0b9c,
	0x0cde,
	0x0e4f,
	0x0e84,
	0x0e8a,
	0x0e8d,
	0x0ea5,
	0x0ea7,
	0x0eb0,
	0x0ebd,
	0x1fbe,
	0x207f,
	0x20a8,
	0x2102,
	0x2107,
	0x2124,
	0x2126,
	0x2128,
	0xfb3e,
	0xfe74,
}

@(rodata)
space_ranges := [?]i32{
	0x0009,  0x000d, // tab and newline
	0x0020,  0x0020, // space
	0x0085,  0x0085, // next line
	0x00a0,  0x00a0,
	0x1680,  0x1680, // Ogham space mark
	0x2000,  0x200b, // en dash .. zero-width space
	0x200e,  0x200f, // LTR mark .. RTL mark (pattern whitespace)
	0x2028,  0x2029,     0x3000,  0x3000,
	0x202f,  0x202f, // narrow no-break space
	0x205f,  0x205f, // medium mathematical space
	0x3000,  0x3000, // ideographic space
	0xfeff,  0xfeff,
}

@(rodata)
unicode_spaces := [?]i32{
	0x0009, // tab
	0x000a, // LF
	0x000d, // CR
	0x0020, // space
	0x0085, // next line
	0x00a0, // unknown
	0x1680, // Ogham space mark
	0x2000, // en dash .. zero-width space
	0x200e, 0x200f, // LTR mark .. RTL mark (pattern whitespace)
	0x2028, 0x2029,  0x3000,  0x3000,
	0x202f, // narrow no-break space
	0x205f, // medium mathematical space
	0x3000, // ideographic space
	0xfeff, // unknown
}

@(rodata)
to_upper_ranges := [?]i32{
	0x0061,  0x007a, 468, // a-z A-Z
	0x00e0,  0x00f6, 468,
	0x00f8,  0x00fe, 468,
	0x0256,  0x0257, 295,
	0x0258,  0x0259, 298,
	0x028a,  0x028b, 283,
	0x03ad,  0x03af, 463,
	0x03b1,  0x03c1, 468,
	0x03c3,  0x03cb, 468,
	0x03cd,  0x03ce, 437,
	0x0430,  0x044f, 468,
	0x0451,  0x045c, 420,
	0x045e,  0x045f, 420,
	0x0561,  0x0586, 452,
	0x1f00,  0x1f07, 508,
	0x1f10,  0x1f15, 508,
	0x1f20,  0x1f27, 508,
	0x1f30,  0x1f37, 508,
	0x1f40,  0x1f45, 508,
	0x1f60,  0x1f67, 508,
	0x1f70,  0x1f71, 574,
	0x1f72,  0x1f75, 586,
	0x1f76,  0x1f77, 600,
	0x1f78,  0x1f79, 628,
	0x1f7a,  0x1f7b, 612,
	0x1f7c,  0x1f7d, 626,
	0x1f80,  0x1f87, 508,
	0x1f90,  0x1f97, 508,
	0x1fa0,  0x1fa7, 508,
	0x1fb0,  0x1fb1, 508,
	0x1fd0,  0x1fd1, 508,
	0x1fe0,  0x1fe1, 508,
	0x2170,  0x217f, 484,
	0x24d0,  0x24e9, 474,
	0xff41,  0xff5a, 468,
}

@(rodata)
to_upper_singlets := [?]i32{
	0x00ff, 621,
	0x0101, 499,
	0x0103, 499,
	0x0105, 499,
	0x0107, 499,
	0x0109, 499,
	0x010b, 499,
	0x010d, 499,
	0x010f, 499,
	0x0111, 499,
	0x0113, 499,
	0x0115, 499,
	0x0117, 499,
	0x0119, 499,
	0x011b, 499,
	0x011d, 499,
	0x011f, 499,
	0x0121, 499,
	0x0123, 499,
	0x0125, 499,
	0x0127, 499,
	0x0129, 499,
	0x012b, 499,
	0x012d, 499,
	0x012f, 499,
	0x0131, 268, //  I
	0x0133, 499,
	0x0135, 499,
	0x0137, 499,
	0x013a, 499,
	0x013c, 499,
	0x013e, 499,
	0x0140, 499,
	0x0142, 499,
	0x0144, 499,
	0x0146, 499,
	0x0148, 499,
	0x014b, 499,
	0x014d, 499,
	0x014f, 499,
	0x0151, 499,
	0x0153, 499,
	0x0155, 499,
	0x0157, 499,
	0x0159, 499,
	0x015b, 499,
	0x015d, 499,
	0x015f, 499,
	0x0161, 499,
	0x0163, 499,
	0x0165, 499,
	0x0167, 499,
	0x0169, 499,
	0x016b, 499,
	0x016d, 499,
	0x016f, 499,
	0x0171, 499,
	0x0173, 499,
	0x0175, 499,
	0x0177, 499,
	0x017a, 499,
	0x017c, 499,
	0x017e, 499,
	0x017f, 200, //  S
	0x0183, 499,
	0x0185, 499,
	0x0188, 499,
	0x018c, 499,
	0x0192, 499,
	0x0199, 499,
	0x01a1, 499,
	0x01a3, 499,
	0x01a5, 499,
	0x01a8, 499,
	0x01ad, 499,
	0x01b0, 499,
	0x01b4, 499,
	0x01b6, 499,
	0x01b9, 499,
	0x01bd, 499,
	0x01c5, 499,
	0x01c6, 498,
	0x01c8, 499,
	0x01c9, 498,
	0x01cb, 499,
	0x01cc, 498,
	0x01ce, 499,
	0x01d0, 499,
	0x01d2, 499,
	0x01d4, 499,
	0x01d6, 499,
	0x01d8, 499,
	0x01da, 499,
	0x01dc, 499,
	0x01df, 499,
	0x01e1, 499,
	0x01e3, 499,
	0x01e5, 499,
	0x01e7, 499,
	0x01e9, 499,
	0x01eb, 499,
	0x01ed, 499,
	0x01ef, 499,
	0x01f2, 499,
	0x01f3, 498,
	0x01f5, 499,
	0x01fb, 499,
	0x01fd, 499,
	0x01ff, 499,
	0x0201, 499,
	0x0203, 499,
	0x0205, 499,
	0x0207, 499,
	0x0209, 499,
	0x020b, 499,
	0x020d, 499,
	0x020f, 499,
	0x0211, 499,
	0x0213, 499,
	0x0215, 499,
	0x0217, 499,
	0x0253, 290,
	0x0254, 294,
	0x025b, 297,
	0x0260, 295,
	0x0263, 293,
	0x0268, 291,
	0x0269, 289,
	0x026f, 289,
	0x0272, 287,
	0x0283, 282,
	0x0288, 282,
	0x0292, 281,
	0x03ac, 462,
	0x03cc, 436,
	0x03d0, 438,
	0x03d1, 443,
	0x03d5, 453,
	0x03d6, 446,
	0x03e3, 499,
	0x03e5, 499,
	0x03e7, 499,
	0x03e9, 499,
	0x03eb, 499,
	0x03ed, 499,
	0x03ef, 499,
	0x03f0, 414,
	0x03f1, 420,
	0x0461, 499,
	0x0463, 499,
	0x0465, 499,
	0x0467, 499,
	0x0469, 499,
	0x046b, 499,
	0x046d, 499,
	0x046f, 499,
	0x0471, 499,
	0x0473, 499,
	0x0475, 499,
	0x0477, 499,
	0x0479, 499,
	0x047b, 499,
	0x047d, 499,
	0x047f, 499,
	0x0481, 499,
	0x0491, 499,
	0x0493, 499,
	0x0495, 499,
	0x0497, 499,
	0x0499, 499,
	0x049b, 499,
	0x049d, 499,
	0x049f, 499,
	0x04a1, 499,
	0x04a3, 499,
	0x04a5, 499,
	0x04a7, 499,
	0x04a9, 499,
	0x04ab, 499,
	0x04ad, 499,
	0x04af, 499,
	0x04b1, 499,
	0x04b3, 499,
	0x04b5, 499,
	0x04b7, 499,
	0x04b9, 499,
	0x04bb, 499,
	0x04bd, 499,
	0x04bf, 499,
	0x04c2, 499,
	0x04c4, 499,
	0x04c8, 499,
	0x04cc, 499,
	0x04d1, 499,
	0x04d3, 499,
	0x04d5, 499,
	0x04d7, 499,
	0x04d9, 499,
	0x04db, 499,
	0x04dd, 499,
	0x04df, 499,
	0x04e1, 499,
	0x04e3, 499,
	0x04e5, 499,
	0x04e7, 499,
	0x04e9, 499,
	0x04eb, 499,
	0x04ef, 499,
	0x04f1, 499,
	0x04f3, 499,
	0x04f5, 499,
	0x04f9, 499,
	0x1e01, 499,
	0x1e03, 499,
	0x1e05, 499,
	0x1e07, 499,
	0x1e09, 499,
	0x1e0b, 499,
	0x1e0d, 499,
	0x1e0f, 499,
	0x1e11, 499,
	0x1e13, 499,
	0x1e15, 499,
	0x1e17, 499,
	0x1e19, 499,
	0x1e1b, 499,
	0x1e1d, 499,
	0x1e1f, 499,
	0x1e21, 499,
	0x1e23, 499,
	0x1e25, 499,
	0x1e27, 499,
	0x1e29, 499,
	0x1e2b, 499,
	0x1e2d, 499,
	0x1e2f, 499,
	0x1e31, 499,
	0x1e33, 499,
	0x1e35, 499,
	0x1e37, 499,
	0x1e39, 499,
	0x1e3b, 499,
	0x1e3d, 499,
	0x1e3f, 499,
	0x1e41, 499,
	0x1e43, 499,
	0x1e45, 499,
	0x1e47, 499,
	0x1e49, 499,
	0x1e4b, 499,
	0x1e4d, 499,
	0x1e4f, 499,
	0x1e51, 499,
	0x1e53, 499,
	0x1e55, 499,
	0x1e57, 499,
	0x1e59, 499,
	0x1e5b, 499,
	0x1e5d, 499,
	0x1e5f, 499,
	0x1e61, 499,
	0x1e63, 499,
	0x1e65, 499,
	0x1e67, 499,
	0x1e69, 499,
	0x1e6b, 499,
	0x1e6d, 499,
	0x1e6f, 499,
	0x1e71, 499,
	0x1e73, 499,
	0x1e75, 499,
	0x1e77, 499,
	0x1e79, 499,
	0x1e7b, 499,
	0x1e7d, 499,
	0x1e7f, 499,
	0x1e81, 499,
	0x1e83, 499,
	0x1e85, 499,
	0x1e87, 499,
	0x1e89, 499,
	0x1e8b, 499,
	0x1e8d, 499,
	0x1e8f, 499,
	0x1e91, 499,
	0x1e93, 499,
	0x1e95, 499,
	0x1ea1, 499,
	0x1ea3, 499,
	0x1ea5, 499,
	0x1ea7, 499,
	0x1ea9, 499,
	0x1eab, 499,
	0x1ead, 499,
	0x1eaf, 499,
	0x1eb1, 499,
	0x1eb3, 499,
	0x1eb5, 499,
	0x1eb7, 499,
	0x1eb9, 499,
	0x1ebb, 499,
	0x1ebd, 499,
	0x1ebf, 499,
	0x1ec1, 499,
	0x1ec3, 499,
	0x1ec5, 499,
	0x1ec7, 499,
	0x1ec9, 499,
	0x1ecb, 499,
	0x1ecd, 499,
	0x1ecf, 499,
	0x1ed1, 499,
	0x1ed3, 499,
	0x1ed5, 499,
	0x1ed7, 499,
	0x1ed9, 499,
	0x1edb, 499,
	0x1edd, 499,
	0x1edf, 499,
	0x1ee1, 499,
	0x1ee3, 499,
	0x1ee5, 499,
	0x1ee7, 499,
	0x1ee9, 499,
	0x1eeb, 499,
	0x1eed, 499,
	0x1eef, 499,
	0x1ef1, 499,
	0x1ef3, 499,
	0x1ef5, 499,
	0x1ef7, 499,
	0x1ef9, 499,
	0x1f51, 508,
	0x1f53, 508,
	0x1f55, 508,
	0x1f57, 508,
	0x1fb3, 509,
	0x1fc3, 509,
	0x1fe5, 507,
	0x1ff3, 509,
}

@(rodata)
to_lower_ranges := [?]i32{
	0x0041,  0x005a, 532, // A-Z a-z
	0x00c0,  0x00d6, 532, // - -
	0x00d8,  0x00de, 532, // - -
	0x0189,  0x018a, 705, // - -
	0x018e,  0x018f, 702, // - -
	0x01b1,  0x01b2, 717, // - -
	0x0388,  0x038a, 537, // - -
	0x038e,  0x038f, 563, // - -
	0x0391,  0x03a1, 532, // - -
	0x03a3,  0x03ab, 532, // - -
	0x0401,  0x040c, 580, // - -
	0x040e,  0x040f, 580, // - -
	0x0410,  0x042f, 532, // - -
	0x0531,  0x0556, 548, // - -
	0x10a0,  0x10c5, 548, // - -
	0x1f08,  0x1f0f, 492, // - -
	0x1f18,  0x1f1d, 492, // - -
	0x1f28,  0x1f2f, 492, // - -
	0x1f38,  0x1f3f, 492, // - -
	0x1f48,  0x1f4d, 492, // - -
	0x1f68,  0x1f6f, 492, // - -
	0x1f88,  0x1f8f, 492, // - -
	0x1f98,  0x1f9f, 492, // - -
	0x1fa8,  0x1faf, 492, // - -
	0x1fb8,  0x1fb9, 492, // - -
	0x1fba,  0x1fbb, 426, // - -
	0x1fc8,  0x1fcb, 414, // - -
	0x1fd8,  0x1fd9, 492, // - -
	0x1fda,  0x1fdb, 400, // - -
	0x1fe8,  0x1fe9, 492, // - -
	0x1fea,  0x1feb, 388, // - -
	0x1ff8,  0x1ff9, 372, // - -
	0x1ffa,  0x1ffb, 374, // - -
	0x2160,  0x216f, 516, // - -
	0x24b6,  0x24cf, 526, // - -
	0xff21,  0xff3a, 532, // - -
}

@(rodata)
to_lower_singlets := [?]i32{
	0x0100, 501,
	0x0102, 501,
	0x0104, 501,
	0x0106, 501,
	0x0108, 501,
	0x010a, 501,
	0x010c, 501,
	0x010e, 501,
	0x0110, 501,
	0x0112, 501,
	0x0114, 501,
	0x0116, 501,
	0x0118, 501,
	0x011a, 501,
	0x011c, 501,
	0x011e, 501,
	0x0120, 501,
	0x0122, 501,
	0x0124, 501,
	0x0126, 501,
	0x0128, 501,
	0x012a, 501,
	0x012c, 501,
	0x012e, 501,
	0x0130, 301, //  i
	0x0132, 501,
	0x0134, 501,
	0x0136, 501,
	0x0139, 501,
	0x013b, 501,
	0x013d, 501,
	0x013f, 501,
	0x0141, 501,
	0x0143, 501,
	0x0145, 501,
	0x0147, 501,
	0x014a, 501,
	0x014c, 501,
	0x014e, 501,
	0x0150, 501,
	0x0152, 501,
	0x0154, 501,
	0x0156, 501,
	0x0158, 501,
	0x015a, 501,
	0x015c, 501,
	0x015e, 501,
	0x0160, 501,
	0x0162, 501,
	0x0164, 501,
	0x0166, 501,
	0x0168, 501,
	0x016a, 501,
	0x016c, 501,
	0x016e, 501,
	0x0170, 501,
	0x0172, 501,
	0x0174, 501,
	0x0176, 501,
	0x0178, 379,
	0x0179, 501,
	0x017b, 501,
	0x017d, 501,
	0x0181, 710,
	0x0182, 501,
	0x0184, 501,
	0x0186, 706,
	0x0187, 501,
	0x018b, 501,
	0x0190, 703,
	0x0191, 501,
	0x0193, 705,
	0x0194, 707,
	0x0196, 711,
	0x0197, 709,
	0x0198, 501,
	0x019c, 711,
	0x019d, 713,
	0x01a0, 501,
	0x01a2, 501,
	0x01a4, 501,
	0x01a7, 501,
	0x01a9, 718,
	0x01ac, 501,
	0x01ae, 718,
	0x01af, 501,
	0x01b3, 501,
	0x01b5, 501,
	0x01b7, 719,
	0x01b8, 501,
	0x01bc, 501,
	0x01c4, 502,
	0x01c5, 501,
	0x01c7, 502,
	0x01c8, 501,
	0x01ca, 502,
	0x01cb, 501,
	0x01cd, 501,
	0x01cf, 501,
	0x01d1, 501,
	0x01d3, 501,
	0x01d5, 501,
	0x01d7, 501,
	0x01d9, 501,
	0x01db, 501,
	0x01de, 501,
	0x01e0, 501,
	0x01e2, 501,
	0x01e4, 501,
	0x01e6, 501,
	0x01e8, 501,
	0x01ea, 501,
	0x01ec, 501,
	0x01ee, 501,
	0x01f1, 502,
	0x01f2, 501,
	0x01f4, 501,
	0x01fa, 501,
	0x01fc, 501,
	0x01fe, 501,
	0x0200, 501,
	0x0202, 501,
	0x0204, 501,
	0x0206, 501,
	0x0208, 501,
	0x020a, 501,
	0x020c, 501,
	0x020e, 501,
	0x0210, 501,
	0x0212, 501,
	0x0214, 501,
	0x0216, 501,
	0x0386, 538,
	0x038c, 564,
	0x03e2, 501,
	0x03e4, 501,
	0x03e6, 501,
	0x03e8, 501,
	0x03ea, 501,
	0x03ec, 501,
	0x03ee, 501,
	0x0460, 501,
	0x0462, 501,
	0x0464, 501,
	0x0466, 501,
	0x0468, 501,
	0x046a, 501,
	0x046c, 501,
	0x046e, 501,
	0x0470, 501,
	0x0472, 501,
	0x0474, 501,
	0x0476, 501,
	0x0478, 501,
	0x047a, 501,
	0x047c, 501,
	0x047e, 501,
	0x0480, 501,
	0x0490, 501,
	0x0492, 501,
	0x0494, 501,
	0x0496, 501,
	0x0498, 501,
	0x049a, 501,
	0x049c, 501,
	0x049e, 501,
	0x04a0, 501,
	0x04a2, 501,
	0x04a4, 501,
	0x04a6, 501,
	0x04a8, 501,
	0x04aa, 501,
	0x04ac, 501,
	0x04ae, 501,
	0x04b0, 501,
	0x04b2, 501,
	0x04b4, 501,
	0x04b6, 501,
	0x04b8, 501,
	0x04ba, 501,
	0x04bc, 501,
	0x04be, 501,
	0x04c1, 501,
	0x04c3, 501,
	0x04c7, 501,
	0x04cb, 501,
	0x04d0, 501,
	0x04d2, 501,
	0x04d4, 501,
	0x04d6, 501,
	0x04d8, 501,
	0x04da, 501,
	0x04dc, 501,
	0x04de, 501,
	0x04e0, 501,
	0x04e2, 501,
	0x04e4, 501,
	0x04e6, 501,
	0x04e8, 501,
	0x04ea, 501,
	0x04ee, 501,
	0x04f0, 501,
	0x04f2, 501,
	0x04f4, 501,
	0x04f8, 501,
	0x1e00, 501,
	0x1e02, 501,
	0x1e04, 501,
	0x1e06, 501,
	0x1e08, 501,
	0x1e0a, 501,
	0x1e0c, 501,
	0x1e0e, 501,
	0x1e10, 501,
	0x1e12, 501,
	0x1e14, 501,
	0x1e16, 501,
	0x1e18, 501,
	0x1e1a, 501,
	0x1e1c, 501,
	0x1e1e, 501,
	0x1e20, 501,
	0x1e22, 501,
	0x1e24, 501,
	0x1e26, 501,
	0x1e28, 501,
	0x1e2a, 501,
	0x1e2c, 501,
	0x1e2e, 501,
	0x1e30, 501,
	0x1e32, 501,
	0x1e34, 501,
	0x1e36, 501,
	0x1e38, 501,
	0x1e3a, 501,
	0x1e3c, 501,
	0x1e3e, 501,
	0x1e40, 501,
	0x1e42, 501,
	0x1e44, 501,
	0x1e46, 501,
	0x1e48, 501,
	0x1e4a, 501,
	0x1e4c, 501,
	0x1e4e, 501,
	0x1e50, 501,
	0x1e52, 501,
	0x1e54, 501,
	0x1e56, 501,
	0x1e58, 501,
	0x1e5a, 501,
	0x1e5c, 501,
	0x1e5e, 501,
	0x1e60, 501,
	0x1e62, 501,
	0x1e64, 501,
	0x1e66, 501,
	0x1e68, 501,
	0x1e6a, 501,
	0x1e6c, 501,
	0x1e6e, 501,
	0x1e70, 501,
	0x1e72, 501,
	0x1e74, 501,
	0x1e76, 501,
	0x1e78, 501,
	0x1e7a, 501,
	0x1e7c, 501,
	0x1e7e, 501,
	0x1e80, 501,
	0x1e82, 501,
	0x1e84, 501,
	0x1e86, 501,
	0x1e88, 501,
	0x1e8a, 501,
	0x1e8c, 501,
	0x1e8e, 501,
	0x1e90, 501,
	0x1e92, 501,
	0x1e94, 501,
	0x1ea0, 501,
	0x1ea2, 501,
	0x1ea4, 501,
	0x1ea6, 501,
	0x1ea8, 501,
	0x1eaa, 501,
	0x1eac, 501,
	0x1eae, 501,
	0x1eb0, 501,
	0x1eb2, 501,
	0x1eb4, 501,
	0x1eb6, 501,
	0x1eb8, 501,
	0x1eba, 501,
	0x1ebc, 501,
	0x1ebe, 501,
	0x1ec0, 501,
	0x1ec2, 501,
	0x1ec4, 501,
	0x1ec6, 501,
	0x1ec8, 501,
	0x1eca, 501,
	0x1ecc, 501,
	0x1ece, 501,
	0x1ed0, 501,
	0x1ed2, 501,
	0x1ed4, 501,
	0x1ed6, 501,
	0x1ed8, 501,
	0x1eda, 501,
	0x1edc, 501,
	0x1ede, 501,
	0x1ee0, 501,
	0x1ee2, 501,
	0x1ee4, 501,
	0x1ee6, 501,
	0x1ee8, 501,
	0x1eea, 501,
	0x1eec, 501,
	0x1eee, 501,
	0x1ef0, 501,
	0x1ef2, 501,
	0x1ef4, 501,
	0x1ef6, 501,
	0x1ef8, 501,
	0x1f59, 492,
	0x1f5b, 492,
	0x1f5d, 492,
	0x1f5f, 492,
	0x1fbc, 491,
	0x1fcc, 491,
	0x1fec, 493,
	0x1ffc, 491,
}

@(rodata)
to_title_singlets := [?]i32{
	0x01c4, 501,
	0x01c6, 499,
	0x01c7, 501,
	0x01c9, 499,
	0x01ca, 501,
	0x01cc, 499,
	0x01f1, 501,
	0x01f3, 499,
}
