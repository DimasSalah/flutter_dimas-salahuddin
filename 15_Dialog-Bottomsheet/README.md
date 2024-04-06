# Summarry Alert Dialog dan Bottom Sheet;
## Alert Dialog
- Menginformasikan pengguna tentang situasi tertentu
- Bisa digunakan untuk mendapatkan input dari user
- Membutuhkan helper method showDialog



#### Contoh Penggunaan Alert Dialog
Penggunaan alert Dialog pada sebuah function button
```dart
onPressed: () {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
            content: const Text('Are you sure?'),
            actions: [
                TextButton(
                    onPressed: () {
                        Navigator.pop(context);
                    },
                    child: const Text('NO');
                ),
                TextButton(
                    onPressed: onPressed,
                    child: const Text('YES');
                ),
            ]
        )
    )
}
```

## Bottom Sheet
- bottomSheet tetapi muncul dari bawah layar aplikasi
- membutuhkan 2 properti yaitu context dan builder

#### Contoh Membuat Bottom Sheet

```dart
onPressed: () {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
                top: Radius.circular(20),
            ),
        ),
        context: context,
        builder: (context) => Container(),
    );
}
```