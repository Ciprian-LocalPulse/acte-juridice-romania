"""
    FirmePfa

Modul pentru categoria: firme-pfa
Contine 4 template-uri de documente juridice romanesti.
"""
module FirmePfa

export lista_documente, obtine_template, genereaza_document

"""Dictionar cu toate template-urile din aceasta categorie."""
const TEMPLATES = Dict{String, String}(
    "cerere-suspendare-activitate-pfa" => """# Cerere de suspendare a activitatii PFA

## Cand se foloseste

Pentru a solicita suspendarea temporara a activitatii unei persoane fizice autorizate (PFA), de exemplu in perioade fara venituri sau fara activitate. Suspendarea se inregistreaza la Registrul Comertului si poate avea efecte si asupra obligatiilor declarative/fiscale la ANAF; verifica si obligatiile specifice la ANAF pentru perioada de suspendare.

## Model

Catre: Oficiul Registrului Comertului de pe langa Tribunalul [JUDET]

Subsemnatul/Subsemnata [NUME TITULAR PFA], CNP [CNP], domiciliat(a) in [ADRESA], titular al PFA [DENUMIRE PFA], CUI [CUI], inregistrata la Registrul Comertului sub numarul [NUMAR ORC],

solicit suspendarea temporara a activitatii PFA mentionate, pe perioada [DATA INCEPUT] - [DATA SFARSIT] / pana la data de [DATA], conform prevederilor legale aplicabile.

Anexez prezentei cereri:

- Copie certificat de inregistrare PFA;
- Copie act de identitate;
- [ALTE DOCUMENTE SOLICITATE DE REGISTRUL COMERTULUI, DACA EXISTA].

Va rog sa dispuneti inregistrarea mentiunii de suspendare temporara a activitatii.

Data: [DATA]

Semnatura: ____________________

## Checklist

- [ ] Perioada de suspendare este clar mentionata (data inceput si sfarsit, sau termen determinat).
- [ ] Ai verificat documentele si taxele specifice solicitate de Registrul Comertului pentru aceasta mentiune.
- [ ] Ai verificat si la ANAF ce obligatii declarative/fiscale subzista pe perioada suspendarii.
- [ ] Pastrezi o copie a cererii depuse si a dovezii de inregistrare a mentiunii.
""",
    "contract-comodat-spatiu-firma" => """# Contract de comodat pentru spatiu (sediu social/punct de lucru)

## Cand se foloseste

Pentru a pune la dispozitia unei firme (SRL, PFA) un spatiu, cu titlu gratuit, in vederea stabilirii sediului social sau a unui punct de lucru. Folosit frecvent cand asociatul/administratorul pune la dispozitie un imobil proprietate personala pentru sediul propriei firme, sau cand o firma pune la dispozitia alteia un spatiu fara chirie. Documentul este necesar, de regula, pentru dosarul de inregistrare/modificare sediu la Registrul Comertului.

## Model

Incheiat astazi, [DATA], in [LOCALITATE].

### 1. Partile

Comodant (proprietar): [NUME/DENUMIRE], CNP/CUI [CNP/CUI], domiciliat/cu sediul in [ADRESA].

Comodatar (firma beneficiara): [DENUMIRE SOCIETATE/PFA], CUI [CUI], reprezentata prin [NUME REPREZENTANT], in calitate de [FUNCTIE].

### 2. Obiectul contractului

Comodantul pune la dispozitia comodatarului, cu titlu gratuit, spatiul situat in [ADRESA COMPLETA], compus din [DESCRIERE - SUPRAFATA, NUMAR CAMERE], in vederea stabilirii [SEDIULUI SOCIAL/PUNCTULUI DE LUCRU] al comodatarului.

### 3. Durata

Comodatul se incheie pe perioada [DATA INCEPUT] - [DATA SFARSIT] / pe durata nedeterminata, cu posibilitatea denuntarii de catre comodant cu un preaviz de [NUMAR] zile.

### 4. Destinatia spatiului

Spatiul va fi folosit exclusiv pentru activitatea de [DESCRIERE ACTIVITATE], comodatarul obligandu-se sa nu schimbe destinatia fara acordul scris al comodantului.

### 5. Cheltuieli

Cheltuielile de intretinere curenta (utilitati, daca este cazul) sunt suportate de [COMODANT/COMODATAR, conform celor convenite].

### 6. Obligatiile comodatarului

Comodatarul se obliga sa foloseasca spatiul cu buna-credinta, sa respecte normele legale aplicabile activitatii desfasurate si sa restituie spatiul la incetarea contractului, in starea in care l-a primit, in afara de uzura normala.

### 7. Incetarea contractului

Contractul inceteaza la termen, prin acordul partilor sau prin denuntare unilaterala cu respectarea preavizului mentionat. La incetare, comodatarul se obliga sa efectueze demersurile necesare pentru schimbarea sediului social/punctului de lucru la Registrul Comertului.

Semnaturi:

Comodant: ____________________

Comodatar (prin reprezentant): ____________________

## Checklist

- [ ] Adresa spatiului este completa si corespunde cu cea care va fi inregistrata la Registrul Comertului.
- [ ] Durata contractului este clara; pentru sediu social, verifica daca Registrul Comertului solicita o durata minima.
- [ ] Este clar cine suporta utilitatile si cheltuielile curente.
- [ ] Reprezentantul firmei comodatare are calitatea de a semna (administrator/imputernicit).
- [ ] Ai verificat documentele suplimentare cerute de Registrul Comertului pentru stabilirea sediului (de exemplu acordul vecinilor/asociatiei, daca spatiul este intr-un bloc de locuinte).
""",
    "decizie-asociat-unic-srl" => """# Decizia asociatului unic al SRL

## Cand se foloseste

Pentru a consemna o decizie luata de asociatul unic al unui SRL, in lipsa unei adunari generale (care nu este necesara cand exista un singur asociat). Folosita frecvent pentru aprobarea bilantului anual, schimbarea sediului, numirea/revocarea administratorului, distribuirea de dividende sau alte decizii care, la SRL cu mai multi asociati, ar necesita o hotarare AGA. Verifica actul constitutiv al societatii pentru eventuale cerinte specifice de forma.

## Model

Subsemnatul/Subsemnata [NUME ASOCIAT UNIC], CNP [CNP], domiciliat(a) in [ADRESA], in calitate de asociat unic al societatii [DENUMIRE SOCIETATE], cu sediul in [SEDIU SOCIAL], inregistrata la Registrul Comertului sub numarul [NUMAR ORC], avand CUI [CUI],

in exercitarea atributiilor conferite de actul constitutiv si de legea societatilor, decid urmatoarele:

### 1. Obiectul deciziei

[DESCRIE DECIZIA - DE EXEMPLU: APROBAREA SITUATIILOR FINANCIARE ANUALE PENTRU EXERCITIUL [AN]; SCHIMBAREA SEDIULUI SOCIAL IN [ADRESA NOUA]; NUMIREA/REVOCAREA ADMINISTRATORULUI [NUME]; DISTRIBUIREA DE DIVIDENDE IN SUMA DE [SUMA]].

### 2. Data de la care decizia produce efecte

Prezenta decizie produce efecte de la data de [DATA] / de la data inregistrarii mentiunii corespunzatoare la Registrul Comertului, daca este necesara o astfel de inregistrare.

### 3. Mandatarea pentru formalitati

Imputernicesc pe [NUME PERSOANA/REPREZENTANT, DACA ESTE CAZUL] sa efectueze toate formalitatile necesare pentru inregistrarea prezentei decizii la Oficiul Registrului Comertului si la orice alta institutie relevanta.

Data: [DATA]

Semnatura asociat unic: ____________________

## Checklist

- [ ] Decizia este descrisa clar si concret, fara ambiguitati.
- [ ] Ai verificat daca decizia necesita si inregistrare/mentiune la Registrul Comertului.
- [ ] Pentru decizii care modifica actul constitutiv (sediu, obiect de activitate, capital social), verifica daca este necesara forma autentica sau atestarea de un avocat/notar.
- [ ] Decizia este datata si semnata de asociatul unic.
- [ ] Documentul este arhivat alaturi de celelalte hotarari ale societatii, pentru evidenta.
""",
    "hotarare-aga-srl" => """# Hotararea adunarii generale a asociatilor (AGA) - SRL

## Cand se foloseste

Pentru a consemna o decizie luata de asociatii unui SRL cu mai multi asociati, in cadrul adunarii generale, conform actului constitutiv si legii societatilor. Folosita pentru aprobarea bilantului, modificari ale actului constitutiv, numirea/revocarea administratorilor, distribuirea dividendelor si alte decizii care necesita votul asociatilor. Verifica in actul constitutiv cvorumul si majoritatea necesare pentru tipul de decizie avut in vedere.

## Model

Incheiata astazi, [DATA], la sediul societatii [DENUMIRE SOCIETATE] din [SEDIU SOCIAL] / la adresa [ALTA LOCATIE, daca este cazul].

### 1. Participanti

Asociatii societatii [DENUMIRE SOCIETATE], CUI [CUI], inregistrata la Registrul Comertului sub numarul [NUMAR ORC], prezenti la adunare:

- [NUME ASOCIAT 1], detinator a [PROCENT]% din capitalul social;
- [NUME ASOCIAT 2], detinator a [PROCENT]% din capitalul social;
- [ADAUGA TOTI ASOCIATII PREZENTI].

Se constata ca este intrunit cvorumul necesar conform actului constitutiv pentru adoptarea hotararilor de mai jos.

### 2. Ordinea de zi

- [PUNCT 1 - DE EXEMPLU APROBAREA SITUATIILOR FINANCIARE PENTRU EXERCITIUL [AN]];
- [PUNCT 2 - DE EXEMPLU NUMIREA/REVOCAREA ADMINISTRATORULUI];
- [ADAUGA TOATE PUNCTELE DE PE ORDINEA DE ZI].

### 3. Hotarari adoptate

Cu privire la fiecare punct de pe ordinea de zi, asociatii hotarasc:

- Punctul 1: [DECIZIA ADOPTATA], cu un vot de [PROCENT/NUMAR VOTURI] pentru, [PROCENT/NUMAR VOTURI] impotriva, [PROCENT/NUMAR VOTURI] abtineri;
- Punctul 2: [DECIZIA ADOPTATA], cu votul de mai sus.

### 4. Mandatarea pentru formalitati

Asociatii imputernicesc pe [NUME PERSOANA/ADMINISTRATOR] sa efectueze toate formalitatile necesare pentru inregistrarea prezentei hotarari la Oficiul Registrului Comertului si la orice alta institutie relevanta.

Semnaturi:

[NUME ASOCIAT 1]: ____________________

[NUME ASOCIAT 2]: ____________________

## Checklist

- [ ] Este verificat cvorumul si majoritatea necesara conform actului constitutiv, in functie de tipul deciziei.
- [ ] Toti asociatii prezenti sunt mentionati, cu procentul detinut din capitalul social.
- [ ] Fiecare punct de pe ordinea de zi are o decizie clara si rezultatul votului consemnat.
- [ ] Pentru modificari ale actului constitutiv, ai verificat daca este necesara o forma speciala (act aditional, atestare de avocat, autentificare notariala).
- [ ] Hotararea este semnata de toti asociatii prezenti / de presedintele adunarii, conform regulilor societatii.
"""
)

"""
    lista_documente() -> Vector{String}

Returneaza lista numelor tuturor documentelor disponibile in aceasta categorie.
"""
function lista_documente()
    return collect(keys(TEMPLATES))
end

"""
    obtine_template(nume::String) -> String

Returneaza continutul brut al template-ului cu numele dat.
Arunca `KeyError` daca documentul nu exista.
"""
function obtine_template(nume::String)
    if !haskey(TEMPLATES, nume)
        available = join(sort(collect(keys(TEMPLATES))), "\n  - ")
        error("Document \"$nume\" inexistent.\nDisponibile:\n  - $available")
    end
    return TEMPLATES[nume]
end

"""
    genereaza_document(nume::String, campuri::Dict{String,String}) -> String

Genereaza un document completat prin inlocuirea campurilor `[CAMP]` cu valorile din dictionar.

# Exemplu
```julia
doc = genereaza_document("cerere-suspendare-activitate-pfa", Dict(
    "DATA" => "20.06.2026",
    "LOCALITATE" => "Piatra Neamt"
))
```
"""
function genereaza_document(nume::String, campuri::Dict{String,String})
    template = obtine_template(nume)
    result = template
    for (camp, valoare) in campuri
        result = replace(result, "[$camp]" => valoare)
    end
    return result
end

end # module