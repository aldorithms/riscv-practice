.section .data
    n:      .word 5          # The number we want to calculate factorial of (5!)
    result: .word 1          # The result, initialized to 1

.section .text
    .globl _start

_start:
    # Load n (the number to calculate factorial) into t0
    la t1, n                 # Load the address of 'n' into t1
    lw t0, 0(t1)             # Load the value of 'n' into t0

    # Initialize result to 1
    la t2, result            # Load the address of 'result' into t2
    li t3, 1                 # Load the value 1 into t3
    sw t3, 0(t2)             # Store 1 into 'result'

    # Check if n is 0, if so, factorial is 1
    beqz t0, done            # If t0 is 0, skip to 'done'

factorial_loop:
    # Multiply result by n and store back into result
    lw t3, 0(t2)             # Load the current result into t3
    mul t3, t3, t0           # Multiply t3 (result) by t0 (n)
    sw t3, 0(t2)             # Store the new result back into memory

    # Decrement n
    addi t0, t0, -1          # t0 = t0 - 1

    # If n > 0, repeat the loop
    bnez t0, factorial_loop  # If t0 is not zero, branch to 'factorial_loop'

done:
    # End the program
    li a0, 0                 # Set exit code to 0
    li a7, 93                # Syscall number for exit in RISC-V
    ecall                    # Make the system call to exit
