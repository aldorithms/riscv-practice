.section .data
    num1:   .word 10        # Define the first number
    num2:   .word 20        # Define the second number

.section .text
    .globl _start           # Entry point for the program

_start:
    # Load the numbers from memory
    la t0, num1             # Load address of num1 into t0
    lw t1, 0(t0)            # Load value at num1 into t1
    la t0, num2             # Load address of num2 into t0
    lw t2, 0(t0)            # Load value at num2 into t2

    # Perform addition
    add t3, t1, t2          # t3 = t1 + t2

    # Exit the program
    li a0, 0                # Set exit code to 0
    li a7, 93               # Syscall number for exit in RISC-V
    ecall                   # Make system call to exit
