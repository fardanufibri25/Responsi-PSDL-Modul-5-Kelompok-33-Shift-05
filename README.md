# Responsi Sistem Digital Lanjut — FSM Moore dan FSM Mealy

## 1. Proyek FSM Moore

**Judul:** Sistem Deteksi Pola Kode Akses `1011` Berbasis FSM Moore

**Folder:** `Moore_1011`

### File yang Digunakan

| File | Keterangan |
|---|---|
| `top.v` | Modul top-level |
| `fsm_moore.v` | Implementasi FSM Moore |
| `display.v` | Driver seven segment |
| `clock_divider.v` | Pembagi frekuensi clock |
| `debouncer.v` | Debouncer tombol |
| `constraint.xdc` | Constraint pin FPGA |

### Cara Uji

1. Tekan **BTND** untuk reset.
2. Atur **SW0** sesuai urutan: `1 → 0 → 1 → 1`.
3. Setelah setiap input SW0, tekan **BTNC** untuk perpindahan state.
4. Output `y` pada **LED LD0** akan bernilai `1` setelah pola `1011` terdeteksi.

---

## 2. Proyek FSM Mealy

**Judul:** Sistem Deteksi Pola Sinyal `1101` Berbasis FSM Mealy

**Folder:** `Mealy_1101`

### File yang Digunakan

| File | Keterangan |
|---|---|
| `top.v` | Modul top-level |
| `fsm_mealy.v` | Implementasi FSM Mealy |
| `display.v` | Driver seven segment |
| `clock_divider.v` | Pembagi frekuensi clock |
| `debouncer.v` | Debouncer tombol |
| `constraint.xdc` | Constraint pin FPGA |

### Cara Uji

1. Tekan **BTND** untuk reset.
2. Atur **SW0** sesuai urutan: `1 → 1 → 0 → 1`.
3. Setelah setiap input SW0, tekan **BTNC** untuk perpindahan state.
4. Output `y` pada **LED LD0** akan langsung bernilai `1` saat input terakhir `1` dibaca pada state yang sesuai.

---

## Tampilan Seven Segment

Tampilan menggunakan format:

```
wXyXStXX
```
