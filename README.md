# GitHub Security Demo – Python + FastAPI

Dieses Repository ist ein **minimales Beispielprojekt**, das zeigt, wie man für eine kleine Python-/FastAPI-Anwendung eine einfache **CI/CD-Pipeline mit Security-Fokus** auf GitHub aufsetzt.

Die Pipeline umfasst:

- **Build & Tests**
  - Linting mit **ruff**
  - Tests mit **pytest**
- **SAST** – statische Codeanalyse mit **GitHub CodeQL**
- **SCA** – Dependency-Scan mit **pip-audit**
- **DAST** – dynamische Analyse mit **OWASP ZAP Baseline Scan**

---

## Inhalt

- [Projektstruktur](#projektstruktur)
- [Voraussetzungen](#voraussetzungen)
- [Lokales Setup](#lokales-setup)
  - [Repository klonen](#repository-klonen)
  - [Virtuelle Umgebung](#virtuelle-umgebung)
  - [Installation der Abhängigkeiten](#installation-der-abhängigkeiten)
  - [App lokal starten](#app-lokal-starten)
  - [Tests lokal ausführen](#tests-lokal-ausführen)
  - [Linting lokal ausführen](#linting-lokal-ausführen)
- [CI/CD mit GitHub Actions](#cicd-mit-github-actions)
  - [Workflow-Übersicht](#workflow-übersicht)
  - [Job: Test & Lint (`test-and-lint`)](#job-test--lint-test-and-lint)
  - [Job: SAST mit CodeQL (`sast-codeql`)](#job-sast-mit-codeql-sast-codeql)
  - [Job: SCA mit pip-audit (`sca-pip-audit`)](#job-sca-mit-pip-audit-sca-pip-audit)
  - [Job: DAST mit OWASP ZAP (`dast-owasp-zap`)](#job-dast-mit-owasp-zap-dast-owasp-zap)
  - [Wie die Jobs zusammenspielen](#wie-die-jobs-zusammenspielen)
  - [Wo finde ich die Ergebnisse?](#wo-finde-ich-die-ergebnisse)
- [Anpassungen für eigene Projekte](#anpassungen-für-eigene-projekte)

---

## Projektstruktur

```text
.
├── app.py
├── pyproject.toml
├── tests
│   └── test_app.py
└── .github
    └── workflows
        └── security.yml
```

## Kurzbeschreibung

```text
Kurzbeschreibung

app.py
Minimaler FastAPI-Service mit einem GET / Endpoint.

tests/test_app.py
Ein pytest-Test, der den Endpoint prüft.

pyproject.toml
Projekt- und Build-Konfiguration, inkl. Dependencies, pytest und ruff.

.github/workflows/security.yml
GitHub Actions Workflow für CI + Security (SAST, SCA, DAST).
```

## Setup

### Windows
```shell
python -m venv .venv
.venv\Scripts\Activate
```
### macOS / Linux:
```shell
python3 -m venv .venv
source .venv/bin/activate
```

### Verwendung von pyproject.toml
```shell
# Basis + Dev-Dependencies (pytest, ruff)
pip install -e .[dev]
```

## Start App
```sh
uvicorn app:app --reload --port 8000
```
App-Objekt: app in app.py

URL: http://127.0.0.1:8000/

Swagger UI: http://127.0.0.1:8000/docs

## Tests and Linting

Tests starten

```shell
pytest
```

Linting lokal ausführen

```shell
ruff check .
```
