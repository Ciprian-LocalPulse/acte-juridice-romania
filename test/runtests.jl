"""
Teste de baza pentru pachetul ActeJuridiceRomania.
Ruleaza cu: julia --project=.. test/runtests.jl
"""

using Test

# Adauga src in path
push!(LOAD_PATH, joinpath(@__DIR__, "..", "src"))
include(joinpath(@__DIR__, "..", "src", "ActeJuridiceRomania.jl"))
using .ActeJuridiceRomania

@testset "ActeJuridiceRomania" begin

    @testset "lista_categorii" begin
        cats = lista_categorii()
        @test length(cats) == 14
        @test "locuinta" in cats
        @test "munca" in cats
        @test "afaceri" in cats
        @test issorted(cats)
    end

    @testset "lista_documente" begin
        docs = lista_documente("locuinta")
        @test length(docs) == 10
        @test "contract-inchiriere-locuinta" in docs

        docs_munca = lista_documente("munca")
        @test length(docs_munca) == 11
        @test "demisie-cu-preaviz" in docs_munca
    end

    @testset "obtine_template" begin
        t = obtine_template("munca", "demisie-cu-preaviz")
        @test occursin("[DATA]", t) || occursin("demisie", lowercase(t))
        @test length(t) > 100

        t2 = obtine_template("locuinta", "contract-inchiriere-locuinta")
        @test occursin("chirias", lowercase(t2))
    end

    @testset "genereaza_document" begin
        doc = genereaza_document("familie", "declaratie-proprie-raspundere", Dict(
            "DATA"      => "20.06.2026",
            "LOCALITATE"=> "Piatra Neamt",
            "NUME"      => "Popescu Ion",
            "CNP"       => "1234567890123"
        ))
        @test occursin("Popescu Ion", doc)
        @test occursin("20.06.2026", doc)
        @test !occursin("[NUME]", doc)
        @test !occursin("[DATA]", doc)
    end

    @testset "campuri_necesare" begin
        campuri = campuri_necesare("locuinta", "contract-inchiriere-locuinta")
        @test length(campuri) > 3
        @test "DATA" in campuri
    end

    @testset "cauta_documente" begin
        rezultate = cauta_documente("demisie")
        @test length(rezultate) >= 2
        cats_gasit = [r[1] for r in rezultate]
        @test all(c == "munca" for c in cats_gasit)
    end

    @testset "categorie inexistenta" begin
        @test_throws ErrorException lista_documente("inexistent")
        @test_throws ErrorException obtine_template("inexistent", "doc")
    end

    @testset "document inexistent" begin
        @test_throws ErrorException obtine_template("munca", "doc-care-nu-exista")
    end

    @testset "total documente" begin
        total = sum(length(lista_documente(c)) for c in lista_categorii())
        @test total == 89
    end

end

println("\n✓ Toate testele au trecut!")
