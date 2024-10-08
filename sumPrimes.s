.globl _start

.equ N, 30

_start:

    # Initialize registers
    li t1, 2      # t1 = 2 (starting value)
    li t2, 2      # t2 = 2 (first divisor)
    li t3, 0      # t3 = 0 (sum of primes)

general_loop:
    # Check if t1 <= N
    li t0, N
    bgt t1, t0, end_loop   # if t1 > N, end the loop

    # Check if t1 is prime
    li t2, 2              # Reset divisor to 2
check_prime:
    bge t2, t1, add_prime   # if divisor >= t1, prime is found, move to add_prime
    rem t0, t1, t2         # t0 = t1 % t2
    beqz t0, not_prime     # if t0 == 0, it's not prime, skip to next number
    addi t2, t2, 1         # t2 = t2 + 1
    j check_prime          # Repeat prime check with next divisor

add_prime:
    # Add t1 to the sum (t3 = t3 + t1)
    add t3, t3, t1

not_prime:
    # Increment t1 (t1 = t1 + 1)
    addi t1, t1, 1
    j general_loop         # Repeat the loop for the next t1 value

end_loop:
    # Store result in t6 (sum of primes)
    mv t6, t3

    # Finish the program
    ret
