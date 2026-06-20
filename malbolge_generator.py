from interp import crazy_op, rotate_right, run

def forced_x(C, target_residue):
    r = (target_residue - C) % 94
    x = r + 94 if r < 33 else r
    assert 33 <= x <= 126
    assert (C + x) % 94 == target_residue
    return x

def rot_effect(C):
    x = forced_x(C, 39)
    return rotate_right(x), x

def crazy_operand(C):
    return forced_x(C, 62)

def nop_byte(C):
    return forced_x(C, 68)

def out_byte(C):
    return forced_x(C, 5)

def end_byte(C):
    return forced_x(C, 81)

def find_recipe_for_target(C0, target):
    """Returns (list_of_(nop_count, special_instr_char_func)) steps to set A == target (mod 256),
    plus final C position. Uses round1 (rotate) then round2 (rotate+crazy) then round3 (rotate+crazy+crazy)."""
    # Round 1: try rotate alone at offsets k=0..93
    best = None
    for k in range(94):
        C = C0 + k
        a1, x1 = rot_effect(C)
        if a1 % 256 == target:
            return [('rot', k, C)], a1
    # Round 2: rotate at k1, then crazy at k2 afterwards
    cache_round1 = {}
    for k1 in range(94):
        C1 = C0 + k1
        a1, x1 = rot_effect(C1)
        cache_round1[k1] = a1
    for k1 in range(94):
        a1 = cache_round1[k1]
        Cafter1 = C0 + k1 + 1
        for k2 in range(94):
            C2 = Cafter1 + k2
            x2 = crazy_operand(C2)
            a2 = crazy_op(a1, x2)
            if a2 % 256 == target:
                return [('rot', k1, C0+k1), ('crz', k2, C2)], a2
    # Round 3: rotate, crazy, crazy
    for k1 in range(94):
        a1 = cache_round1[k1]
        Cafter1 = C0 + k1 + 1
        for k2 in range(94):
            C2 = Cafter1 + k2
            x2 = crazy_operand(C2)
            a2 = crazy_op(a1, x2)
            Cafter2 = C2 + 1
            for k3 in range(94):
                C3 = Cafter2 + k3
                x3 = crazy_operand(C3)
                a3 = crazy_op(a2, x3)
                if a3 % 256 == target:
                    return [('rot', k1, C0+k1), ('crz', k2, C2), ('crz', k3, C3)], a3
    raise RuntimeError(f"no recipe found for target={target} starting at C0={C0}")

def generate(text, encoding='ascii'):
    data = text.encode(encoding)
    chars = []  # list of source bytes (ints) we are constructing, position = index
    C = 0
    stats = {'round1':0, 'round2':0, 'round3':0}
    for target in data:
        steps, finalA = find_recipe_for_target(C, target)
        nrounds = len(steps)
        stats[{1:'round1',2:'round2',3:'round3'}[nrounds]] += 1
        for kind, k, pos in steps:
            # emit k nops then the special instruction
            for i in range(k):
                nb = nop_byte(C)
                chars.append(nb)
                C += 1
            if kind == 'rot':
                xb = forced_x(C, 39)
            elif kind == 'crz':
                xb = forced_x(C, 62)
            chars.append(xb)
            C += 1
        # now emit 'out'
        ob = out_byte(C)
        chars.append(ob)
        C += 1
    # halt
    eb = end_byte(C)
    chars.append(eb)
    C += 1
    src = ''.join(chr(b) for b in chars)
    return src, stats

if __name__ == "__main__":
    import sys
    text = sys.argv[1] if len(sys.argv) > 1 else "Hi"
    src, stats = generate(text)
    print("LENGTH:", len(src))
    print("STATS:", stats)
    out, steps = run(src, max_steps=5_000_000)
    print("STEPS EXECUTED:", steps)
    print("OUTPUT MATCHES:", out.decode('ascii', errors='replace') == text, repr(out))
