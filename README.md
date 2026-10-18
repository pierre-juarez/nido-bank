# Nido App

App de banca hipotecaria hecha con Flutter.

## Prototipo clickable

👉 [Ver prototipo clickable](https://pierrejuarez.dev/portafolio/nido)

## Desarrollo

```bash
flutter pub get
flutter run
```

### Device Preview (web)

La app usa [device_preview](https://pub.dev/packages/device_preview), activo solo en web (`kIsWeb`), para ver la app en distintos dispositivos.

```bash
flutter run -d chrome
```

## Deploy

El workflow [.github/workflows/deploy.yml](.github/workflows/deploy.yml) compila la versión web y la publica en GitHub Pages en cada push a la rama `design-preview`.

Requiere Settings → Pages → Source: "GitHub Actions".

## TODO

- [ ] Agregar splash screen
