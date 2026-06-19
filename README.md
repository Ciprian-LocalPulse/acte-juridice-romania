# Acte Juridice Romania

<p align="center">
  <img alt="Acte Juridice Romania" src="https://capsule-render.vercel.app/api?type=waving&height=220&color=0:0f766e,50:2563eb,100:7c3aed&text=Acte%20Juridice%20Romania&fontColor=ffffff&fontSize=42&fontAlignY=38&desc=Modele%20gratuite%20de%20documente%20romanesti,%20organizate%20si%20usor%20de%20adaptat&descAlignY=58&descSize=16">
</p>

<p align="center">
  <a href="./LICENSE"><img alt="License" src="https://img.shields.io/badge/licenta-MIT-111827?style=for-the-badge"></a>
  <a href="./docs/surse-oficiale.md"><img alt="Surse oficiale" src="https://img.shields.io/badge/surse-oficiale-0f766e?style=for-the-badge"></a>
  <a href="./CONTRIBUTING.md"><img alt="Contributii" src="https://img.shields.io/badge/PR--uri-binevenite-2563eb?style=for-the-badge"></a>
  <a href="./DONATE.md"><img alt="Sustine proiectul" src="https://img.shields.io/badge/sustine-cercetarea-7c3aed?style=for-the-badge"></a>
</p>

> Biblioteca gratuita de modele pentru documente juridice si acte uzuale din Romania: locuinta, munca, afaceri, familie, administrativ si vanzare-cumparare.

## Important

Aceste documente sunt modele educationale si puncte de pornire. Nu sunt consultanta juridica, fiscala sau notariala si nu inlocuiesc verificarea cu un avocat, notar, consultant fiscal sau institutie competenta. Legislatia se poate schimba; verifica mereu sursele oficiale inainte de folosire.

## De ce exista

Internetul romanesc este plin de formulare vechi, pagini cu reclame agresive si modele platite pentru acte simple. Acest repository isi propune sa ofere un punct de start curat, gratuit, versionat si verificabil pentru oameni care vor sa inteleaga ce trebuie sa contina un document.

## Categorii

| Categorie | Documente incluse | Status |
| --- | --- | --- |
| Locuinta | Contract inchiriere, comodat, proces-verbal predare | Draft util |
| Munca | Cerere concediu, adeverinta salariat, cerere incetare CIM | Draft util |
| Afaceri | Prestari servicii, NDA simplu, proces-verbal receptie | Draft util |
| Familie | Procura simpla, declaratie pe proprie raspundere | Draft util |
| Administrativ | Cerere generica ANAF, petitie institutie publica | Draft util |
| Vanzare-cumparare | Bun mobil, predare-primire, chitanta | Draft util |

## Start rapid

1. Alege categoria din `templates/`.
2. Copiaza modelul potrivit intr-un document nou.
3. Inlocuieste campurile marcate cu `[PARANTEZE]`.
4. Citeste checklist-ul din acelasi fisier.
5. Verifica sursele oficiale din `docs/surse-oficiale.md`.
6. Pentru sume mari, imobile, minori, mosteniri, litigii sau situatii fiscale complexe, cere verificare profesionala.

## Structura repository-ului

```text
.
├─ templates/
│  ├─ administrativ/
│  ├─ afaceri/
│  ├─ familie/
│  ├─ locuinta/
│  ├─ munca/
│  └─ vanzare-cumparare/
├─ docs/
│  ├─ avertisment-juridic.md
│  ├─ ghid-adaptare.md
│  └─ surse-oficiale.md
├─ .github/
│  ├─ ISSUE_TEMPLATE/
│  └─ FUNDING.yml
└─ CONTRIBUTING.md
```

## Reguli de calitate

- Fiecare model trebuie sa aiba scop clar, campuri editabile si checklist.
- Nu copiem formulare proprietare sau continut platit.
- Nu promitem ca un model este potrivit pentru toate situatiile.
- Pastram linkuri catre surse oficiale acolo unde exista.
- Marcăm documentele care necesita notar, avocat sau verificare fiscala.

## Sustine proiectul

Daca repository-ul te-a ajutat, poti sustine cercetarea, actualizarea si organizarea documentelor:

<p align="center">
  <a href="./DONATE.md"><img alt="Doneaza" src="https://img.shields.io/badge/Doneaza%20pentru%20cercetare-111827?style=for-the-badge&logo=githubsponsors&logoColor=white"></a>
  <a href="https://github.com/sponsors/Ciprian-LocalPulse"><img alt="GitHub Sponsors" src="https://img.shields.io/badge/GitHub%20Sponsors-7c3aed?style=for-the-badge&logo=githubsponsors&logoColor=white"></a>
</p>

Orice donatie ajuta la verificarea surselor, adaugarea de modele noi si mentenanta proiectului.

## Roadmap

- [ ] Versiuni `.docx` pentru cele mai folosite documente.
- [ ] Generator simplu de documente cu intrebari si campuri.
- [ ] Index pe situatii reale: chirias, proprietar, PFA, SRL, salariat.
- [ ] Verificare periodica a linkurilor oficiale.
- [ ] Workflow GitHub Actions pentru verificari automate, dupa activarea scope-ului `workflow` in GitHub CLI.
- [ ] Traduceri partiale RO/EN pentru documente business.

## Contribuie

Vezi [CONTRIBUTING.md](./CONTRIBUTING.md). Sunt binevenite corecturi, modele noi, actualizari legislative documentate si linkuri catre surse oficiale.
