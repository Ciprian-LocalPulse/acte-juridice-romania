# ActeJuridiceRomania.jl

Pachet Julia care ofera acces programatic la **89 de modele de documente juridice romanesti**, organizate in 14 categorii.

> **Avertisment:** Documentele sunt modele educationale. Nu constituie consultanta juridica, fiscala sau notariala. Verifica mereu cu un specialist inainte de folosire.

## Structura pachetului

```
ActeJuridiceRomania/
├── Project.toml
├── exemple.jl                    ← exemple de utilizare
├── src/
│   ├── ActeJuridiceRomania.jl    ← modulul principal
│   └── templates/
│       ├── administrativ.jl      (11 documente)
│       ├── afaceri.jl            (12 documente)
│       ├── asociatie_proprietari.jl (2 documente)
│       ├── auto.jl               (4 documente)
│       ├── consumatori.jl        (6 documente)
│       ├── familie.jl            (7 documente)
│       ├── firme_pfa.jl          (4 documente)
│       ├── gdpr_protectia_datelor.jl (3 documente)
│       ├── imobiliare.jl         (4 documente)
│       ├── imprumuturi_si_garantii.jl (3 documente)
│       ├── locuinta.jl           (10 documente)
│       ├── munca.jl              (11 documente)
│       ├── succesiuni.jl         (5 documente)
│       └── vanzare_cumparare.jl  (7 documente)
└── test/
    └── runtests.jl
```

## Instalare si pornire

```julia
# Din REPL Julia, din directorul pachetului:
push!(LOAD_PATH, "src")
include("src/ActeJuridiceRomania.jl")
using .ActeJuridiceRomania
```

Sau ruleaza exemplele direct:
```bash
julia --project=. exemple.jl
```

## API

### `lista_categorii() -> Vector{String}`
Returneaza toate cele 14 categorii disponibile.

### `lista_documente(categorie) -> Vector{String}`
Returneaza documentele dintr-o categorie.

### `obtine_template(categorie, document) -> String`
Returneaza continutul brut Markdown al unui template, cu campuri `[CAMP]`.

### `campuri_necesare(categorie, document) -> Vector{String}`
Extrage automat lista campurilor `[CAMP]` dintr-un template.

### `genereaza_document(categorie, document, campuri::Dict) -> String`
Inlocuieste campurile `[CAMP]` cu valorile furnizate.

### `salveaza_document(categorie, document, campuri, cale_fisier)`
Genereaza si salveaza documentul intr-un fisier `.md` sau `.txt`.

### `cauta_documente(cuvant_cheie) -> Vector{Tuple{String,String}}`
Cauta documente in toate categoriile dupa un cuvant cheie.

## Exemplu complet

```julia
using .ActeJuridiceRomania

# Afla ce campuri are nevoie un contract de inchiriere
campuri = campuri_necesare("locuinta", "contract-inchiriere-locuinta")
# => ["ADRESA", "ADRESA COMPLETA", "CNP", "DATA", "DATA INCEPUT", ...]

# Genereaza contractul
contract = genereaza_document("locuinta", "contract-inchiriere-locuinta", Dict(
    "DATA"            => "20.06.2026",
    "LOCALITATE"      => "Piatra Neamt",
    "NUME PROPRIETAR" => "Popescu Ion",
    "CNP"             => "1234567890123",
    "ADRESA"          => "Str. Libertatii nr. 1, Piatra Neamt",
    "CI/PASAPORT"     => "CI seria NT 123456",
    "NUME CHIRIAS"    => "Ionescu Maria",
    "ADRESA COMPLETA" => "Str. Independentei nr. 5, Piatra Neamt",
    "DESCRIERE"       => "2 camere, baie, bucatarie",
    "ANEXE/DEPENDINTE"=> "boxa la subsol",
    "DATA INCEPUT"    => "01.07.2026",
    "DATA SFARSIT"    => "30.06.2027",
    "SUMA"            => "400",
    "MONEDA"          => "EUR",
    "ZI"              => "5",
    "TRANSFER/CASH"   => "transfer bancar",
    "NUMAR"           => "30"
))

# Salveaza
salveaza_document("locuinta", "contract-inchiriere-locuinta",
    Dict(...), "contract_inchiriere.md")
```

## Categorii si documente

| Categorie | Documente |
|-----------|-----------|
| `administrativ` | cerere-audienta, cerere-certificat-fiscal, cerere-esalonare-plata, cerere-generica-anaf, cerere-informatii-publice-legea-544, cerere-onrc-informatii, cerere-radiere-date, cerere-schimbare-date, contestatie-amenda, petitie-institutie-publica, reclamatie-administrativa-legea-544 |
| `afaceri` | acord-confidentialitate-nda-simplu, acord-reziliere-contract, contract-cesiune-drepturi-autor, contract-colaborare, contract-consultanta, contract-mentenanta, contract-prestari-servicii, notificare-intarziere-plata, oferta-comerciala, proces-verbal-predare-documente, proces-verbal-receptie-servicii, somatie-plata-amiabila |
| `asociatie_proprietari` | cerere-catre-asociatia-de-proprietari, contestatie-cheltuieli-comune |
| `auto` | contract-comodat-auto, contract-vanzare-cumparare-auto, imputernicire-auto, proces-verbal-predare-primire-auto |
| `consumatori` | cerere-anulare-comanda-online, cerere-garantie-produs, cerere-retur-produs, notificare-neexecutare-serviciu, proces-verbal-predare-produs-service, reclamatie-anpc |
| `familie` | acord-folosire-adresa-corespondenta, acord-parental-calatorie, declaratie-gazduire, declaratie-proprie-raspundere, declaratie-venituri, imputernicire-ridicare-documente, procura-simpla |
| `firme_pfa` | cerere-suspendare-activitate-pfa, contract-comodat-spatiu-firma, decizie-asociat-unic-srl, hotarare-aga-srl |
| `gdpr_protectia_datelor` | cerere-acces-date-personale, cerere-opozitie-prelucrare-date, cerere-stergere-date-personale |
| `imobiliare` | acord-arvuna-imobil, antecontract-vanzare-cumparare-imobil, notificare-neexecutare-antecontract-imobil, promisiune-unilaterala-vanzare-imobil |
| `imprumuturi_si_garantii` | contract-de-fidejusiune-garantie-personala, contract-imprumut-bani-intre-persoane-fizice, recunoastere-de-datorie |
| `locuinta` | acord-plata-utilitati, act-aditional-prelungire-inchiriere, cerere-restituire-garantie-inchiriere, contract-comodat-locuinta, contract-inchiriere-locuinta, inventar-bunuri-locuinta, notificare-majorare-chirie, notificare-reziliere-inchiriere-chirias, notificare-reziliere-inchiriere-proprietar, proces-verbal-predare-primire |
| `munca` | cerere-adeverinta-salariat, cerere-concediu-fara-plata, cerere-concediu-odihna, cerere-eliberare-copie-contract-munca, cerere-incetare-contract-munca-acord, cerere-program-flexibil, cerere-telemunca, demisie-cu-preaviz, demisie-fara-preaviz, foaie-pontaj-simpla, sesizare-itm |
| `succesiuni` | acord-iesire-din-indiviziune, cerere-dezbatere-succesiune-notar, declaratie-acceptare-succesiune, declaratie-renuntare-succesiune, testament-olograf |
| `vanzare_cumparare` | acord-restituire-avans, chitanta-simpla, contract-vanzare-cumparare-bun-mobil, declaratie-predare-suma, notificare-rezolutiune-contract, proces-verbal-predare-bun-mobil, promisiune-vanzare-cumparare-bun-mobil |

## Licenta

MIT — liber pentru orice utilizare personala sau comerciala.
