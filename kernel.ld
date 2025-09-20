OUTPUT_FORMAT("binary")
ENTRY(main)
SECTIONS
{
  . = 0x0000;
  .text : { *(.text) }
}
