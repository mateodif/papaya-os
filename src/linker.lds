OUTPUT_ARCH(riscv)
ENTRY(_start)

STACK_SIZE = ((1 << 12) - 128);

SECTIONS
{
    . = 0x10000;
    .text : {
        *(.text.start)
        *(.text .text.*)
    }

    . = ALIGN(8);
    .rodata : { *(.rodata .rodata.*) }

    . = ALIGN(8);
    .data : { 
        _gp = .;
        *(.data .data.*) 
    }

    . = ALIGN(8);
    .bss : {
        *(.bss .bss.*)
        *(COMMON)
    }

    . = ALIGN(8);
    .stack : {
        . = . + STACK_SIZE;
        stack_top = .;
    } 

    /DISCARD/ : { *(.comment) }
}