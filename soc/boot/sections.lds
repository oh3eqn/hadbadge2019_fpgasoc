/*
This is free and unencumbered software released into the public domain.

Anyone is free to copy, modify, publish, use, compile, sell, or
distribute this software, either in source code form or as a compiled
binary, for any purpose, commercial or non-commercial, and by any
means.
*/

MEMORY {
	ram : ORIGIN = 0x40000000, LENGTH = 0x2000
}

SECTIONS {
	.text : {
		start*(.text);
		*(.text);
		*(.text.*);
	} > ram
	.data : {
		. = ALIGN(4);
		*(.rodata);
		*(.rodata.*);
		*(.srodata)
		*(.srodata.*);
		*(.data);
		*(.data.*);
		*(.gnu.linkonce.d.*)
		*(.data1)
		*(.sdata);
		*(.sdata.*);
		*(.sdata2)
		*(.sdata2.*)
	} > ram
	.bss : {
		/* Note BSS is NOT noload. We have space in the cache to store the entire binary
		including this anyway, and this saves us from having a clear-bss routine. */
		. = ALIGN(4);
		_bin_end = .;
		_bss_start = .;
		*(.bss);
		*(.bss.*);
		*(.sbss);
		*(.sbss.*);
		*(COMMON);
		*(COMMON.*);
		. = ALIGN(4);
		_bss_end = .;
	} > ram
}

PROVIDE ( UART = 0x10000000 );
PROVIDE ( LED  = 0x20000000 );
PROVIDE ( LCD =  0x30000000 );
