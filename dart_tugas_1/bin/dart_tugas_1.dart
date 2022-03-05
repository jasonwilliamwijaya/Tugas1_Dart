import 'dart:io';
import 'dart:convert';

void main() {
  stdout.write("Masukkan ukuran pola : ");
  String? inputn = stdin.readLineSync();
  int n = int.parse(inputn!);

  //print pola untuk ganjil
  if (n % 2 == 1) {
    //penanda berhenti print angka kekanan sebanyak berapa kali didalam loop
    int banyak_print_kolom = -1;
    //counter print angka kekanan sebanyak berapa kali didalam loop
    int counter = 0;
    //counter print angka
    int count_angka = 1;

    //.ceil untuk pembulatan karena int disini jadi float tidak lgsg dibulatkan keatas
    // print((n / 2).ceil());

    //print semua baris dari 1 sampai n/2
    for (int i = 1; i <= (n / 2).ceil(); i++) {
      for (int j = 1; j <= n; j++) {
        //mencari index angka paling pertama dalam setiap baris untuk di print
        if (j == (n / 2).ceil() - (i - 1) && banyak_print_kolom == -1) {
          //buat print angka increment kebawah sekalian mereset kembali ke 1 apabila baris kebawah lebih dari 9
          stdout.write(((count_angka - 1) % 9) + 1);
          banyak_print_kolom = (i - 1) * 2;
        }
        //print sisa angka dan spasi pada baris saat itu
        else if (banyak_print_kolom != -1 && counter < banyak_print_kolom) {
          counter = counter + 1;

          //print angka
          if (counter % 2 == 0) {
            //buat print angka increment kebawah sekalian mereset kembali ke 1 apabila baris kebawah lebih dari 9
            stdout.write(((count_angka - 1) % 9) + 1);
          }
          //print spasi
          else if (counter % 2 == 1) {
            //buat print angka increment kebawah sekalian mereset kembali ke 1 apabila baris kebawah lebih dari 9
            stdout.write(" ");
          }
        }
        //print bintang
        else {
          stdout.write("*");
        }
      }
      counter = 0;
      count_angka = count_angka + 1;
      banyak_print_kolom = -1;
      print("");
    }

    //penanda berhenti print angka kekanan sebanyak berapa kali didalam loop
    banyak_print_kolom = -1;
    //counter print angka kekanan sebanyak berapa kali didalam loop
    counter = 0;

    //print semua baris dari n/2 + 1 sampai n
    for (int i = (n / 2).ceil() - 1; i >= 1; i--) {
      for (int j = 1; j <= n; j++) {
        //mencari index angka paling pertama dalam setiap baris untuk di print
        if (j == (n / 2).ceil() - (i - 1) && banyak_print_kolom == -1) {
          //buat print angka increment kebawah sekalian mereset kembali ke 1 apabila baris kebawah lebih dari 9
          stdout.write(((count_angka - 1) % 9) + 1);
          banyak_print_kolom = (i - 1) * 2;
        }
        //print sisa angka dan spasi pada baris saat itu
        else if (banyak_print_kolom != -1 && counter < banyak_print_kolom) {
          counter = counter + 1;

          //print angka
          if (counter % 2 == 0) {
            //buat print angka increment kebawah sekalian mereset kembali ke 1 apabila baris kebawah lebih dari 9
            stdout.write(((count_angka - 1) % 9) + 1);
          }
          //print spasi
          else if (counter % 2 == 1) {
            //buat print angka increment kebawah sekalian mereset kembali ke 1 apabila baris kebawah lebih dari 9
            stdout.write(" ");
          }
        }
        //print bintang
        else {
          stdout.write("*");
        }
      }
      counter = 0;
      count_angka = count_angka + 1;
      banyak_print_kolom = -1;
      print("");
    }
  }
  //print pola untuk genap
  else if (n % 2 == 0) {
    int inkremen_kiri = 1;
    int dekremen_kanan = n;

    if (n > 9) {
      dekremen_kanan = 9;
    }

    for (int i = 1; i <= n; i++) {
      //loop kiri
      for (int j = 1; j <= n; j++) {
        if (j <= n - (i - 1)) {
          stdout.write(inkremen_kiri);
          inkremen_kiri = inkremen_kiri + 1;
          if (inkremen_kiri > n || inkremen_kiri > 9) {
            inkremen_kiri = 1;
          }
        } else if (j > n - (i - 1)) {
          stdout.write(" ");
        }
      }

      //loop kanan
      for (int k = n; k >= 1; k--) {
        if (k <= n - (i - 1)) {
          stdout.write(dekremen_kanan);
          dekremen_kanan = dekremen_kanan - 1;
          if (dekremen_kanan == 0) {
            if (n > 9) {
              dekremen_kanan = 9;
            } else {
              dekremen_kanan = n;
            }
          }
        } else if (k > n - (i - 1)) {
          stdout.write(" ");
        }
      }

      print("");
    }
  }
}
