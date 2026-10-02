# HDI_ORDA_Pessimistic_Lock

![4D](https://img.shields.io/badge/4D-21-blue) ![platform](https://img.shields.io/badge/platform-macOS%20%7C%20Windows-lightgrey) ![license](https://img.shields.io/badge/license-MIT-green)

**How do I work with pessimistic locking in ORDA?**

An interactive 4D "How Do I" (HDI) example. It walks through `entity.lock()`, `entity.save()` and `entity.unlock()`, and shows what happens when another process modifies the same entity.

## Overview

The demo opens an HDI splash window, then a five-step tutorial form. Each step has a button, an explanation and a success or failure message, so you can see how the lock status object changes.

| Step | Action | What it shows |
|------|--------|---------------|
| 1 | Another process locks and updates the contact | A second process locks the entity and changes its stamp |
| 2 | Save | `save()` fails because the entity is locked by another process |
| 3 | Lock | `lock()` returns `dk status locked` or `dk status stamp has changed` |
| 4 | Reload and lock | `lock(dk reload if stamp changed)` refreshes the entity and takes the lock |
| 5 | Save | `save()` succeeds, then `unlock()` releases the entity |

The returned status object is shown on screen (`status`, `statusText`, `lockKindText`, `lockInfo`).

## Features

- ORDA pessimistic locking: `lock()`, `unlock()`, `dk reload if stamp changed`, and the `dk status locked` and `dk status stamp has changed` status codes
- A second process (`PS_locker_and_updater`) that simulates a concurrent user
- Tutorial text stored in the `INFO` table and loaded into styled-text inputs
- Sample `Contact` data loaded from `Resources/contacts_data.json`
- English and Japanese UI through XLIFF
- Light and dark mode, and macOS Tahoe Liquid Glass buttons

## Requirements

- 4D 21 or later (`compatibilityVersion` 2101). The splash form declares a minimum version of 4D v17.
- macOS or Windows

## Getting started

1. Clone or download this repository.
2. Open `Project/HDI_ORDA_Pessimistic_Lock.4DProject` with 4D 21 or later.
3. Run the **Demo** menu item (**File > Demo**, `Cmd/Ctrl+K`). The `00_Start` method also runs on startup.
4. Follow the numbered steps in order. Don't click "Another process locks..." again before step 3.

On first run, empty tables are filled from `Resources/*.4ie` and `*.4si`, and the `Contact` table is rebuilt from `contacts_data.json`.

## Points of interest

| Topic | Where to look |
|-------|---------------|
| Lock, save and unlock calls | `Forms/HDI2/ObjectMethods/*.4dm` |
| Concurrent process that changes the stamp | `Methods/PS_locker_and_updater.4dm`, `Forms/LockForm/` |
| Startup pattern (window reuse, `CALL WORKER`, non-blocking `DIALOG`) | `Methods/00_Start.4dm`, `Forms/HDI/ObjectMethods/BtnDemo.4dm` |
| Passing state with `Form` instead of shared variables | `LockForm` receives `idToLock` via `DIALOG("LockForm"; {idToLock: ...})` |
| Theme-aware colours read at runtime | Hidden `refReloadedColour` and `refSavedColour` rectangles on `HDI2`, read with `OBJECT GET RGB COLORS` |
| Dark mode and Liquid Glass CSS | `Sources/styleSheets.css`, `Sources/styleSheets_mac.css` |
| Localisation | `Resources/{en,ja}.lproj/*.xlf` |

## Project structure

```
Project/Sources/
  Methods/          00_Start (entry point), PS_locker_and_updater, helpers
  Forms/HDI/        splash window
  Forms/HDI2/       tutorial form
  Forms/LockForm/   window shown by the concurrent process
  TableForms/       input and output forms for INFO and Contact
  menus.json        menu bar (standard actions)
  styleSheets*.css  dark mode and platform styling
Resources/
  en.lproj, ja.lproj   XLIFF (menus, per-form text, messages)
  *.4ie, *.4si         INFO and Contact seed data
  contacts_data.json   sample contacts
```

## Localisation

Strings use `:xliff:` references in forms and menus, and `Localized string` in code. XLIFF files are split by purpose: `menu`, one per form, `TableForms` and `messages`. Standard items such as File, Edit and Quit use 4D's built-in `Common*` resources.

## Appearance

- **Dark mode:** `"automatic"` and `"automaticAlternate"` colours, plus `prefers-color-scheme` rules in `styleSheets.css`.
- **Liquid Glass:** push buttons get their height from CSS (27px for `liquid-glass`, 23px for `mac-classic`) rather than from the form JSON.
- **Listboxes:** this project has none, so no listbox truncation or resizing settings apply.

## References

- [Locking entities with ORDA (4D blog)](https://blog.4d.com/locking-entities-with-orda/)
- [ORDA: entity locking](https://developer.4d.com/docs/ORDA/entities#entity-locking)
- [`entity.lock()`](https://developer.4d.com/docs/API/EntityClass#lock)
- [4D CSS stylesheets](https://developer.4d.com/docs/FormEditor/stylesheets)
- [XLIFF in 4D](https://developer.4d.com/docs/Project/localization)

## Origin

This project started as a 4D v17 binary database, originally distributed as an HDI example. It was converted to the project architecture with 4D 21, then modernised with GitHub Copilot.

- **Original download:** https://download.4d.com/Demos/4D_v17/HDI_ORDA_Pessimistic_Lock.zip

## License

[MIT](LICENSE)
