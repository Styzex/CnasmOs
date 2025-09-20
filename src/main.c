void print_char(char c) {
  asm volatile (
    "mov $0x0e, %%ah\n\t"
    "mov %0, %%al\n\t"
    "int $0x10"
    :
    : "r" (c)
    : "ah", "al"
  );
}

void main() {
  asm volatile("int $0x16");
  print_char('H');
  while(1) {}
}
