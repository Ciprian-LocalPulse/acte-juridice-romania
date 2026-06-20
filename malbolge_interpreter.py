import sys

# Crazy operation table: table[d_trit][a_trit] = result_trit
CRZ = [
    [1,0,0],
    [1,0,2],
    [2,2,1],
]

# Encryption table: ENCRYPT[result_num 0..93] = encrypted ascii code
ENCRYPT = [
57,109,60,46,84,86,97,99,96,117,89,42,77,75,39,88,126,120,68,
108,125,82,69,111,107,78,58,35,63,71,34,105,64,53,122,93,38,103,
113,116,121,102,114,36,40,119,101,52,123,87,80,41,72,45,90,110,44,
91,37,92,51,100,76,43,81,59,62,85,33,112,74,83,55,50,70,104,
79,65,49,67,66,54,118,94,61,73,95,48,47,56,124,106,115,98
]
assert len(ENCRYPT) == 94, len(ENCRYPT)

def to_trits(x):
    t = [0]*10
    for i in range(10):
        t[i] = x % 3
        x //= 3
    return t  # t[0] = least significant

def from_trits(t):
    x = 0
    for i in range(9, -1, -1):
        x = x*3 + t[i]
    return x

def crazy_op(a, d):
    ta = to_trits(a)
    td = to_trits(d)
    res = [CRZ[td[i]][ta[i]] for i in range(10)]
    return from_trits(res)

def rotate_right(x):
    t = to_trits(x)
    # least significant trit moves to most significant position
    last = t[0]
    newt = [0]*10
    for i in range(9):
        newt[i] = t[i+1]
    newt[9] = last
    return from_trits(newt)

MEMSIZE = 59049

def load_program(src):
    mem = [0]*MEMSIZE
    pos = 0
    for ch in src:
        if ch.isspace():
            continue
        code = ord(ch)
        mem[pos] = code
        pos += 1
    proglen = pos
    # fill rest via crazy chain (not needed if program halts before reaching there)
    for i in range(proglen, MEMSIZE):
        if i < 2:
            mem[i] = 0
        else:
            mem[i] = crazy_op(mem[i-2], mem[i-1])
    return mem, proglen

def run(src, input_str="", max_steps=2_000_000, trace=False):
    mem, proglen = load_program(src)
    A = 0
    C = 0
    D = 0
    output = []
    inp = list(input_str)
    inp_idx = 0
    steps = 0
    while steps < max_steps:
        steps += 1
        val = mem[C % MEMSIZE]
        if not (33 <= val <= 126):
            raise RuntimeError(f"CRASH: mem[{C}]={val} not in 33-126 at step {steps}")
        instr = (C + val) % 94
        if trace and steps < 60:
            print(f"step={steps} C={C} D={D} A={A} mem[C]={val} instr={instr}")
        halt = False
        if instr == 4:    # jmp
            C = mem[D % MEMSIZE]
        elif instr == 5:  # out
            output.append(A % 256)
        elif instr == 23: # in
            if inp_idx < len(inp):
                A = ord(inp[inp_idx])
                inp_idx += 1
            else:
                A = 59048
        elif instr == 39: # rotate
            r = rotate_right(mem[D % MEMSIZE])
            mem[D % MEMSIZE] = r
            A = r
        elif instr == 40: # mov d,[d]
            D = mem[D % MEMSIZE]
        elif instr == 62: # crazy
            r = crazy_op(A, mem[D % MEMSIZE])
            mem[D % MEMSIZE] = r
            A = r
        elif instr == 68: # nop
            pass
        elif instr == 81: # end
            halt = True
        else:
            pass # nop

        # encryption step
        cur = mem[C % MEMSIZE]
        if 33 <= cur <= 126:
            mem[C % MEMSIZE] = ENCRYPT[cur % 94]
        # else undefined; leave as-is

        if halt:
            break

        C = (C + 1) % MEMSIZE
        D = (D + 1) % MEMSIZE
    return bytes(output), steps

if __name__ == "__main__":
    prog = sys.argv[1] if len(sys.argv) > 1 else None
    if prog:
        with open(prog) as f:
            src = f.read()
    else:
        src = sys.stdin.read()
    out, steps = run(src)
    sys.stdout.write(out.decode('latin1'))
