"""
exemple.jl — Exemple de utilizare a pachetului ActeJuridiceRomania

Ruleaza cu:
    julia --project=. exemple.jl
sau din REPL:
    include("exemple.jl")
"""

push!(LOAD_PATH, joinpath(@__DIR__, "src"))
include(joinpath(@__DIR__, "src", "ActeJuridiceRomania.jl"))
using .ActeJuridiceRomania

println("=" ^ 60)
println("  ACTE JURIDICE ROMANIA — Pachet Julia")
println("=" ^ 60)
println()

# ─── 1. Listeaza categoriile ──────────────────────────────────
println("▶ Categorii disponibile:")
for cat in lista_categorii()
    n = length(lista_documente(cat))
    println("   • $cat ($n documente)")
end
println()

# ─── 2. Documente din categoria 'munca' ──────────────────────
println("▶ Documente din categoria 'munca':")
for doc in lista_documente("munca")
    println("   - $doc")
end
println()

# ─── 3. Campuri necesare ─────────────────────────────────────
println("▶ Campuri necesare pentru 'contract-inchiriere-locuinta':")
for camp in campuri_necesare("locuinta", "contract-inchiriere-locuinta")
    println("   [$(camp)]")
end
println()

# ─── 4. Genereaza o demisie ──────────────────────────────────
println("▶ Generare document: demisie-cu-preaviz")
println("-" ^ 60)

demisie = genereaza_document("munca", "demisie-cu-preaviz", Dict(
    "DATA"              => "20.06.2026",
    "LOCALITATE"        => "Piatra Neamt",
    "NUME ANGAJAT"      => "Popescu Ion",
    "FUNCTIA"           => "Inginer Software",
    "ANGAJATOR"         => "SC TechRomania SRL",
    "DATA PREAVIZ"      => "20.07.2026",
    "NUMAR ZILE PREAVIZ"=> "20",
))
println(demisie[1:min(600, length(demisie))], "\n[...]\n")

# ─── 5. Salveaza documentul ──────────────────────────────────
salveaza_document("munca", "demisie-cu-preaviz", Dict(
    "DATA"              => "20.06.2026",
    "LOCALITATE"        => "Piatra Neamt",
    "NUME ANGAJAT"      => "Popescu Ion",
    "FUNCTIA"           => "Inginer Software",
    "ANGAJATOR"         => "SC TechRomania SRL",
    "DATA PREAVIZ"      => "20.07.2026",
    "NUMAR ZILE PREAVIZ"=> "20",
), "output_demisie.md")

# ─── 6. Cauta documente ──────────────────────────────────────
println()
println("▶ Cautare documente cu cuvantul 'garantie':")
for (cat, doc) in cauta_documente("garantie")
    println("   [$cat] $doc")
end

println()
println("=" ^ 60)
println("  Total documente incarcate: $(sum(length(lista_documente(c)) for c in lista_categorii()))")
println("=" ^ 60)
