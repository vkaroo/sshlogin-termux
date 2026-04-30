# VPS Connect — Minimal Termux SSH Client

**SSH-only Termux build** — no package manager, no Python/Node/Go, no widget, no notification. Just terminal + SSH.

---

## 📦 What's Included

| Component | Status |
|-----------|--------|
| Terminal emulator | ✅ |
| SSH client | ✅ |
| Session manager | ✅ |
| File browser | ✅ |
| `apt` / `pkg` | ❌ Removed |
| Python / Node.js / Go / Rust | ❌ Removed |
| Widget / Notification / Boot | ❌ Removed |
| Termux:API | ❌ Removed |

**APK size**: ~8–12 MB (debug build)  
**Based on**: Termux v0.118.3

---

## 🚀 Quick Start

1. Download `app-debug.apk` dari [GitHub Releases](https://github.com/xfile29/sshlogin-termux/releases) atau [Actions artifacts](https://github.com/xfile29/sshlogin-termux/actions).
2. Install di Android (enable "Unknown sources").
3. Buka app → tap **+** → **New session** → pilih **SSH**.
4. Masukkan:
   - Host: `<VPS_IP>`
   - Port: `22`
   - Username: `<user>`
5. Import SSH key: Settings → SSH keys → Import from storage (`~/.ssh/id_rsa`).
6. Connect.

---

## 🔧 Build from Source

### GitHub Actions (otomatis)

- Push ke `main` → build debug APK (artifacts 30 days).
- Create tag `v*` → auto-release APK di GitHub Releases.

### Manual build (local)

```bash
git clone --recursive https://github.com/xfile29/sshlogin-termux.git
cd sshlogin-termux
./scripts/build.sh
# APK: termux-app/app/build/outputs/apk/debug/app-debug.apk
```

---

## 📱 Usage Tips

- **SSH keys**: copy private key ke phone (via USB/DSM), import via app settings.
- **Port forwarding**: tambahkan `-L` / `-R` di command when creating session.
- **Multiple hosts**: save sebagai "bookmark" di app.
- **Theme**: Settings → Appearance → Dark (default).

---

## 🔐 Security

- No telemetry
- No background services
- No network access except SSH (when connected)
- Keys stored in app private storage only

---

## 🛠️ Development

Project structure:
```
sshlogin-termux/
├── termux-app/          # Termux source (git submodule)
├── patches/
│   ├── 01-minimal-manifest.patch   # strip unused activities
│   ├── 02-remove-packages.patch    # remove apt/pkg paths
│   ├── 03-strings.patch            # rename app
│   └── 04-icons.patch              # (optional) custom icons
├── scripts/
│   └── build.sh                     # local build helper
└── .github/
    └── workflows/
        └── build.yml                # CI for arm64 & x86
```

Build dependencies: JDK 11, Android SDK, Gradle.

---

## 📄 License

Based on Termux (GPLv3). All modifications also GPLv3.
